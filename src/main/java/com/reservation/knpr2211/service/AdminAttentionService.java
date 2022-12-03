package com.reservation.knpr2211.service;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.entity.Attention;
import com.reservation.knpr2211.repository.AttentionRepository;
import com.reservation.knpr2211.repository.PlaceRepository;

@Service
public class AdminAttentionService implements IAdminAttentionService{
	
	@Autowired AttentionRepository ar;
	@Autowired PlaceRepository pr;
	@Autowired MountainCodeService mcs;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public String getAdminAttentionLists(Model model, String category2, String select, String search, Integer page,	
		Integer size, RedirectAttributes ra) {
		ArrayList<String> category2s = pr.findDistinctCategory2();
		ArrayList<String> nameCategory2 = new ArrayList<String>();
		
		System.out.println("search"+category2);
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
		//System.out.println(attens);
		
		long elements = result.getTotalElements();
		System.out.println("elements"+elements);
		System.out.println("total"+totalPage);
		
		
		model.addAttribute("category2s", category2s);
		model.addAttribute("nameCategory2", nameCategory2);
		model.addAttribute("attentions", attens);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalElements", elements);
		model.addAttribute("category2", category2);
		model.addAttribute("select", select);
		model.addAttribute("search", search);
		
		return "admin/adminAttentionList";
		
	}

	public String adminAttentionWrite(Model model) {
		ArrayList<String> category2s = pr.findDistinctCategory2();
		ArrayList<String> nameCategory2 = new ArrayList<String>();
		for (String cat2 : category2s) {
			cat2 = mcs.findCategory(cat2);
			nameCategory2.add(cat2);
		}model.addAttribute("category2s", category2s);
		model.addAttribute("nameCategory2", nameCategory2);
		
		return "admin/adminAttentionWrite";
	}

	public String adminAttentionWriteProc(Model model, RedirectAttributes ra, Attention attention, MultipartHttpServletRequest req) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		MultipartFile file = req.getFile("fileName");
		if(file.getSize() != 0) {
			Calendar cal = Calendar.getInstance();
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileName = sdf.format(cal.getTime()) + file.getOriginalFilename();
			File save = new File(IAdminAttentionService.FILE_LOCATION + "/" + fileName);
			System.out.println(file.getOriginalFilename());
			try {
				file.transferTo(save);
				attention.setFile(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else {
			attention.setFile("파일 없음");
		}
		
		attention.setSeq(attention.getSeq());
		attention.setTitle(attention.getTitle());
		attention.setContent(attention.getContent());
		attention.setCategory2(attention.getCategory2());
		attention.setHit(attention.getHit());
		attention.setFile(attention.getFile());
		attention.setNotice(attention.isNotice());
		attention.setDeleted(false);
		attention.setModifiedDate(timestamp);
		ar.save(attention);
		return "redirect:adminAttentionList?page=0&size=10";
	}

	public String adminAttentionDetail(Model model, String seq) {
		long l = Long.parseLong(seq);
		Attention attention = ar.findBySeq(l);
		
		System.out.println(attention);
		model.addAttribute("attention",attention);
		
		return "admin/adminAttentionDetail";
	}
	
	
	public String deleteproc(Model model, RedirectAttributes ra, String seq) {
		long l = Long.parseLong(seq);
		ar.deleteById(l);
		
		ra.addAttribute("msg","삭제되었습니다.");
		return "redirect:adminAttentionList";
	}

	public String adminAttentionModify(Model model, RedirectAttributes ra, String seq) {
		long l = Long.parseLong(seq);
		Attention attention = ar.findBySeq(l);
		
		ArrayList<String> category2s = pr.findDistinctCategory2();
		ArrayList<String> nameCategory2 = new ArrayList<String>();
		for (String cat2 : category2s) {
			cat2 = mcs.findCategory(cat2);
			nameCategory2.add(cat2);
		}model.addAttribute("category2s", category2s);
		model.addAttribute("nameCategory2", nameCategory2);
		
		model.addAttribute("attention", attention);
		return "admin/adminAttentionModify";
	}

	public String adminAttentionModifyProc(Model model, RedirectAttributes ra, Attention attention,
			MultipartHttpServletRequest req) {
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		MultipartFile file = req.getFile("fileName");
		if(file.getSize() != 0) {
			Calendar cal = Calendar.getInstance();
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileName = sdf.format(cal.getTime()) + file.getOriginalFilename();
			File save = new File(IAdminAttentionService.FILE_LOCATION + "/" + fileName);
			System.out.println(file.getOriginalFilename());
			try {
				file.transferTo(save);
				attention.setFile(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else {
			attention.setFile("파일 없음");
		}
		System.out.println(attention.getSeq());
		
		Attention at = Attention.builder().seq(attention.getSeq()).title(attention.getTitle()).content(attention.getContent())
				.category2(attention.getCategory2()).hit(0).file(attention.getFile())
				.notice(attention.isNotice()).deleted(false)
				.modifiedDate(timestamp).build();
		
		ar.save(at);
		return "redirect:adminAttentionList?page=0&size=10";
		
	}

	
}













