package com.reservation.knpr2211.service;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.entity.Reservation;
import com.reservation.knpr2211.repository.PlaceRepository;
import com.reservation.knpr2211.repository.ReservationRepository;

@Service

public class IndexService{
	@Autowired
	MountainCodeService mcs;
	@Autowired
	ReservationService rs;
	@Autowired
	PlaceRepository pr;
	@Autowired
	ReservationRepository rr;
	@Autowired
	HttpSession session;

	// 메인 위치종류 출력
	public String mountainSelect(String parkId) {

		// 카테고리별 중복제거 값 불러오기
		ArrayList<String> listDate = pr.findDistintCategory3(parkId);
		String result = "";
		for (String list : listDate) {
			String nameCategory3 = mcs.category3(list);
			if (list.contains("D01") == true) {
				nameCategory3 = rs.transRoomType(nameCategory3);
			}
			result += "<li style='\'><span class='radio-1'> <input type='radio' id='" + list + "'"
					+ "name='location' value='" + nameCategory3 + "' onclick='locationClick(\"" + list + "\",\""
					+ nameCategory3 + "\")'><label>" + nameCategory3 + "</label></span></li>";
		}

		return result;
	}

	public String selectCategory4(String parkId) {
		
		ArrayList<String> dbData = pr.findDistintCategory4(parkId);
		
		String result = "";
		for (String code : dbData) {
			String nameCategory4 = mcs.category4(code);
			String peopleMax = Integer.toString(pr.findDistintPeopleMax(code).get(0));
			result += "<li><span class='radio-1 cam_view'><input type='radio' name='uhang' id=" +code
					+ " value='" + nameCategory4 + "' onclick='camCot4Select(\"" + code + "\",\""
					+ peopleMax + "\")'><label for='" + code + "'>" + nameCategory4
					+ "</label><span style=\"display: none\" id=\"minbakMax\"></span>";
		}
		return result;
	}

	// 야영장 가격 출력
	public String campPrice(String parkId) {
		String result = pr.findDistintPriceDay(parkId).get(0);
		return result;
	}

	// 최종 결제
	// 예약하기
	public void reservation(ReservationDTO resDto, String startDt, String endDt) throws Exception {
		Reservation re = new Reservation();
		PlaceDTO place = new PlaceDTO();

		// 관리코드
		if (resDto.getCategory4() == null) {
			place = rs.selectCategory3(resDto.getCategory3());
		} else {
			place = rs.selectCategory4(resDto.getCategory4());
		}

		re.setCategory1(place.getCategory1());
		re.setCategory2(place.getCategory2());
		re.setCategory3(place.getCategory3());
		re.setCategory4(place.getCategory4());

		// 주문시간, 입실일, 퇴시일 자료형변환
		Date now = new Date();
		Timestamp orderTime = new Timestamp(now.getTime());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = (Date) sdf.parse(startDt);
		Date date2 = (Date) sdf.parse(endDt);
		Timestamp timeStampStart = new Timestamp(date1.getTime());
		Timestamp timeStampEnd = new Timestamp(date2.getTime());

		// 이용시간
		String betweenDt = resDto.getAllDay();
		if (betweenDt.equals("1박 2일") || betweenDt.equals("당일")) {
			betweenDt = "1";
		} else if (betweenDt.equals("2박 3일")) {
			betweenDt = "2";
		} else if (betweenDt.equals("3박 4일")) {
			betweenDt = "3";
		}
		
		// 가격 특정 문자열 제거
		String price = resDto.getPrice().substring(0, resDto.getPrice().indexOf(" "));
		price = price.replaceAll("원", "");
		
		re.setOrderTime(orderTime);
		re.setStartDay(timeStampStart);
		re.setEndDay(timeStampEnd);
		re.setAllDay(betweenDt);
		re.setPeople(resDto.getPeople());
		re.setPrice(price);
		re.setId(resDto.getId());
		re.setChecked(false);
		rr.save(re).getSeq();
	}

