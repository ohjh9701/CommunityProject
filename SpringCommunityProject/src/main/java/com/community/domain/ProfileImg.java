package com.community.domain;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProfileImg implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String url;
	private String usersId;
	
	//화면에서 파일을 받아야 한다.
	private MultipartFile picture;
	
}
