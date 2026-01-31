package com.community.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board {
	
	private int no;
	private String title;
	private String content;
	private Date regDate;
	private int goodPoint;
	private int badPoint;
	private String usersId;
	private Users user;
	
	private String searchType;
	private String keyword;
	
}
