package com.reservation.knpr2211.notification.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NotificationController {
	//공지사항
	@RequestMapping("notice")
	public String notice() {
		return  "notification/notice";
	}
	//게시판
	@RequestMapping("board")
	public String board() {
		return  "notification/board";
	}
	
}
