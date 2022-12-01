package com.reservation.knpr2211.controller;

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
	public String write(String writer, String category1,String type,String title,String content, boolean lock_yn,boolean state) {
		return boardService.savePosts(writer, category1, type, title, content, lock_yn,state);
	}
	//상세페이지
	@GetMapping("boardDetail")
	public String detail(Long bno, Model model) {
		return boardService.getPost(bno, model);
	}
	
	//묻고답하기 수정
//	@RequestMapping("update")
//	public String boardModyfy(Model model, Long bno) {
//		String msg = boardService.boardModify(model, bno);
//		model.addAttribute("msg",msg);
//		return "board/updtae";
//	}
		
	//묻고답하기 수정 확인
//	@RequestMapping("boardModifyConfirm")
//	public String boardModifyConfirm(Model model, String writer, String category1,String type,String title,String content, boolean lock_yn,boolean state) {
//		boardService.boardModify(model, writer, category1, type, title, content, lock_yn,state);
//
//		return "redirect:list";
//	}
	//묻고답하기 삭제 확인
//	@RequestMapping("adminDeleteConfirm")
//	public String adminDeleteConfirm(Model model, String writer, String category1,String type,String title,String content, boolean lock_yn,boolean state) {
//		boardService.boardDelete(model, writer, category1, type, title, content, lock_yn,state);
//		model.addAttribute("msg","삭제되었습니다");
//			
//		return "redirect:list";
//	}
	
	//수정
	@GetMapping(value="/post/edit/{no}")
	public String edit(@PathVariable("no") Long bno, Model model) {
//		BoardDto boardDto = boardService.getPost(bno,model);
//		model.addAttribute("boardDto", boardDto);
		return "board/update";
	}
	@PutMapping("/post/edit/{no}")
	public String update(Model model,BoardDto boardDto) {
		boardService.savePost(model, boardDto);
		return "redirect:/list";
	}
	
	//삭제
	@DeleteMapping("/post/{no}")
	public String delete(@PathVariable("no") Long bno) {
		boardService.deletePost(bno);
		return "redirect:/list";
	}
	
	
	
}
