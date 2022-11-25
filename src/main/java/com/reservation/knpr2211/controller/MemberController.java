package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reservation.knpr2211.service.ReservationService;
import com.reservation.knpr2211.service.UserService;

@Controller
public class MemberController {
	@Autowired UserService us;
	@Autowired ReservationService rs;
	
	@RequestMapping("favoriteList")
	public String favoriteList(Model model) {
		
		
		return us.favoriteList(model);
		
	}
	@RequestMapping("reservedList")
	public String reservedList(Model model, String reserve,Integer page, Integer size) {
		
		if(page == null || size ==null) {
			page = 0;
			size = 0;
		}
		//rs.initializing();
		return rs.reservationList(model, reserve, page, size);
	}

}
