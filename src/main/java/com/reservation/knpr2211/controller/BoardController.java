package com.reservation.knpr2211.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.reservation.knpr2211.dto.BoardDto;
import com.reservation.knpr2211.service.BoardService;

@Controller
public class BoardController {
	
	private BoardService boardService;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	//예약 환불정책
	@RequestMapping("policy")
	public String policy() {
		return  "board/policy";
	}
	
	//자주하는 질문
	@RequestMapping("faq")
	public String faq() {
		return  "board/faq";
	}
	
	//리스트
	@GetMapping("/list")
	public String list(Model model, @RequestParam(value = "page", defaultValue = "1") Integer pageNum) {
		List<BoardDto> boardDtoList = boardService.getBoardlist(pageNum);
		Integer[] pageList = boardService.getPageList(pageNum);
		
		model.addAttribute("boardList", boardDtoList);
		model.addAttribute("pageList", pageList);
		return "board/list";
	}
	
	//묻고 답하기 
	@GetMapping("/post")
	public String write() {
		return "board/write";
	}
	@PostMapping("/post")
	public String write(BoardDto boardDto) {
		boardService.savePost(boardDto);
		return "redirect:/list";
	}
	
	//상세페이지
	@GetMapping("/post/{no}")
	public String detail(@PathVariable("no") Long bno, Model model) {
		BoardDto boardDto = boardService.getPost(bno);
		model.addAttribute("boardDto", boardDto);
		return "board/detail";
	}
	//수정
	@GetMapping(value="/post/edit/{no}")
	public String edit(@PathVariable("no") Long bno, Model model) {
		BoardDto boardDto = boardService.getPost(bno);
		model.addAttribute("boardDto", boardDto);
		return "board/update";
	}
	@PutMapping("/post/edit/{no}")
	public String update(BoardDto boardDto) {
		boardService.savePost(boardDto);
		return "redirect:/list";
	}
	
	//삭제
	@DeleteMapping("/post/{no}")
	public String delete(@PathVariable("no") Long bno) {
		boardService.deletePost(bno);
		return "redirect:/list";
	}
	//검색(구분은 아직 못함)
	@GetMapping("/board/search")
	public String search(@RequestParam(value="keyword") String keyword, Model model) {
		List<BoardDto> boardDtoList = boardService.searchPosts(keyword);
		model.addAttribute("boardList", boardDtoList);
		return "board/list";
	}
	
	
}
