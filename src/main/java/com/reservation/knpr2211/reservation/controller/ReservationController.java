package com.reservation.knpr2211.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReservationController {
	
	@RequestMapping("reservation/campsite")
	public String campsite() {
		System.out.println("확인");
		return "reservation/campsite";
	}
	
	
	@ResponseBody
	@PostMapping(
			value="reservation/selectInfo", 
			produces = "text/html; charset=UTF-8")
	public String selectInfo(@RequestBody(required = false) String reqData, Model model) { 
		String msg = reqData;
		System.out.println(msg);
		model.addAttribute("msg", msg);
		return "forward:campsite";
		
	}

}
