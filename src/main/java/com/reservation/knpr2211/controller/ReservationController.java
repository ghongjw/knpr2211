package com.reservation.knpr2211.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.service.ReservationService;

@Controller
public class ReservationController {
	
	// 예약(예외처리)
	@RequestMapping("reservation")
	public String reservation() {
		return "reservation/ecoReservation";
	}

	// 생태탐방원 예약
	@RequestMapping("ecoReservation")
	public String ecoReservation(String category) {
		//if(category.isEmpty() || category.equals("") || category == null)
		//category = "C08";
		System.out.println(category);
		return "reservation/ecoReservation";
	}

	// 생태탐방원 예약
	@RequestMapping("cottageReservation")
	public String cottageReservation() {
		return "reservation/cottageReservation";
	}
	@Autowired
	ReservationService rs;

	// 야영장 예약페이지 열림
	@RequestMapping("reservation/campsite")
	public String campsite() {
		System.out.println("확인1");
		return "reservation/campsite";
	}

	// 대피소 예약페이지 열림
	@RequestMapping("reservation/shelter")
	public String shelter() {
		System.out.println("확인2");
		return "reservation/shelter";
	}

	@ResponseBody
	@PostMapping(value = "reservation/selectInfo", produces = "text/html; charset=UTF-8")
	public String selectInfo(@RequestBody(required = false) String reqData) {
		String code = reqData;

		return "forward:campsite";

	}

	@ResponseBody
	@PostMapping(value = "/sendData")
	public Map<String, Object> sendData(@RequestParam Map<String, String> map) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		String code = map.get("code");
		System.out.println(code);
		
		List<PlaceDTO> list = rs.campsiteView(code);
		System.out.println(list.toString());
		
		result.put("list", list);
		return result;
	}
}
