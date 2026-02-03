package com.community.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.domain.ProfileImg;
import com.community.domain.Users;
import com.community.service.ProfileImgService;
import com.community.service.UsersService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/community")
@MapperScan(basePackages = "com.community.mapper")
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private ProfileImgService profileImgService;
	
	@GetMapping("/loginForm")
	public String UserLoginForm() {
		return "community/users/loginForm";
	}
	
	@PostMapping("/login")
	public String login(Users users, Model model, HttpSession session) {
		Users user;
		try {
			user = usersService.loginRead(users);
			session.setAttribute("loginUser", user);
			if(user != null) {
				model.addAttribute("message","%s님 환영합니다.".formatted(user.getNickName()));
				return "community/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","ID, PW를 확인해 주세요.");
		return "community/failed";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/community/main";
	}
	
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "community/users/joinForm";
	}
	
	@PostMapping("/join")
	public String postMethodName(Model model, Users users) {
		try {
			usersService.create(users);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message","입력하신 정보를 다시 확인해 주세요.");
			return "community/failed";
		}
		model.addAttribute("message","%s님 가입을 환영합니다.".formatted(users.getNickName()));
		return "community/success";
	}
	
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "community/users/findId";
	}
	
	@PostMapping("/findId")
	public String findId(Users users, Model model) {
		
		Users user;
		try {
			user = usersService.findId(users);
			model.addAttribute("message","회원님의 ID는 [ %s ] 입니다.".formatted(user.getId()));
			return "community/success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","입력하신 메일주소로 가입된 계정이 없습니다.");
		return "community/failed";
	}
	
	
	@GetMapping("/findPwForm")
	public String findPwForm() {
		return "community/users/findPw";
	}
	
	@PostMapping("/findPw")
	public String findPw(Users users, Model model) {
		Users user;
		try {
			user = usersService.findPw(users);
			return "community/users/updatePw";
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","입력하신 정보로 가입된 계정이 없습니다.");
		return "community/failed";
	}
	
	@PostMapping("/updatePw")
	public String updatePw(Users users, Model model) {
		log.info(users.toString());
		try {
			usersService.updatePw(users);
		} catch (Exception e) {
			model.addAttribute("message","다시 입력해 주세요.");
			return "community/failed";
		}
		model.addAttribute("message","회원님의 비밀번호가 재설정 되었습니다.");
		return "community/success";
	}
	
	
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session) {
	    // 1. 세션에서 로그인 정보 가져오기
	    Users loginUser = (Users) session.getAttribute("loginUser");
	    
	    if (loginUser == null) {
	        return "community/users/loginForm";
	    }
	    
	    session.setAttribute("loginUser", loginUser);
	    return "community/users/mypage";
	}
	
	@GetMapping("/updateUserForm")
	public String updateUserForm(HttpSession session) {
		session.getAttribute("loginUser");
		return "community/users/updateForm";
	}
	
	@PostMapping("/updateUser")
	public String updateUser(HttpSession session, Users users, Model model) {
		log.info(users.toString());
		try {
			usersService.update(users);
			session.setAttribute("loginUser", users);
		} catch (Exception e) {
			model.addAttribute("message","다시 입력해 주세요.");
			return "community/failed";
		}
		model.addAttribute("message","회원님의 정보가 변경 되었습니다.");
		return "community/success";
	}
	
	
}
