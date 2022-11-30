package com.reservation.knpr2211.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	ReservationService rs;
	
	// 예약(예외처리)
	@RequestMapping( value = "reservation")
	public String reservation() {
		return "reservation/campsite";
	}

	// 생태탐방원 예약
	@GetMapping(value = "ecoReservation")
	public String GetEcoReservation(String category, Model model) {
		if (category == null) {
			category = "C08";
		}
		// 제목 category1(대분류), category2(중분류) 코드 해석
		String[] result = rs.transtitleCode(category); 
		model.addAttribute("category1", result[0]);
		model.addAttribute("category2", result[1]);
		// 룸타입 가져오기
		List<PlaceDTO> roomTypeList = rs.selectEcoRoomType(category);
		model.addAttribute("roomTypeList", roomTypeList);
		return "reservation/ecoReservation";
	}
	@ResponseBody
	@PostMapping(value="ecoReservation", produces="application/json; charset=UTF-8")
	public String PostEcoReservation(@RequestBody(required = false) String code){
		String result = rs.selectCategory3(code).getPriceDay();
		return result;
	}
	
	// 민박촌 예약
	@GetMapping(value = "cottageReservation")
	public String getCottageReservation(String category, Model model) {
		System.out.println(category);
		if (category == null) {
			category = "D01";
		}
		// category2(중분류) 코드해석
		String[] result = rs.transtitleCode(category); 
		model.addAttribute("category1", result[0]);
		model.addAttribute("category2", result[1]);
		// 룸타입 가져오기
		List<PlaceDTO> roomTypeList = rs.selectCotRoomType(category);
		model.addAttribute("roomTypeList", roomTypeList);
		return "reservation/cottageReservation";
	}
	@PostMapping(value = "cottageReservation", produces = "text/html; charset=UTF-8")
	public String postCottageReservation(@RequestBody(required = false) HashMap<String, String> keyData) {
		rs.mol(keyData.get("category3"), keyData.get("startDay"), keyData.get("endDay"));
		return "reservation/cottageReservation";
	}


	// 야영장 예약페이지 열림
	@RequestMapping("campsite")
	public String campsite() {
		System.out.println("확인1");
		return "reservation/campsite";
	}

	// 대피소 예약페이지 열림
	@RequestMapping("shelter")
	public String shelter() {
		System.out.println("확인2");
		return "reservation/shelter";
	}

	@ResponseBody
	@PostMapping(value = "selectInfo", produces = "text/html; charset=UTF-8")
	public String selectInfo(@RequestBody(required = false) String reqData) {
		String code = reqData;

		return "forward:campsite";

	}

	//@PostMapping(value = "/campsiteView")
	@ResponseBody
	@PostMapping(value="campsiteView")
	public Map<String, Object> campsiteView(@RequestParam Map<String, String> map) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		String code = map.get("code");
		//System.out.println(code);
		
		List<PlaceDTO> list = rs.campsiteView(code);
		List<String> checkList = rs.checkBoxList(code);
		//System.out.println(list.toString());


		result.put("list", list);
		result.put("checkList", checkList);
		return result;
	}
	
	
	@ResponseBody
	@PostMapping(value = "/roomView")
	public Map<String, Object> roomView(@RequestParam Map<String, String> map) throws Exception {
		
		String code = map.get("code");
		//System.out.println(code);
	
		List<PlaceDTO> rooms = rs.roomView(code);
		
		Map<String, Object> result = new HashMap<>();
		result.put("rooms", rooms);
		
		return result;
	}
		
}
