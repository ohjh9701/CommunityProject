package com.community.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.domain.Board;
import com.community.domain.Paging;
import com.community.domain.Users;
import com.community.service.BoardService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



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
	
	@GetMapping("/board/detail")
	public String boardDetail(Board b, HttpSession session, Model model) {
		session.getAttribute("loginUSer");
		try {
			Board board = boardService.read(b);
			model.addAttribute("board",board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "community/board/detail";
	}
	
	@GetMapping("/board/updateForm")
	public String boardUpdateForm(Board b, HttpSession session, Model model) {
		session.getAttribute("loginUSer");
		Board board;
		try {
			board = boardService.read(b);
			model.addAttribute("board",board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/board/updateForm";
	}
	
	@PostMapping("/board/update")
	public String postMethodName(Board b, HttpSession session, Model model) {
		try {
			boardService.update(b);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message","입력하신 정보를 다시 확인해 주세요.");
			return "community/failed";
		}
		model.addAttribute("message","%d번의 게시글 수정이 완료되었습니다.".formatted(b.getNo()));
		return "community/success";
	}
	
	@GetMapping("/board/delete")
	public String boardDelete(Board b, HttpSession session, Model model) {
		session.getAttribute("loginUser");
		try {
			boardService.delete(b);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message","해당 게시글을 삭제하지 못했습니다.");
			return "community/failed";
		}
		model.addAttribute("message","%d번의 게시글 삭제가 완료되었습니다.".formatted(b.getNo()));
		return "community/success";
	}
	
	@GetMapping("/board/myList")
	public String boardMyList(@RequestParam(value = "page", defaultValue = "1") int page, Model model, HttpSession session) {
		Users loginUser = (Users) session.getAttribute("loginUser");
	    
	    Board board = new Board();
	    board.setUser(loginUser);
		// 1. 실제 DB에서 10개만 가져오기
		List<Board> list;
		int total;
		try {
			list = boardService.getMyListWithPaging(page, board);
			total = boardService.getMyTotalCount();
			Paging paging = new Paging(total, page);
			model.addAttribute("boardList", list);
			model.addAttribute("paging", paging);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "community/board/list";
	}
	

}
