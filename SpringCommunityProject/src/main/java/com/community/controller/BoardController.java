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
import com.community.domain.Paging;
import com.community.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;


@Slf4j
@Controller
@RequestMapping("/community")
@MapperScan(basePackages = "com.community.mapper")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/board/list")
	public String boardList(@RequestParam(value = "page", defaultValue = "1") int page, Model model, HttpSession session) {
		session.getAttribute("loginUser");
		// 1. 실제 DB에서 10개만 가져오기
		List<Board> list;
		int total;
		try {
			list = boardService.getListWithPaging(page);
			total = boardService.getTotalCount();
			Paging paging = new Paging(total, page);
			model.addAttribute("boardList", list);
			model.addAttribute("paging", paging);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/board/list";
	}
	
	@GetMapping("/board/insertForm")
	public String boardInsertForm(HttpSession session) {
		session.getAttribute("loginUser");
		return "community/board/insertForm";
	}
	
	@PostMapping("/board/insert")
	public String boardInsert(Board board, HttpSession session, Model model) {
		session.getAttribute("loginUSer");
		try {
			boardService.create(board);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message","입력하신 정보를 다시 확인해 주세요.");
			return "community/failed";
		}
		model.addAttribute("message","%s님의 게시글 작성이 완료되었습니다.".formatted(board.getUsersId()));
		return "community/success";
	}
	
	

}
