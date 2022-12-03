package com.reservation.knpr2211.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	ReservationService rs;
	@Autowired
	HttpSession session;

	// 예약(예외처리)
	@RequestMapping(value = "reservation")
	public String reservation() {
		return "reservation/campsite";
	}
	// (시작)작성자: 김수정 =======================================================
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
	@PostMapping(value = "ecoReservation", produces = "application/json; charset=UTF-8")
	public String PostEcoReservation(@RequestBody(required = false) String code) throws Exception {
		String result = rs.selectCategory3(code).getPriceDay();
		return result;
	}
	@RequestMapping(value = "ecoProc")
	public String ecoProc(ReservationDTO resDto, String startDt, String endDt,RedirectAttributes ra) throws Exception {
		String sessionId = (String)session.getAttribute("id");
		if (sessionId == null || sessionId.isEmpty()) {
			ra.addFlashAttribute("msg","잘못된 접근입니다. 로그인 후 이용해주세요.");
			return "login/login";
		}
		int num = 0; // 방 가능 갯수
		num = rs.roomNumCategory3(resDto, startDt, endDt);
		if(num == 0) {
			ra.addFlashAttribute("msg", "선택한 날짜에 예약 가능한 방이 없습니다. 다시 선택해주세요.");
			return "redirect:/index";
		}else {
			rs.reservation(resDto, startDt, endDt);
			return "redirect:/ecoReservation";
		}
	}

	// 민박촌 예약
	@GetMapping(value = "cottageReservation")
	public String getCottageReservation(String category, Model model) throws ParseException {
		// rs.test();
		if (category == null) {
			category = "D01";
		}
		System.out.println(category);
		// category2(중분류) 코드해석
		String[] result = rs.transtitleCode(category);
		model.addAttribute("category1", result[0]);
		model.addAttribute("category2", result[1]);
		// 룸타입 가져오기
		List<PlaceDTO> roomTypeList = rs.selectCotRoomType(category);
		model.addAttribute("roomTypeList", roomTypeList);
		return "reservation/cottageReservation";
	}
	@ResponseBody
	@PostMapping(value = "cottageReservation", produces = "application/json; charset=UTF-8")
	public HashMap<String, String> postCottageReservation(@RequestBody(required = false) HashMap<String, String> keyData)
			throws Exception {
		int minInt = rs.roomRestCategory3(keyData.get("category3"), keyData.get("diff"),keyData.get("startDate"),keyData.get("endDate"));
		String minStr = Integer.toString(minInt);
		
		String code = keyData.get("category3");
		PlaceDTO result = rs.selectCategory3(code);
		String nameCat3 = rs.transRoomType(result.getNameCategory3());
		
		keyData.put("allowRoomCount", minStr);
		keyData.put("category3", code);
		keyData.put("nameCategory3", nameCat3);
		keyData.put("price", result.getPriceDay());
		System.out.println(keyData);
		return keyData;
	}
	@ResponseBody
	@PostMapping(value = "cottageReservation2", produces = "application/json; charset=UTF-8")
	public HashMap<String, String> postCottageReservation2(@RequestBody(required = false) HashMap<String, String> keyData) throws Exception {
		String code = keyData.get("category3");
		String result = rs.selectCategory3(code).getPriceDay();
		//System.out.println(keyData.get("nameCategory3"));
		
		keyData.put("nameCategory3", keyData.get("nameCategory3"));
		keyData.put("addPeople", keyData.get("addPeople"));
		keyData.put("diff", keyData.get("diff"));
		keyData.put("price", result);
		return keyData;
	}
	@RequestMapping(value = "cottageProc")
	public String cottageProc(ReservationDTO resDto, String startDt, String endDt, RedirectAttributes ra) throws Exception {
		String sessionId = (String)session.getAttribute("id");
		if (sessionId == null || sessionId.isEmpty()) {
			ra.addFlashAttribute("msg","잘못된 접근입니다. 로그인 후 이용해주세요.");
			return "login/login";
		}
		int num = 0; // 방 가능 갯수
		num = rs.roomNumCategory3(resDto, startDt, endDt);
		if(num == 0) {
			ra.addFlashAttribute("msg", "선택한 날짜에 예약 가능한 방이 없습니다. 다시 선택해주세요.");
			return "redirect:/index";
		}else {
			rs.reservation(resDto, startDt, endDt);
			return "redirect:/cottageReservation";
		}
	}
	// (끝)작성자: 김수정 =======================================================

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


	@ResponseBody
	@PostMapping(value="campsiteView")
	public Map<String, Object> campsiteView(@RequestParam Map<String, String> map) throws Exception {

		Map<String, Object> result = new HashMap<>();
		String code = map.get("code");
		// System.out.println(code);

		List<PlaceDTO> list = rs.campsiteView(code);
		List<String> checkList = rs.checkBoxList(code);
		// System.out.println(list.toString());

		result.put("list", list);
		result.put("checkList", checkList);
		return result;
	}

	@ResponseBody
	@PostMapping(value = "/roomView")
	public Map<String, Object> roomView(@RequestParam Map<String, String> map) throws Exception {

		String code = map.get("code");
		// System.out.println(code);

		List<PlaceDTO> rooms = rs.roomView(code);

		Map<String, Object> result = new HashMap<>();
		result.put("rooms", rooms);

		return result;
	}

}