	// 남은 방 검증(코드입력 'A0101', 입실일, 퇴실일)
	public int roomRest_Category3(ReservationDTO resDto, String startDate, String endDate) throws ParseException {
		//System.out.println("서비스 카테고리3 ");
		String parkId = resDto.getCategory3();
		Integer minback = transMinback(resDto.getAllDay());
		//System.out.println("민박 넘어온 값 : "+resDto.getAllDay());
		// 1. place테이블에서 해당코드로 roomMax 알아내기
		ArrayList<Place> list = pr.findByCategory3(parkId);
		Integer roomMax = list.get(0).getRoomMax(); // 해당 코드 방의 갯수
		//System.out.println("장소 찾아내기>> 코드: " + list.get(0).getCategory4() + ", 룸 예약 가능 수: " + roomMax);

		// 예약테이블에서 동일한 날짜와 동일한 방에 예약된 갯수알아내기
		// 2.입실일 기준으로 -2일 구하기(입실일 포함 예약된 날짜를 구하기 위함), 퇴실일 전날 날짜 구하기

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = (Date) sdf1.parse(startDate);
		Date date2 = (Date) sdf1.parse(endDate);
		Timestamp betweenStart = new Timestamp(date1.getTime());
		Timestamp betweenEnd = new Timestamp(date2.getTime());

		Calendar cal = Calendar.getInstance();
		cal.setTime(betweenStart);
		cal.add(Calendar.DATE, -2);
		betweenStart.setTime(cal.getTime().getTime());

		cal.setTime(betweenEnd);
		cal.add(Calendar.DATE, -1);
		betweenEnd.setTime(cal.getTime().getTime());
		//System.out.println("timeStamp형식: " + betweenStart + ", " + betweenEnd);

		// 3.동일한 장소 코드와 날짜 사이에 해당하는 예약데이터 찾기
		List<Reservation> SelectDatas = rr.findAllByStartDayBetweenAndCategory3(betweenStart, betweenEnd, parkId);
		if(SelectDatas.isEmpty() == true) {
			return roomMax;
		}
//		System.out.println("DB가져온 값 =========================================================================");
//		for (Reservation data : SelectDatas) {
//			System.out.println("코드: " + data.getCategory4() + ", 관리번호: " + data.getSeq() + ", 입실일: "
//					+ data.getStartDay() + ", 퇴실일: " + data.getEndDay());
//		}
//		System.out.println("====================================================================================");

		ArrayList<Integer> arrList = new ArrayList<Integer>();
		for (int i = 0; i < minback; i++) {
			// 입실일 timeStamp형식 변환
			Timestamp timeStampStart = new Timestamp(date1.getTime());
			cal.setTime(timeStampStart);
			cal.add(Calendar.DATE, i);
			timeStampStart.setTime(cal.getTime().getTime());
			//System.out.println("(선택한날짜 순서대로 출력 중)실험군 날짜들 >> " + timeStampStart);
			
			// DB 예약된 데이터 한개씩 동일한 날짜 예약이 있는지 확인
			Timestamp save;
			for (Reservation data : SelectDatas) {
				Integer count = roomMax; //4
				int num = Integer.parseInt(data.getAllDay());
		
				save = new Timestamp(data.getStartDay().getTime());
				//System.out.println("대조군 >> 관리번호 : " + data.getSeq() + ", 박일수 : " + num + ", 시작-끝: " + data.getStartDay()+ ", " + data.getEndDay());
				
				for (int j = 0; j < num; j++) {
					Calendar calCompare = Calendar.getInstance();
					calCompare.setTime(save);
					calCompare.add(Calendar.DATE, j);
					save.setTime(calCompare.getTime().getTime());
					//System.out.println("봐보자: "+data.getStartDay());
					//System.out.println("대조군 날짜들 >> " + save);

					if (timeStampStart.equals(save)) {
						//System.out.println("  +=>  동일 ");
						count--;
					}
				}
				
				arrList.add(count);
			}
		}
		System.out.println(arrList);
		int min = arrList.get(0);
		for (int i = 0; i < arrList.size(); i++) {
			int num = arrList.get(i);
			if (min > num)
				min = num;
		}
		//System.out.println("룸 비교 리스트 : " + arrList + ", 최솟값(해당 날짜에 예약가능 갯수): " + min);
		return min;
	}

