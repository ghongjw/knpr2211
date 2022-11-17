package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.service.BoardService;

@Controller
public class NotificationController {
	@Autowired
	BoardService boardService;
	//test
		@RequestMapping("tests")
		public String tests() {
			return  "notification/tests";
		}
	//공지사항
	@RequestMapping("notice")
	public String notice() {
		return  "notification/notice";
	}
	//게시판 
	@RequestMapping("board")
	public String board(Model model) {
		System.out.println("asfafaf");
		model.addAttribute("list", boardService.findAll()); 
		return  "notification/board";
	}
	//게시판 상세보기
	@RequestMapping("view")
	public String view(Model model, Integer bno) {
		System.out.println("asfafaf");
		model.addAttribute("list", boardService.findById(bno)); 
		return  "notification/view";
	}
	
	//자주하는 질문
	@RequestMapping("faq")
	public String faq() {
		return  "notification/faq";
	}
	//예약 환불정책
	@RequestMapping("policy")
	public String policy() {
		return  "notification/policy";
	}
	//문의글 쓰기
	@RequestMapping("write")
	public String write() {
		return  "notification/write";
	}
	
	//문의글 등록
	@PostMapping("writeProc")
	public String writeProc(Integer bno, String category1, String type, String title, String content, String writer,
		 String lock_yn, String state) {
		boardService.writeProc(bno, category1, type, title, content, writer, lock_yn, state);
		return  "notification/board";
	}
	//문의글 수정
		@RequestMapping("modify")
		public String modify() {
			return  "notification/modify";
		}
	
	//문의글 수정 등록
	@PostMapping("modifyProc")
	public String modify(Integer bno, String category1, String type, String title, String content, String writer,
		 String lock_yn, String state) {
		boardService.modifyProc(bno, category1, type, title, content, writer, lock_yn, state);
		return  "notification/board";
	}
	 

}
