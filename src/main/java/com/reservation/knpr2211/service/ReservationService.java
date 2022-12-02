
package com.reservation.knpr2211.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.entity.Reservation;
import com.reservation.knpr2211.repository.PlaceRepository;
import com.reservation.knpr2211.repository.ReservationRepository;


@Service
public class ReservationService {

	private static final String String = null;

	@Autowired
	MountainCodeService mcs;

	@Autowired
	PlaceRepository pr;
	
	@Autowired
	ReservationRepository rr;

	

	// (시작)작성자: 최현하 ==============================================
	// A0101(야영장-산-지역명)으로 검색하여 데이터 반환 
	public List<PlaceDTO> campsiteView(String code) throws Exception {
		//ex)A0101(야영장-가야산-삼정)
		List<PlaceDTO> list = new ArrayList<PlaceDTO>();

		
		//Entity ID로 검색해서 get()을 통해 객체 반환
		//Place op = pr.findById(1).get();
		//System.out.println(op.toString());
		List<Place> places = pr.findByCategory3(code);
		
		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();
			String code2 = place.getCategory2();
			String code3 = place.getCategory3();
			String code4 = place.getCategory4();
			String roomName = place.getRoom().substring(7); //A01010101
			
			dto.setCategory2(mcs.findCategory(code2)); //가야산
			dto.setCategory3(mcs.findCategory(code3)); //삼정
			dto.setCategory4(mcs.findCategory(code4)); //자동차야영장 or 자연의솔막
			dto.setRoom(roomName); //01~05번방
			dto.setRoomMax(place.getRoomMax()); 
			
			list.add(dto);

		}
	
