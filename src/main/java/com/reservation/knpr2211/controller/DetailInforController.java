package com.reservation.knpr2211.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.service.PlaceService;

@Controller
public class DetailInforController {
	@Autowired PlaceService service;
	
	@RequestMapping("detailInfo")
	public String detailInfo(Model model, String parkId, String parkDetail) {
		if(parkId==null||parkId.isEmpty()) {
			parkId = "A01";
		}
		if(parkDetail==null||parkDetail.isEmpty()) {
			parkDetail = parkId+"01";
		}
		model.addAttribute("detailInfo",service.selectPlace(parkId,parkDetail));
		

		
	
		return "detailInformation/detailInfo";
	}
}
