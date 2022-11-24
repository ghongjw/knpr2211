package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	@RequestMapping("memberList")
    public String getAllUserWithPage(@RequestParam("page") Integer page, @RequestParam("size") Integer size,String member,String select, String search, Model model) {
        //System.out.println(member+select+search);
		amls.paging(model, page, size, member, select, search );
		
        return "admin/memberList";
    }
	
	@RequestMapping("memberModify")
	public String memberModyfy(Model model,String memberId) {
		
		String msg = amls.memberModify(model,memberId);
		
		if(msg.equals("회원 수정 불가능한 계정입니다.")) {
			return "login/index";
		}
		
		return "admin/memberModify";
	}
	@RequestMapping("memberReservationModify")
	public String memberReservationModify(Model model,String memberId) {
		
		String msg = amls.memberModify(model,memberId);
		
		if(msg.equals("회원 수정 불가능한 계정입니다.")) {
			return "login/index";
		}
		
		return "admin/mReservationModify";
	}

	
}
