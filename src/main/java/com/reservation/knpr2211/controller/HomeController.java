package com.reservation.knpr2211.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping("/") 
	public String index() { 
		return "login/index"; 
		}
	 
	//공지사항
	@RequestMapping(value = "notice")
	public String notice() {
		return "notice/noticeForm";
	}
	
}
