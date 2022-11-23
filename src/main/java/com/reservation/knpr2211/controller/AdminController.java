package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reservation.knpr2211.service.AdminMemberListService;

@Controller
public class AdminController {
	@Autowired AdminMemberListService amls;
	
	
	
	@RequestMapping(value = "adminIndex")
	public String adminIndex() {
		return "admin/adminIndex";
	}

	@GetMapping("memberList")
    public String getAllUserWithPage(@RequestParam("page") Integer page, @RequestParam("size") Integer size, Model model) {
        
		amls.paging(model, page, size);
		
        return "admin/memberList";
    }
	
}
