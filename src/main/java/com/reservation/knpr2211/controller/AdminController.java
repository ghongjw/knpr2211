package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.service.AdminMemberListService;

@Controller
public class AdminController {
	@Autowired AdminMemberListService amls;
	
	// (시작)작성자:공주원 ==============================================
	//관리자index 
	@RequestMapping(value = "adminIndex")
	public String adminIndex() {
		return "admin/adminIndex";
	}
	
	//관리자 회원정보조회
	@RequestMapping("adminMemberList")
    public String getAllUserWithPage(Integer page,Integer size,String member,String select, String search, Model model) {
        //System.out.println(member+select+search);
		amls.paging(model, page, size, member, select, search );
		
        return "admin/adminMemberList";
    }
	//관리자 회원정보 수정
	@RequestMapping("adminMemberModify")
	public String memberModyfy(Model model,String memberId) {
		
		String msg = amls.memberModify(model,memberId);
		model.addAttribute("msg",msg);
		
		return "admin/adminMemberModify";
	}
	
	//관리자 회원 수정 확인
	@RequestMapping("adminMemberModifyConfirm")
	public String adminMemberModifyConfirm(Model model, String id, String name, String email,String mobile, String member, String deleted) {
		amls.memberModify(model, id, name, email, mobile, member,deleted);

		return "redirect:adminMemberList";
	}
	//관리자 회원 삭제 확인
	@RequestMapping("adminDeleteConfirm")
	public String adminDeleteConfirm(Model model, String id, String name, String email,String mobile, String member, String deleted) {
		amls.memberDelete(model, id, name, email, mobile, member,deleted);
		model.addAttribute("msg","삭제되었습니다");
		
		return "redirect:adminMemberList";
	}
	// (끝)작성자:공주원 ==============================================

	
}
