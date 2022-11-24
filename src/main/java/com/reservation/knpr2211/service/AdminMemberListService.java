package com.reservation.knpr2211.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.UserRepository;

@Service
public class AdminMemberListService {

	@Autowired
	UserRepository ur;
	@Autowired
	HttpSession session;

	public String paging(Model model, Integer page, Integer size, String member, String select, String search) {

		if (page == null || size == null) {
			page = 0;
			size = 10;
		}
		if (member == null || member.isEmpty()) {
			member = "all";
		}
		if (select == null || select.isEmpty()) {
			select = "id";
		}
		PageRequest pageRequest = PageRequest.of(page, size);
		Page<User> result = ur.findAll(pageRequest);

		if (search == null || search.isEmpty()) {
			if (member.equals("all")) {
				result = ur.findByDeleted(false,pageRequest);
			} else {
				result = ur.findByMemberAndDeleted(member,false,pageRequest);
			}

		} else {
			if (member.equals("all")) {
				if (select.equals("id")) {
					result = ur.findByDeletedAndIdContaining(false,search, pageRequest);
				} else if (select.equals("name")) {
					result = ur.findByDeletedAndNameContaining(false,search, pageRequest);
				} else if (select.equals("email")) {
					result = ur.findByDeletedAndEmailContaining(false,search, pageRequest);
				} else {
					result = ur.findByDeletedAndMobileContaining(false,search, pageRequest);
				}
			} else {
				if (select.equals("id")) {
					System.out.println("durldyrl" + member + select + search);
					result = ur.findByDeletedAndMemberAndIdContaining(false,member, search, pageRequest);
				} else if (select.equals("name")) {
					result = ur.findByDeletedAndMemberAndNameContaining(false,member, search, pageRequest);
				} else if (select.equals("email")) {
					result = ur.findByDeletedAndMemberAndEmailContaining(false,member, search, pageRequest);
				} else {
					result = ur.findByDeletedAndMemberAndMobileContaining(false,member, search, pageRequest);

				}
			}
		}

	
		

		// Page<User> result = ur.findByMember("normal", pageRequest);

		List<User> members = result.getContent();

		int totalPage = result.getTotalPages();
		if (totalPage == 0) {
			totalPage = 1;
		}
		long totalElement = result.getTotalElements();

		System.out.println(members);
		for (User user : members) {
			System.out.println(user.getId());
		}

		model.addAttribute("members", members);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalElement", totalElement);
		model.addAttribute("search", search);
		model.addAttribute("member", member);
		model.addAttribute("select", select);

		return "ok";

	}

	public String memberModify(Model model, String memberId) {
	/////실제로 운영은 트루로 해준
		if(isAdmin()!=true) {
			model.addAttribute("member", ur.getById(memberId));
			return "회원 수정가능";
		}else {
			session.invalidate();
			return "회원 수정 불가능한 계정입니다.";
		}
		

	}
	public Boolean isAdmin() {
		if(session.getAttribute("id")==null) {
			session.invalidate();
			return false;
		}
		String isAdmin = ur.getById((String)session.getAttribute("id")).getMember();
		if(isAdmin.equals("admin")) {
			return true;
		}else {
			session.invalidate();
			return false;
		}
		
	}
}
