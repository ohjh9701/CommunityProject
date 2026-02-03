package com.community.controller;

import java.io.File;
import java.io.FileInputStream;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.community.domain.ProfileImg;
import com.community.domain.Users;
import com.community.service.ProfileImgService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@MapperScan(basePackages = "com.community.mapper")
@RequestMapping("/community")
public class ProfileImgController {
	
	@Autowired
	private ProfileImgService profileImgService;

	// application.properties 에서 upload.path에 저장된 경로를 로딩한다.
	@Value("${upload.path}")
	private String uploadPath;
	
	@PostMapping("/updateProfileImg")
	public String itemUpdate(ProfileImg profileImg, Model model, HttpSession session) throws Exception {
		log.info("itemUpdate" + profileImg.toString());
		MultipartFile file = profileImg.getPicture();
		String oldUrl = null;
		ProfileImg oldprofileImg = profileImgService.read(profileImg);

		if (oldprofileImg != null) {
		    oldUrl = oldprofileImg.getUrl();
		}
		if (file != null && file.getSize() > 0) {
			// 기존의 있는 외부저장소에 있는 파일을 삭제
			oldUrl = oldprofileImg.getUrl();

			// 새로 등록 할 파일
			log.info("originalName: " + file.getOriginalFilename());
			log.info("size: " + file.getSize());
			log.info("contentType: " + file.getContentType());
			String createdFileName = uploadFile(file.getOriginalFilename(), file.getBytes());
			profileImg.setUrl(createdFileName);
			int count = profileImgService.update(profileImg);

				if (count > 0) {
			        // 1. 세션에서 로그인한 유저 정보 꺼내기
			        Users loginUser = (Users) session.getAttribute("loginUser");
			        
			        if (loginUser != null) {
			            // 2. 세션 객체의 프로필 이미지 경로를 '새로 만든 파일명'으로 교체
			            loginUser.setProfileImg(profileImg);
			            
			            // 3. 변경된 유저 객체를 세션에 다시 저장 (덮어쓰기)
			            session.setAttribute("loginUser", loginUser);
			            log.info("세션 이미지 정보 갱신 완료: " + profileImg.getUrl());
			        }

			        if (oldUrl != null) deleteFile(oldUrl);
			        model.addAttribute("message", "프로필 이미지 수정이 성공되었습니다.");
			        return "community/success";
		} else {
			profileImg.setUrl(oldprofileImg.getUrl());
			count = profileImgService.update(profileImg);
			if (count > 0) {
		        // 1. 세션에서 로그인한 유저 정보 꺼내기
		        Users loginUser = (Users) session.getAttribute("loginUser");
		        
		        if (loginUser != null) {
		            // 2. 세션 객체의 프로필 이미지 경로를 '새로 만든 파일명'으로 교체
		            loginUser.setProfileImg(profileImg);
		            
		            // 3. 변경된 유저 객체를 세션에 다시 저장 (덮어쓰기)
		            session.setAttribute("loginUser", loginUser);
		            log.info("세션 이미지 정보 갱신 완료: " + profileImg.getUrl());
		        }

		        if (oldUrl != null) deleteFile(oldUrl);
		        model.addAttribute("message", "프로필 이미지 수정이 성공되었습니다.");
		        return "community/success";
		    }
		}
		}
		model.addAttribute("message", "%s 프로필 이미지 수정이 실패되었습니다.");
		return "community/failed";
	}
	
	// 외부저장소 자료업로드 파일명생성후 저장
		// D:/upload/"../window/system.ini" 디렉토리 탈출공격(path tarversal)
		private boolean deleteFile(String fileName) throws Exception {
			if (fileName.contains("..")) {
				throw new IllegalArgumentException("잘못된 경로 입니다.");
			}
			File file = new File(uploadPath, fileName);
			return (file.exists() == true) ? (file.delete()) : (false);
		}


	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// 절대 중복되지 않는 문자열 생성 (uid = 862d7b48-2bcf-4003-afd3-21e53b05f02e)
		UUID uid = UUID.randomUUID();

		// createdFileName = 862d7b48-2bcf-4003-afd3-21e53b05f02e_image.jpg
		String createdFileName = uid.toString() + "_" + originalName;

		// D:/upload/862d7b48-2bcf-4003-afd3-21e53b05f02e_image.jpg
		File target = new File(uploadPath, createdFileName);

		// (파일내용 값이 있는 바이트배열) byte[] fileData 을
		// D:/upload/862d7b48-2bcf-4003-afd3-21e53b05f02e_image.jpg에 복사진행
		FileCopyUtils.copy(fileData, target);
		return createdFileName;
	}
	
	@ResponseBody
	@GetMapping("/display")
	// 객체 대신 @RequestParam으로 직접 파일명을 받습니다.
	public ResponseEntity<byte[]> displayFile(@RequestParam("url") String fileName) throws Exception {
	    log.info("displayFile - fileName: " + fileName); // 로그로 파일명이 찍히는지 확인!
	    
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    
	    try {
	        // 확장자 추출
	        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	        MediaType mType = getMediaType(formatName);
	        HttpHeaders headers = new HttpHeaders();
	        
	        // 경로 결합 (uploadPath와 파일명)
	        File targetFile = new File(uploadPath, fileName);
	        
	        if (!targetFile.exists()) {
	            log.error("파일이 존재하지 않습니다: " + targetFile.getAbsolutePath());
	            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	        }

	        in = new FileInputStream(targetFile);
	        
	        if (mType != null) {
	            headers.setContentType(mType);
	        }
	        
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
	    } catch (Exception e) {
	        log.error("이미지 표시 중 에러 발생", e);
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    } finally {
	        if (in != null) in.close();
	    }
	    return entity;
	}

	private MediaType getMediaType(String form) {
		String formatName = form.toUpperCase();
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}
	
	
}
