package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.service.IndexService;
import com.reservation.knpr2211.service.PlaceService;

@Controller
public class IndexController {

	@GetMapping("index1")
	public String index1() {
		
		
		return "index/index1";
	}
	
	@Autowired IndexService Iservice;
	@RequestMapping("MountainSelect")
	public String MountainSelect(String mountain, Model model) {
		
		System.out.println("선택된 산 : "+mountain);
		model.addAttribute(mountain, Iservice.selectMountain(mountain));	
		
		return "redirect:index1";
	}
	
	@RequestMapping("LocationSelect")
	public String LocationSelect(String Location) {
		
		System.out.println("선택된 위치  : " + Location);
		
		
		
		return "redirect:index1";
	}
	
}