	// 남은 방 검증(코드입력 'A010101', 입실일, 퇴실일)
	public int roomRest_Category4(ReservationDTO resDto, String startDate, String endDate) throws ParseException {
		//System.out.println("서비스 카테고리4 ");
		String parkId = resDto.getCategory4();
		Integer minback = transMinback(resDto.getAllDay());
		//System.out.println("민박 넘어온 값 : "+resDto.getAllDay());
		// 1. place테이블에서 해당코드로 roomMax 알아내기
		ArrayList<Place> list = pr.findByCategory4(parkId);
		Integer roomMax = list.get(0).getRoomMax(); // 해당 코드 방의 갯수
		//System.out.println("장소 찾아내기>> 코드: " + list.get(0).getCategory4() + ", 룸 예약 가능 수: " + roomMax);

		// 예약테이블에서 동일한 날짜와 동일한 방에 예약된 갯수알아내기
		// 2.입실일 기준으로 -2일 구하기(입실일 포함 예약된 날짜를 구하기 위함), 퇴실일 전날 날짜 구하기

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = (Date) sdf1.parse(startDate);
		Date date2 = (Date) sdf1.parse(endDate);
		Timestamp betweenStart = new Timestamp(date1.getTime());
		Timestamp betweenEnd = new Timestamp(date2.getTime());

		Calendar cal = Calendar.getInstance();
		cal.setTime(betweenStart);
		cal.add(Calendar.DATE, -2);
		betweenStart.setTime(cal.getTime().getTime());

		cal.setTime(betweenEnd);
		cal.add(Calendar.DATE, -1);
		betweenEnd.setTime(cal.getTime().getTime());
		//System.out.println("timeStamp형식: " + betweenStart + ", " + betweenEnd);

		// 3.동일한 장소 코드와 날짜 사이에 해당하는 예약데이터 찾기
		List<Reservation> SelectDatas = rr.findAllByStartDayBetweenAndCategory4(betweenStart, betweenEnd, parkId);
		if(SelectDatas.isEmpty() == true) {
			return roomMax;
		}
//		System.out.println("DB가져온 값 =========================================================================");
//		for (Reservation data : SelectDatas) {
//			System.out.println("코드: " + data.getCategory4() + ", 관리번호: " + data.getSeq() + ", 입실일: "
//					+ data.getStartDay() + ", 퇴실일: " + data.getEndDay());
//		}
//		System.out.println("====================================================================================");

		ArrayList<Integer> arrList = new ArrayList<Integer>();
		for (int i = 0; i < minback; i++) {
			// 입실일 timeStamp형식 변환
			Timestamp timeStampStart = new Timestamp(date1.getTime());
			cal.setTime(timeStampStart);
			cal.add(Calendar.DATE, i);
			timeStampStart.setTime(cal.getTime().getTime());
			//System.out.println("(선택한날짜 순서대로 출력 중)실험군 날짜들 >> " + timeStampStart);
			
			// DB 예약된 데이터 한개씩 동일한 날짜 예약이 있는지 확인
			Timestamp save;
			for (Reservation data : SelectDatas) {
				Integer count = roomMax; //4
				int num = Integer.parseInt(data.getAllDay());
		
				save = new Timestamp(data.getStartDay().getTime());
				//System.out.println("대조군 >> 관리번호 : " + data.getSeq() + ", 박일수 : " + num + ", 시작-끝: " + data.getStartDay()+ ", " + data.getEndDay());
				
				for (int j = 0; j < num; j++) {
					Calendar calCompare = Calendar.getInstance();
					calCompare.setTime(save);
					calCompare.add(Calendar.DATE, j);
					save.setTime(calCompare.getTime().getTime());
					//System.out.println("봐보자: "+data.getStartDay());
					//System.out.println("대조군 날짜들 >> " + save);

					if (timeStampStart.equals(save)) {
						//System.out.println("  +=>  동일 ");
						count--;
					}
				}
				
				arrList.add(count);
			}
		}
		//System.out.println(arrList);
		int min = arrList.get(0);
		for (int i = 0; i < arrList.size(); i++) {
			int num = arrList.get(i);
			if (min > num)
				min = num;
		}
		//System.out.println("룸 비교 리스트 : " + arrList + ", 최솟값(해당 날짜에 예약가능 갯수): " + min);
		return min;
	}

	// 민박 글자 변환 ("1박 2일" > 1)
	public int transMinback(String text) {
		int num = 0;
		if (text.equals("1박 2일") || text.equals("당일")) {
			num = 1;
		} else if (text.equals("2박 3일")) {
			num = 2;
		} else if (text.equals("3박 4일")) {
			num = 3;
		}
		return num;
	}
	
}