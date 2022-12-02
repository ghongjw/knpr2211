package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.service.AttentionService;

@Controller
public class AttentionController {

	@Autowired AttentionService as;
	
	@RequestMapping("attentionList")
	public String attentionList(Model model, String category2, String select, String search, Integer page, Integer size,RedirectAttributes ra) {
		
		return as.getAttentionLists(model,category2,select,search,page,size,ra);
	}
	@RequestMapping("attentionDetail")
	public String attentionDetail(Model model,String seq) {
		
		return as.attentionDetail(model,seq);
	}
	
	
}
