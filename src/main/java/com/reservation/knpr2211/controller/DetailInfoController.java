package com.reservation.knpr2211.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.service.PlaceService;
import com.reservation.knpr2211.service.UserService;

@Controller
public class DetailInfoController {
	@Autowired PlaceService service;
	@Autowired UserService us;
	@Autowired HttpSession session;
	
	@GetMapping("detailInfo")
	public String detailInfo(Model model, String parkId, String parkDetail) {
		if(parkId==null||parkId.isEmpty()) {
			parkId = "A01";
		}
		if(parkDetail==null||parkDetail.isEmpty()) {
			parkDetail = parkId+"01";
		}
		model.addAttribute("detailInfo",service.selectPlace(parkId,parkDetail));
		System.out.println(session.getAttribute("imagecount"));
		
		
		return "detailInformation/detailInfo";
	}
	
	@ResponseBody
	@PostMapping(value = "checkFavorite", produces = "text/html; charset=UTF-8")
	public String checkFavorite(@RequestBody String data) {
		
		String check = service.checkFavorite(data);
		return check;
	}
	
	@ResponseBody
	@PostMapping(value = "bookmarkChecked", produces = "application/json; charset=UTF-8")
	public String bookmarkChecked(@RequestBody HashMap<String, String> map) {
		
		String toggleCheck = service.toggleCheck(map);
		
		return toggleCheck;
		
	}
	
	

}
