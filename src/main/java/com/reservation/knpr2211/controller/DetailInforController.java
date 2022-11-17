package com.reservation.knpr2211.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.reservation.knpr2211.service.PlaceService;

@Controller
public class DetailInforController {
	@Autowired PlaceService service;
	
	@GetMapping("detailInfo")
	public String detailInfo(Model model, String parkId) {
		

		model.addAttribute("cat",service.selectPlace(parkId));
		
		return "detailInformation/detailInfo";
	}
}
