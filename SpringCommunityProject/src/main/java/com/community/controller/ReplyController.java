package com.community.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.domain.Reply;
import com.community.service.ReplyService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Slf4j
@Controller
@RequestMapping("/community")
@MapperScan(basePackages = "com.community.mapper")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@PostMapping("/replies/insert")
	public String repliesInsert(Reply reply) {
		
		try {
			replyService.create(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/community/board/detail?no=" + reply.getBoardNo();
	}
	
	
	@PostMapping("/replies/delete")
	public String repliesDelete(Reply reply) {
		try {
			replyService.delete(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/community/board/detail?no=" + reply.getBoardNo();
	}
	
	
}
