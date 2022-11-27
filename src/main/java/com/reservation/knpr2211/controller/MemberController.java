package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.service.ReservationService;
import com.reservation.knpr2211.service.UserService;

@Controller
public class MemberController {
	@Autowired UserService us;
	@Autowired ReservationService rs;
	
	// (시작)작성자:공주원 ==============================================
	//즐겨찾기조회
	@RequestMapping("favoriteList")
	public String favoriteList(Model model) {
		
		
		return us.favoriteList(model);
		
	}
	//예약 리스트 조회
	@RequestMapping("reservedList")
	public String reservedList(Model model, String reserve,Integer page, Integer size, RedirectAttributes redirectAttrs) {
		
		if(page == null || size ==null) {
			page = 0;
			size = 0;
		}
		//rs.initializing();
		return rs.reservationList(model, reserve, page, size, redirectAttrs);
	}
	
	//예약 리스트 --> 예약 상세정보
	@PostMapping("reservationDetail")
	public String reservationDetail(Model model, Integer seq,RedirectAttributes redirectAttrs) {
		
		
		return rs.reservationDetail(model,seq,redirectAttrs);
	}
	//(끝))작성자:공주원 ==============================================
}
