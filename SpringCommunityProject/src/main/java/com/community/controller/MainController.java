package com.community.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.community.domain.Board;
import com.community.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/community")
@MapperScan(basePackages = "com.community.mapper")
public class MainController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/main")
	public String mainPage(Model model) {
	    // 최신글 5개 정도 가져오는 로직 필요
	    List<Board> mainList;
		try {
			mainList = boardService.getListWithPaging(1);
			model.addAttribute("boardList", mainList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	    return "community/main";
	}
	
}
