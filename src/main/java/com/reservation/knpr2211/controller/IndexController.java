package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.service.IndexService;

@Controller
public class IndexController {

	@GetMapping("index1")
	public String index1() {
		
		
		return "index/index1";
	}
	
	@Autowired IndexService Iservice;
	@RequestMapping("MountainSelect")
	public String MountainSelect(String mountain1,String type, Model model) {
		
		System.out.println("선택된 산 : "+mountain1);
		System.out.println("탭번호 : " + type);
		model.addAttribute(mountain1, Iservice.selectMountain1(mountain1));	
		model.addAttribute("type", type);
		return "redirect:index1";
	}
	
	@RequestMapping("MountainSelect2")
	public String MountainSelect2(String mountain2,String type, Model model) {
		
		System.out.println("선택된 산 : "+mountain2);
		System.out.println("탭번호 : " + type);
		model.addAttribute(mountain2, Iservice.selectMountain2(mountain2));	
		model.addAttribute("type", type);
		return "redirect:index1";
	}
	
	
	@RequestMapping("MountainSelect3")
	public String MountainSelect3(String mountain3,String type, Model model) {
		
		System.out.println("선택된 산 : "+mountain3);
		System.out.println("탭번호 : " + type);
		model.addAttribute("type", type);
		model.addAttribute(mountain3, Iservice.selectMountain3(mountain3));	
		
		return "redirect:index1";
	}
	
	
	@RequestMapping("MountainSelect4")
	public String MountainSelect4(String mountain4,String type, Model model) {
		
		System.out.println("선택된 산 : "+mountain4);
		System.out.println("탭번호 : " + type);
		model.addAttribute("type", type);
		model.addAttribute(mountain4, Iservice.selectMountain4(mountain4));	
		
		return "redirect:index1";
	}
	
	

	
	@RequestMapping("LocationSelect")
	public String LocationSelect(String Location) {
		
		System.out.println("선택된 위치  : " + Location);
		
		
		
		return "redirect:index1";
	}
	
}
