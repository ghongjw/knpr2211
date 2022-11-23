package com.reservation.knpr2211.service;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.UserRepository;

@Service
public class AdminMemberListService {

	@Autowired UserRepository ur;


	public String paging(Model model, Integer page, Integer size) {
		
		PageRequest pageRequest = PageRequest.of(page, size);
		Page<User> result = ur.findByMember("normal", pageRequest);
		
		List<User> members = result.getContent();
		int totalPage = result.getTotalPages();
		
		System.out.println(members);
		for(User user : members) {
			System.out.println(user.getId());
		}
		
		model.addAttribute("members", members);
		//model.addAttribute("totalPage", totalPage);
		
	
		
        return "ok";
		
		
	}


	
}