		return list;
	}
	
	
	//A0101(야영장-가야산-삼정) 으로 검색하여 소소분류(야영장명) 반환
	public List<String> checkBoxList(String code) throws Exception {
		List<String> cmapsiteNames = new ArrayList<>();
		List<String> checkList = new ArrayList<>();
		
		List<Place> places = pr.findByCategory3(code);

		for (Place place : places) {
			String code4 = place.getCategory4();
			
			cmapsiteNames.add(mcs.findCategory(code4));
			
		}
			
			//중복되는 이름 제거 후 List에 담음
			for( String campsite : cmapsiteNames) {
				if(!checkList.contains(campsite)) {
					checkList.add(campsite);
				}
			}
		
		return checkList;
	}
	
	
	//A010101(야영장-가야산-삼정-자동차야영장) 으로 검색하여 소소분류(야영장명) And Room 반환
	public List<PlaceDTO> roomView(String code) throws ParseException{
		List<PlaceDTO> rooms = new ArrayList<>();
		
		List<Place> places = pr.findByCategory4(code);
		
		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();

			String code4 = place.getCategory4();
			String campsite = mcs.findCategory(code4);
			dto.setCategory4(campsite); //야영장명 반환

			String roomName = place.getRoom().substring(7); 
			dto.setRoom(roomName); //방이름 반환
			
			rooms.add(dto);

			
		}
		
		

		
		return rooms;
	}
	
	
	//야영장 예약 테이블에서 날짜 별로 예약 현황 조회
	public Map<String, Object> reservationState(String[] rooms){
		Map<String, Object> map =new HashMap<>();
		List<String> reservations = new ArrayList<>();
		List<String> roomList = new ArrayList<>();
		List<String> dateList = new ArrayList<>();
	     
	     for(int i = 0; i < rooms.length; i++) {
	    	 
	     for(int j = 0; j < 23; j ++) {
	       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	 
	       Calendar cal = Calendar.getInstance();
	    	 
	     cal.add(Calendar.DATE, +j); //현재 날짜 생성 후, +j(순차증가)
	     String strDate1 = sdf.format(cal.getTime());  //예약사이트 달력 기준 전날
	     
		 cal.add(Calendar.DATE, +1); //증가된 날짜의 다음 날		
		 String strDate2 = sdf.format(cal.getTime());  //예약사이트 달력 기준 오늘	
	     
			try {
				Date date1 = (Date) sdf.parse(strDate1);
				Date date2 = (Date) sdf.parse(strDate2);
				
				 Timestamp tsYesterday = new Timestamp(date1.getTime());
			     Timestamp tsToday = new Timestamp(date2.getTime());
			     
			     List<ReservationDTO> check1 = rr.findByRoomAndStartDayAndAllDay(rooms[i], tsYesterday, "2");
			     List<ReservationDTO> check2 = rr.findByRoomAndStartDayAndAllDay(rooms[i], tsToday, "1");
		     	 List<ReservationDTO> check3 = rr.findByRoomAndStartDayAndAllDay(rooms[i], tsToday, "2");
		    			
		    	 if(check1.size() == 0 && check2.size() == 0 && check3.size() == 0) {
				     reservations.add("예약가능");
				     roomList.add(rooms[i]);
	    
				    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				    String date = format.format(tsToday);
				    dateList.add(date);
				     
				 }else {
				     reservations.add("예약불가");
				     roomList.add(rooms[i]);
	    
				    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				    String date = format.format(tsToday);
				    dateList.add(date);
				     
				 }
			
			} catch (ParseException e) {
				e.printStackTrace();
			}  
		     		    	
		     
	     	}//j for문 종료
	     
	     }//i for문 종료
	     
	     
	     map.put("reservations", reservations);
	     map.put("roomList", roomList);
	     map.put("dateList", dateList);
	     
	     
	     return map;
	
	}
	
	
	// 첫번째 방번호로 조회하여 방 갯수 반환
	public String campsiteCount(String firstRoom) {
		String roomMax = "";
		
		 List<Place> rooms = pr.findByRoom(firstRoom);
		 
		 for(Place room : rooms) {
			 roomMax = Integer.toString(room.getRoomMax());
			 
		 }
		 
		return roomMax; 
	}
	
	
	//선택된 날짜에서 1박2일로 예약 가능한지 불가한지 확인
	public Map<String, String> oneNightCheck(String room, String date) {
		Map<String, String> dateList = new HashMap<>();
		 
	    Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    
	try {
			Date date1 = sdf.parse(date); //String -> Date
			cal.setTime(date1); //Date에서 Calendar에 입력
			cal.add(Calendar.DATE, +1); //1일 증가시킴
			String strDate = sdf.format(cal.getTime()); //Calendar에서 얻어서 다시 String
			Date date2 = (Date) sdf.parse(strDate); //String -> Date
			
			Date date3 = sdf.parse(date); 
			cal.setTime(date3); 
			cal.add(Calendar.DATE, +2); 
			String afterDate = sdf.format(cal.getTime()); 
			
			Timestamp tstomorrow = new Timestamp(date2.getTime()); //Date -> Timestamp
			
		     List<ReservationDTO> check1 = rr.findByRoomAndStartDayAndAllDay(room, tstomorrow, "1");
	     	 List<ReservationDTO> check2 = rr.findByRoomAndStartDayAndAllDay(room, tstomorrow, "2");
			
	     	if(check1.size() == 0 && check2.size() == 0 ) {
	     		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			    String nextDate = format.format(tstomorrow);
	
			    dateList.put("room", room);
			    dateList.put("date1", nextDate);
			    dateList.put("date2", afterDate);
			    dateList.put("state", "예약가능");
	     		
	     	}else {
	     		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			    String nextDate = format.format(tstomorrow);
			    
	     		dateList.put("room", room);
			    dateList.put("date1", nextDate);
			    dateList.put("date2", afterDate);
			    dateList.put("state", "예약불가");
	     		
	     	}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return dateList;
		 
	}
	
	//사용자가 선택한 날짜가 예약 가능할 경우, 예약 정보를 받아 옴
	public Map<String, String> inputSelectInfo(String room) {
		Map<String, String> map = new HashMap<>();
		
		List<Place> places = pr.findByRoom(room);
		
		for(Place place : places) {
			String c1 = mcs.findCategory(place.getCategory1());
			String c2 = mcs.findCategory(place.getCategory2());
			String c3 = mcs.findCategory(place.getCategory3());
			String c4 = mcs.findCategory(place.getCategory4());
			String roomNum = place.getRoom().substring(7);
			String price = place.getPriceDay();
			String people = Integer.toString(place.getPeopleMax());
			 
			
			map.put("c1", c1);
			map.put("c2", c2);
			map.put("c3", c3);
			map.put("c4", c4);
			map.put("roomNum", roomNum);
			map.put("price", price);
			map.put("people", people);
		}
		
		return map;
	}
	
	
	//사용자 입력받은 예약 일정 DB에 저장
	public String reservationSave(Map<String, Object> map) {
		 String id = (String)map.get("id");
		 String tmpCode = (String)map.get("code"); 
	     String tmpAllDay = (String)map.get("allDay");
	     String tmpStartDay = (String)map.get("startDay");
	     String tmpEndDay = (String)map.get("endDay");
	     String tmpPeople = (String)map.get("people");
	     String tmpPrice = (String)map.get("price");
	     
		 
	     String allDay = tmpAllDay.substring(0, 1);
	     
	     String startDay= tmpStartDay.substring(0, 10);
	     String endDay = tmpEndDay.substring(0, 10);
	     
	     int peopleNum = tmpPeople.indexOf("명");
	     String strPeople = tmpPeople.substring(0, peopleNum);
	     int people = Integer.parseInt(strPeople);
	     
	     int priceValue = tmpPrice.indexOf("원");
	     String price = tmpPrice.substring(0, priceValue);
	 
	     String c1 = tmpCode.substring(0, 1);
	     String c2 = tmpCode.substring(0, 3);
	     String c3 = tmpCode.substring(0, 5);
	     String c4 = tmpCode.substring(0, 7);
	     
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date now = new Date();
	      Timestamp orderTime = new Timestamp(now.getTime());

	      Date date1;
		try {
			date1 = (Date) sdf.parse(startDay);
			Date date2 = (Date) sdf.parse(endDay);
		      Timestamp timeStampStart = new Timestamp(date1.getTime());
		      Timestamp timeStampEnd = new Timestamp(date2.getTime());

		      Reservation re = new Reservation();
		      re.setId("user3");
		      re.setCategory1(c1); //야영장
		      re.setCategory2(c2); //가야산
		      re.setCategory3(c3); //삼정
		      re.setCategory4(c4); //자동자야영장
		      re.setRoom(tmpCode); //01번방
		      re.setOrderTime(orderTime);
		      re.setPeople(people);
		      re.setPrice(price);
		      re.setAllDay(allDay);
		      re.setStartDay( timeStampStart);
		      re.setEndDay(timeStampEnd);
		      rr.save(re).getSeq();
		      
		} catch (ParseException e) {
			e.printStackTrace();
		}
	      
		return "예약이 완료되었습니다.";
	
	}
	
	

	
	// (끝)작성자: 최현하 ==============================================
	
	
	

	// (시작)작성자: 김수정 ==============================================
	// 제목 category1(대분류), category2(중분류) 코드 해석
	public String[] transtitleCode(String category) {
		String[] result = new String[2];
		result[0] = mcs.category1(category);
		result[1] = mcs.category2(category);
		return result;
	}

	// 생태탐방원 객실종류 출력 (코드입력 'A08')
	public List<PlaceDTO> selectEcoRoomType(String parkId) {
		// (출력 : C0801, C0802, C0803)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		System.out.println("리스트 출력: "+listDate);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category3(list.getCategory3());
			list.setNameCategory3(result);
		}
		return listDate;
	}

	// 민박촌 객실종류 출력 (코드입력 'A08')
	public List<PlaceDTO> selectCotRoomType(String parkId) {
		// (출력 : C0801, C0802, C0803)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category3(list.getCategory3());
			result = transRoomType(result);
			list.setNameCategory3(result);
			
		}
		return listDate;
	}

	// 방 찾기 (코드입력 'A0801')
	public Place selectCategory3(String parkId) {
		ArrayList<Place> datas = pr.findByCategory3(parkId);
		Place data = datas.get(0);
		return data;
	}

	// 민박촌 방종류명 변경(ex: '온돌' > '개인형 29.7㎡(9평/2명) 온돌')
	public String transRoomType(String roomType) {
		String category = "";
		if (roomType == "온돌") {
			category = "개인형 29.7㎡(9평/2명) 온돌";
		} else if (roomType == "침대") {
			category = "개인형 29.7㎡(9평/2명) 침대";
		} else if (roomType == "15평") {
			category = "가족형 49.5㎡(15평/6명) 복층";
		} else if (roomType == "18평") {
			category = "가족형 59.4㎡(18평/6명) 복층";
		} else {
			category = "단체형 105.6㎡(32평/13명) 복층";
		}
		return category;
	}
	
	// (코드입력 'D0101')
	public void mol(String parkId, String startDay, String endDay) {
		//예약테이블에서 해당코드로 해당 날짜의 예약된 데이터 갯수(길이) 알아내기
		//ArrayList<Reservation> datas = rr.findByCategory3AndStartDay(parkId, startDay);
		//place테이블에서 해당코드로 roomMax 알아내기
		
	}
	// (끝)작성자: 김수정 ==============================================
}
