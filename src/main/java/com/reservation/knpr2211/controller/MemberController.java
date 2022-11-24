package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.service.UserService;

@Controller
public class MemberController {
	@Autowired UserService us;
	
	@RequestMapping("favoriteList")
	public String favoriteList(Model model) {
	
		return 	us.favoriteList();
		
	}

}
