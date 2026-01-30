package com.community.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Users {
	
	private int no;
	private String id;
	private String password;
	private String nickName;
	private String email;
	@DateTimeFormat(pattern = "EEE MMM dd HH:mm:ss z yyyy")
	private Date regDate;
	
}
