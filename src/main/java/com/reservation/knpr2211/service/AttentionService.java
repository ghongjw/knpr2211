package com.reservation.knpr2211.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.entity.Attention;
import com.reservation.knpr2211.repository.AttentionRepository;
import com.reservation.knpr2211.repository.PlaceRepository;

@Service
public class AttentionService {
	@Autowired AttentionRepository ar;
	@Autowired PlaceRepository pr;
	@Autowired MountainCodeService mcs;

	public String getAttentionLists(Model model, String category2, String select, String search, Integer page,
		
		Integer size, RedirectAttributes ra) {
		ArrayList<String> category2s = pr.findDistinctCategory2();
		ArrayList<String> nameCategory2 = new ArrayList<String>();
		for (String cat2 : category2s) {
			cat2 = mcs.findCategory(cat2);
			nameCategory2.add(cat2);
		}
		if(page == null ||size ==null) {
			page = 0;
			size = 10;
		}
		if(category2 == null || category2.isEmpty()) {
			category2 = "all";
		}
		if(select == null || select.isEmpty()) {
			select = "all";
		}
		
		PageRequest pageRequest = PageRequest.of(page, size);
		Page<Attention> result = null;
		
		//찾기
		if(search==null||search.isEmpty()) {
			if(category2.equals("all")) {
				result = ar.findAll(pageRequest);
			}else {
				result = ar.findByCategory2(category2,pageRequest);
			}
		}else {
			if(category2.equals("all")) {
				if(select.equals("all")) {
					result = ar.findByContentOrTitle(search,search,pageRequest);
				}else if(select.equals("title")) {
					result = ar.findByTitleContaining(search,pageRequest);
				}else {
					result = ar.findByContentContaining(search,pageRequest);
				}
			}else {
				if(select.equals("all")) {
					result = ar.findByCategory2AndContentOrTitle(category2, search,search,pageRequest);
				}else if(select.equals("title")) {
					result = ar.findByCategory2AndTitleContaining(category2,search,pageRequest);
				}else {
					result = ar.findByCategory2AndContentContaining(category2,search,pageRequest);
				}
			}
		}
			
		List<Attention> attentions = result.getContent();
		int totalPage = result.getTotalPages();
		if(totalPage == 0) {
			totalPage = 1;
		}
		
		List<Attention> attens = new ArrayList<Attention>();
		for(Attention a : attentions) {
			a.setCategory2(mcs.findCategory(a.getCategory2()));
			attens.add(a);
		}
		long elements = result.getTotalElements();
		
		model.addAttribute("category2s", category2s);
		model.addAttribute("nameCategory2", nameCategory2);
		model.addAttribute("attentions", attentions);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalElements", elements);
		model.addAttribute("category2", category2);
		model.addAttribute("select", select);
		model.addAttribute("search", search);
		
		return "attention/attentionList";
		
	}

	public String attentionDetail(Model model, String seq) {
		long l = Long.parseLong(seq);
		Attention attention = ar.findBySeq(l);
		
		attention.setHit(attention.getHit()+1);
		ar.save(attention);
		
		System.out.println(attention);
		model.addAttribute("attention",attention);
		
		return "attention/attentionDetail";
		
	}

}
