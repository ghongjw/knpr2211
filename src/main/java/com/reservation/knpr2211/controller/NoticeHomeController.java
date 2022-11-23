package com.reservation.knpr2211.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.dto.NoticeDTO;

@Controller
public class NoticeHomeController {
	//세션 아이디 값 받아오기
	@Autowired HttpSession session;
	public String checkSession(String url) {
		String id = (String)session.getAttribute("id");
		
		if(id == null)
			return "login/login";
		return url;
	}
	
	//상세페이지
	@RequestMapping(value = "/view")
	public String view() {
		String url = checkSession("notice/viewForm");
		return url;
	}
	//공지사항 등록
	@RequestMapping(value = "/write")
	public String write() {
		String url = checkSession("notice/writeForm");
		return url;
	}
	//공지사항 수정
	@RequestMapping(value = "modify")
	public String modify(Model model, NoticeDTO notice) {
		String url = checkSession("notice/modifyForm");
		model.addAttribute("notice", notice); //modifyForm.jsp에서 출력할 데이터
		return url;
	}
	//공지사항 삭제
	@RequestMapping(value = "delete")
	public String delete(Model model, String proc, HttpServletRequest req) {
		String url = checkSession("notice/deleteForm");
		if(proc == null) {
			return "forward:noticeProc";
		}
		if(proc.equals("noticeProc")) {
			model.addAttribute("no", req.getParameter("no"));
		}else {
			model.addAttribute("checks", req.getParameterValues("checks"));
		}
		model.addAttribute("proc", proc);
		return url;
	}
}
