package com.reservation.knpr2211.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.dto.BoardDto;
import com.reservation.knpr2211.service.BoardService;

@Controller
public class BoardController {
	@Autowired HttpSession session;
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
	//묻고답하기 조회
	@RequestMapping("list")
    public String getAllBoardWithPage(Model model, Integer page, Integer size, String board, String select, String category1,String keyword, RedirectAttributes ra) {
		boardService.paging(model, page, size, board, select, category1, keyword, ra);
        return "board/list";
    }
	//묻고 답하기 등록
	@GetMapping("post")
	public String write(Model model) {
		return boardService.getMember(model);
	}
	@PostMapping("post")
	public String write(String writer, String category1,String type,String title,String content, String lock_yn, boolean state, HttpServletResponse response, Long bno) throws IOException {
		return boardService.savePosts(writer, category1, type, title, content, lock_yn, state, response, bno);
	}
	//상세페이지
	@GetMapping("boardDetail")
	public String detail(Long bno, Model model) {
		return boardService.getPost(bno, model);
	}
	//수정
	@GetMapping(value="boardModify")
	public String edit(long bno, Model model) {
		boardService.getPost(bno,model);
		return "board/update";
	}
	@PutMapping("boardModify")
	public String update(Model model,BoardDto boardDto) {
		boardService.savePost(model, boardDto);
		return "redirect:/list";
	}
	
	//삭제
	@PostMapping("boardDelete")
	public String delete(String delete) {
		boardService.deletePost(delete);
		return "redirect:/list";
	}

	
}
