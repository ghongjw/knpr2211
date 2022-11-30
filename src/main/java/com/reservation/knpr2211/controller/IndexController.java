package com.reservation.knpr2211.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.service.IndexService;
import com.reservation.knpr2211.service.MountainCodeService;
import com.reservation.knpr2211.service.PlaceService;
import com.reservation.knpr2211.service.ReservationService;

@Controller
public class IndexController {


	@Autowired
	IndexService is;
	
	@Autowired
	MountainCodeService mc;

	@Autowired
	PlaceService ps;
	
	@Autowired
	ReservationService rs;
	
	@RequestMapping("index1")
	public String index1(Model model) {
		return "index/index1";
	}
	@ResponseBody //mountain : A01
	@PostMapping(value="mountainSelect", produces = "application/json; charset=UTF-8") 
	public String MountainSelect(@RequestBody(required = false) String category2) {
		String result = is.mountainSelect(category2);
		System.out.println(result);
		return result;
	}
	
//	@RequestMapping("MountainSelect")
//	public String MountainSelect(String mountain, Model model) {
//		
//		System.out.println("선택된 산 : "+mountain);
//		model.addAttribute(mountain, ps.selectMountain(mountain));	
//		
//		return "redirect:index1";
//	}
//	
//	@RequestMapping("LocationSelect")
//	public String LocationSelect(String Location) {
//		
//		System.out.println("선택된 위치  : " + Location);
//		
//		return "redirect:index1";
//	}
	
}
