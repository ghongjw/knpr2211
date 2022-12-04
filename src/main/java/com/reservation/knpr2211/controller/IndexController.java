package com.reservation.knpr2211.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.service.IndexService;
import com.reservation.knpr2211.service.MountainCodeService;
import com.reservation.knpr2211.service.PlaceService;
import com.reservation.knpr2211.service.ReservationService;


@Controller
public class IndexController {

	@Autowired
	HttpSession session;

	@Autowired
	IndexService is;
	
	@Autowired
	MountainCodeService mc;

	@Autowired
	PlaceService ps;
	
	@Autowired
	ReservationService rs;
	
	@RequestMapping("index")
	public String index(Model model) {
		return "login/index";
	}
	@ResponseBody //parkId : A01
	@PostMapping(value="mountainSelect", produces = "application/json; charset=UTF-8") 
	public String MountainSelect(@RequestBody(required = false) String parkId) {
		String result = is.mountainSelect(parkId);
		//System.out.println(result);
		return result;
	}
	@ResponseBody //parkId : A0101
	@PostMapping(value="campCategory4", produces = "application/json; charset=UTF-8") 
	public String campCategory4(@RequestBody(required = false) String parkId) {
		System.out.println("컨트롤 : "+parkId);
		String result = is.selectCategory4(parkId);
		System.out.println(result);
		return result;
	}
	

	@ResponseBody //parkId : A010101
	@PostMapping(value="campPrice", produces = "application/json; charset=UTF-8") 
	public HashMap<String,String> campPrice(@RequestBody(required = false) HashMap<String, String> keyData) {
		System.out.println("camPrice : "+keyData);
		String parkId = keyData.get("parkId");
		String price = is.campPrice(parkId);
		
		keyData.put("price", price);
		keyData.put("minback", keyData.get("minback"));
		keyData.put("cat3", keyData.get("cat3"));
		keyData.put("cat4", keyData.get("cat4"));
		return keyData;
	}
	
	@ResponseBody //parkId : A0101
	@PostMapping(value="shelPrint", produces = "application/json; charset=UTF-8") 
	public HashMap<String,String> shelPrint(@RequestBody(required = false) HashMap<String, String> keyData) throws Exception {
		String parkId = keyData.get("parkId");
		PlaceDTO data = rs.selectCategory3(parkId);
		// 가격, 선택한 날짜, 선택한 상품 , 최대인원수
		keyData.put("price", data.getPriceDay());
		keyData.put("peopleMax", String.valueOf(data.getPeopleMax()));
		keyData.put("selectDt", keyData.get("selectDt"));
		keyData.put("selectPlace", data.getNameCategory2()+" "+keyData.get("nameCategory3"));
		return keyData;
	}
	
	@ResponseBody //parkId : A0101
	@PostMapping(value="ecoPrint", produces = "application/json; charset=UTF-8") 
	public HashMap<String,String> ecoPrint(@RequestBody(required = false) HashMap<String, String> keyData) throws Exception {
		String parkId = keyData.get("parkId");
		PlaceDTO data = rs.selectCategory3(parkId);
		// 가격, 선택한 날짜, 선택한 상품 , 최대인원수
		keyData.put("price", data.getPriceDay());
		keyData.put("peopleMax", String.valueOf(data.getPeopleMax()));
		keyData.put("selectPlace", data.getNameCategory2()+" "+keyData.get("nameCategory3"));
		return keyData;

	}
	
	// 최종 결제
	@RequestMapping(value = "mainResProc_cam")
	public String mainResProCam(ReservationDTO resDto, String startDt, String endDt,RedirectAttributes ra) throws Exception {
		String sessionId = (String)session.getAttribute("id");
		if (sessionId == null || sessionId.isEmpty()) {
			ra.addFlashAttribute("msg","잘못된 접근입니다. 로그인 후 이용해주세요.");
			return "redirect:/login";
		}
		int num = 0; // 방 가능 갯수
		if(resDto.getCategory4() == null || resDto.getCategory4().equals("")) {
			System.out.println("cat3검증 / cat4상태: "+resDto.getCategory4());
			num = is.roomRest_Category3(resDto, startDt, endDt);
		}else if(resDto.getCategory4() != null) {
			System.out.println("cat4검증 / cat4상태: "+resDto.getCategory4());
			num = is.roomRest_Category4(resDto, startDt, endDt);
		}
		if(num == 0) {
			ra.addFlashAttribute("msg", "선택한 날짜에 예약 가능한 방이 없습니다. 다시 선택해주세요.");
			return "redirect:/index";
		}else {
			is.reservation(resDto, startDt, endDt);
			return "redirect:/index";
		}
		
	}
}