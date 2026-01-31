package com.community.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	
	private int no;
	private int boardNo;
	private String usersId;
	private String content;
	private Date regDate;
	
	private Users user;
	private Board board;
	
}
