
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

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.entity.Reservation;
import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.PlaceRepository;
import com.reservation.knpr2211.repository.ReservationRepository;
import com.reservation.knpr2211.repository.UserRepository;

@Service
public class ReservationService {


	//private static final String String = null;

	@Autowired
	MountainCodeService mcs;

	@Autowired
	PlaceRepository pr;

	@Autowired
	ReservationRepository rr;

	@Autowired
	UserRepository ur;

	@Autowired
	HttpSession session;

	
	
	// (시작)작성자: 최현하 (a-야영장)==============================================
	// a0101(야영장-산-지역명)으로 검색하여 데이터 반환 
	public List<PlaceDTO> campsiteView(String code) throws Exception {
		//ex)a0101(야영장-가야산-삼정)
		List<PlaceDTO> list = new ArrayList<PlaceDTO>();

		// Entity ID로 검색해서 get()을 통해 객체 반환
		// Place op = pr.findById(1).get();
		// System.out.println(op.toString());

		//List<Place> places = pr.findByCategory1AndCategory2AndCategory3(category1, category2, category3);

		// Entity ID로 검색해서 get()을 통해 객체 반환
		// Place op = pr.findById(1).get();
		// System.out.println(op.toString());

		// List<Place> places = pr.findByCategory2AndCategory3(category2, category3);
		
		//entity id로 검색해서 get()을 통해 객체 반환
		//place op = pr.findbyid(1).get();
		//system.out.println(op.toString());
		List<Place> places = pr.findByCategory3(code);
		
		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();
			String code2 = place.getCategory2();
			String code3 = place.getCategory3();
			String code4 = place.getCategory4();
			String roomName = place.getRoom().substring(7); //a01010101
			
			dto.setCategory2(mcs.findCategory(code2)); //가야산
			dto.setCategory3(mcs.findCategory(code3)); //삼정
			dto.setCategory4(mcs.findCategory(code4)); //자동차야영장 or 자연의솔막
			dto.setRoom(roomName); //01~05번방
			dto.setRoomMax(place.getRoomMax()); 
			
			list.add(dto);

		}

		return list;
	}

	
	
	//a0101(야영장-가야산-삼정) 으로 검색하여 소소분류(야영장명) 반환
	public List<String> checkBoxList(String code) throws Exception {
		List<String> cmapsitenames = new ArrayList<>();
		List<String> checklist = new ArrayList<>();
		
		List<Place> places = pr.findByCategory3(code);

		for (Place place : places) {
			String code4 = place.getCategory4();
			
			cmapsitenames.add(mcs.findCategory(code4));
			
		}
			
			//중복되는 이름 제거 후 list에 담음
			for( String campsite : cmapsitenames) {
				if(!checklist.contains(campsite)) {
					checklist.add(campsite);
				}
			}
			
			
		return checklist;
		
	}
	
	
	//a010101(야영장-가야산-삼정-자동차야영장) 으로 검색하여 소소분류(야영장명) and room 반환
	public List<PlaceDTO> roomView(String code) throws ParseException{
		List<PlaceDTO> rooms = new ArrayList<>();
		
		List<Place> places = pr.findByCategory4(code);
		
		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();

			String code4 = place.getCategory4();
			String campsite = mcs.findCategory(code4);
			dto.setCategory4(campsite); //야영장명 반환

			String roomname = place.getRoom().substring(7); 
			dto.setRoom(roomname); //방이름 반환
			
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
	     //System.out.println(j+strDate1);
	    
	     
		 cal.add(Calendar.DATE, +1); //증가된 날짜의 다음 날		
		 String strDate2 = sdf.format(cal.getTime());  //예약사이트 달력 기준 오늘	
		 
		
			try {
				Date date1 = (Date) sdf.parse(strDate1);
				Date date2 = (Date) sdf.parse(strDate2);
				
				 Timestamp tsYesterday = new Timestamp(date1.getTime());
			     Timestamp tsToday = new Timestamp(date2.getTime());
			     
			     List<Reservation> check1 = rr.findByRoomAndStartDayAndAllDay(rooms[i], tsYesterday, "2");
			     List<Reservation> check2 = rr.findByRoomAndStartDayAndAllDay(rooms[i], tsToday, "1");
			     List<Reservation> check3 = rr.findByRoomAndStartDayAndAllDay(rooms[i], tsToday, "2");
		    			
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
	public String campsiteCount(String firstroom) {
		String roommax = "";
		
		 List<Place> rooms = pr.findByRoom(firstroom);
		 
		 for(Place room : rooms) {
			 roommax = Integer.toString(room.getRoomMax());
			 
		 }
		 
		return roommax; 
	}
	
	
	//선택된 날짜에서 1박2일로 예약 가능한지 불가한지 확인
	public Map<String, String> oneNightCheck(String room, String date) {
		System.out.println(room);
		System.out.println(date);
		Map<String, String> dateList = new HashMap<>();
		 
	    Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    
	    Date date1;
	try {
			date1 = sdf.parse(date); //String -> date
			cal.setTime(date1); //date에서 calendar에 입력
			cal.add(Calendar.DATE, +1); //1일 증가시킴
			String strDate = sdf.format(cal.getTime()); //calendar에서 얻어서 다시 String
			Date date2 = (Date) sdf.parse(strDate); //String -> date
			
			Date date3 = sdf.parse(date); 
			cal.setTime(date3); 
			cal.add(Calendar.DATE, +2); 
			String afterDate = sdf.format(cal.getTime()); 
			
			Timestamp tsTomorrow = new Timestamp(date2.getTime()); //date -> timestamp
			
		     List<Reservation> check1 = rr.findByRoomAndStartDayAndAllDay(room, tsTomorrow, "1");
	     	 List<Reservation> check2 = rr.findByRoomAndStartDayAndAllDay(room, tsTomorrow, "2");
			
	     	if(check1.size() == 0 && check2.size() == 0 ) {
	     		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			    String nextDate = format.format(tsTomorrow);
	
			    dateList.put("room", room);
			    dateList.put("date1", nextDate);
			    dateList.put("date2", afterDate);
			    dateList.put("state", "예약가능");
	     		
	     	}else {
	     		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			    String nextDate = format.format(tsTomorrow);
			    
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
	
	
	//사용자 입력받은 예약 일정 db에 저장
	public String reservationSave(Map<String, Object> map) {
		 String id = (String)map.get("id");
		 String tmpCode = (String)map.get("code"); 
	     String tmpAllDay = (String)map.get("allDay");
	     String tmpStartDay = (String)map.get("startDay");
	     String tmpEndDay = (String)map.get("endDay");
	     String tmpPeople = (String)map.get("people");
	     String tmpPrice = (String)map.get("price");
	     System.out.println();
		 
	     String allDay = tmpAllDay.substring(0, 1);
	     
	     String startDay= tmpStartDay.substring(0, 10);
	     String endDay = tmpEndDay.substring(0, 10);
	     
	     int peopleNum = tmpPeople.indexOf("명");
	     String strPeople = tmpPeople.substring(0, peopleNum);
	     int people = Integer.parseInt(strPeople);
	     
	     int pricevalue = tmpPrice.indexOf("원");
	     String price = tmpPrice.substring(0, pricevalue);
	 
	     String c1 = tmpCode.substring(0, 1);
	     String c2 = tmpCode.substring(0, 3);
	     String c3 = tmpCode.substring(0, 5);
	     String c4 = tmpCode.substring(0, 7);
	     
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date now = new Date();
	      Timestamp ordertime = new Timestamp(now.getTime());

	      
		try {
			Date date1 = (Date) sdf.parse(startDay);
			Date date2 = (Date) sdf.parse(endDay);
		      Timestamp timestampstart = new Timestamp(date1.getTime());
		      Timestamp timestampend = new Timestamp(date2.getTime());

		      Reservation re = new Reservation();
		      re.setId(id);
		      re.setCategory1(c1); //야영장
		      re.setCategory2(c2); //가야산
		      re.setCategory3(c3); //삼정
		      re.setCategory4(c4); //자동자야영장
		      re.setRoom(tmpCode); //01번방
		      re.setOrderTime(ordertime);
		      re.setPeople(people);
		      re.setPrice(price);
		      re.setAllDay(allDay);
		      re.setStartDay(timestampstart);
		      re.setEndDay(timestampend);
		      re.setChecked(false);//결제확정유무
		      rr.save(re).getSeq();
		      
		} catch (ParseException e) {
			e.printStackTrace();
		}
	      
		return "예약이 완료되었습니다.";
	
	}
	
	

	
	// (끝)작성자: 최현하 (A-야영장)==============================================
	
	
	
	// (시작)작성자: 최현하 (B-대피소)==============================================
	// B0101(대피소-산-대피소명)으로 검색하여 데이터 반환 
	public Map<String, Object> shelterView(String code1, String code2) throws Exception {
		//ex)B0101(대피소-지리산-벽소령)
		Map<String, Object> map = new HashMap<String, Object>();
		List<PlaceDTO> list1 = new ArrayList<PlaceDTO>();
		List<PlaceDTO> list2 = new ArrayList<PlaceDTO>();
		List<PlaceDTO> list3 = new ArrayList<PlaceDTO>();
		
		Place place1 = pr.findByCategory3(code1).get(0);
			PlaceDTO dto = new PlaceDTO();
			
			String c2 = place1.getCategory2();
			String c3 = place1.getCategory3();
			dto.setCategory2(mcs.findCategory(c2)); //지리산
			dto.setCategory3(mcs.findCategory(c3)); //벽소령 대피소
			dto.setRoomMax(place1.getRoomMax()); 
			
			list1.add(dto);

		List<Place> place2 = pr.findByCategory2(code2);
		for(Place p : place2) {
			PlaceDTO tmp1 = new PlaceDTO();
			PlaceDTO tmp2 = new PlaceDTO();
			
			String category3 = p.getCategory3();
			tmp1.setCategory3(mcs.findCategory(category3));
			tmp2.setCategory3(category3);
			
			list2.add(tmp1);
			list3.add(tmp2);
			
		}
		
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		
		return map;
	}
	
	

	
	//대피소 예약 테이블에서 날짜 별로 예약 현황 조회
	public Map<String, Object> STreservationState(String[] rooms){
		Map<String, Object> map =new HashMap<>();
		List<String> reservations = new ArrayList<>();
		List<String> roomList = new ArrayList<>();
		List<String> dateList = new ArrayList<>();
		
	     for(int i = 0; i < rooms.length; i++) {
	    	 
	     for(int j = 0; j < 23; j ++) {
	       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	 
	       Calendar cal = Calendar.getInstance();

	    	 
	     cal.add(Calendar.DATE, +j); //현재 날짜 생성 후, +j(순차증가)
	     String strDate1 = sdf.format(cal.getTime());  
	     
	     
			try {
				Date date1 = (Date) sdf.parse(strDate1);
				
				 Timestamp tsToday = new Timestamp(date1.getTime());
			     
			     List<Reservation> check1 = rr.findByCategory3AndStartDay(rooms[i], tsToday);
			     
		    	 if(check1.size() == 0 ) {
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
	
	

	//선택된 날짜에서 1박2일로 예약 가능한지 불가한지 확인
	public Map<String, String> SToneNightCheck(String room, String date) {
		Map<String, String> dateList = new HashMap<>();
		 
	    Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    
	try {
			Date date1 = sdf.parse(date); //String -> Date
			cal.setTime(date1); //Date에서 Calendar에 입력
			cal.add(Calendar.DATE, +1); //1일 증가시킴
			String strDate = sdf.format(cal.getTime()); //Calendar에서 얻어서 다시 String
			Date date2 = (Date) sdf.parse(strDate); //String -> Date
			Timestamp tstomorrow = new Timestamp(date2.getTime()); //Date -> Timestamp
			
		     List<Reservation> check1 = rr.findByCategory3AndStartDay(room, tstomorrow );
			
	     	if(check1.size() == 0 ) {
	     		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			    String nextDate = format.format(tstomorrow);
			    
			    dateList.put("room1", room);
			    dateList.put("room2", mcs.category3(room));
			    dateList.put("date", nextDate);
			    dateList.put("state", "예약가능");
	     		
	     	}else {
	     		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			    String nextDate = format.format(tstomorrow);
			    
	     		dateList.put("room1", room);
	     		dateList.put("room2", mcs.category3(room));
			    dateList.put("date", nextDate);
			    dateList.put("state", "예약불가");
	     		
	     	}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return dateList;
		 
	}
	
	//사용자가 선택한 날짜가 예약 가능할 경우, 예약 정보를 받아 옴
	public Map<String, String> STinputSelectInfo(String room) {
		Map<String, String> map = new HashMap<>();
		
		List<Place> places = pr.findByCategory3(room);
		
		for(Place place : places) {
			String c1 = mcs.findCategory(place.getCategory1());
			String c2 = mcs.findCategory(place.getCategory2());
			String c3 = mcs.findCategory(place.getCategory3());
			String price = place.getPriceDay();
			String people = Integer.toString(place.getPeopleMax());
			 
			
			map.put("c1", c1);
			map.put("c2", c2);
			map.put("c3", c3);
			map.put("price", price);
			map.put("people", people);
		}
		
		return map;
	}
	
	
	//사용자 입력받은 예약 일정 DB에 저장
	public String STreservationSave(Map<String, Object> map) {
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
		      re.setId(id);
		      re.setCategory1(c1); //대피소
		      re.setCategory2(c2); //지리산
		      re.setCategory3(c3); //벽소령
		      re.setOrderTime(orderTime);
		      re.setPeople(people);
		      re.setPrice(price);
		      re.setAllDay(allDay);
		      re.setStartDay(timeStampStart);
		      re.setEndDay(timeStampEnd);
		      re.setChecked(false);//결제확정유무
		      rr.save(re).getSeq();
		      
		} catch (ParseException e) {
			e.printStackTrace();
		}
	      
		return "예약이 완료되었습니다.";
	
	}
	
	

	
	// (끝)작성자: 최현하 (B-대피소)==============================================
	
	


	// (시작)작성자: 김수정 ==============================================
	// 제목 category1(대분류), category2(중분류) 코드 해석
	public String[] transtitleCode(String category) {
		String[] result = new String[2];
		result[0] = mcs.category1(category);
		result[1] = mcs.category2(category);
		return result;
	}

	// 야영장 객실종류 출력 (코드입력 'A01')
	public List<PlaceDTO> selectCamRoomType(String parkId) {
		// (출력 : A0101, A0102, A0102)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		// System.out.println("리스트 출력: " + listDate);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
			result = mcs.category3(list.getCategory3());
			list.setNameCategory3(result);
			result = mcs.category4(list.getCategory4());
			list.setCategory4(result);
		}
		return listDate;
	}

	// 대피소 객실종류 출력 (코드입력 'B01')
	public List<PlaceDTO> selectSherRoomType(String parkId) {
		// (출력 : B0101, B0102, B0103)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		// System.out.println("리스트 출력: " + listDate);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
			result = mcs.category3(list.getCategory3());
			list.setNameCategory3(result);
			result = mcs.category4(list.getCategory4());
			list.setCategory4(result);
		}
		return listDate;
	}

	// 생태탐방원 객실종류 출력 (코드입력 'A08')
	public List<PlaceDTO> selectEcoRoomType(String parkId) {
		// (출력 : C0801, C0802, C0803)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		// System.out.println("리스트 출력: " + listDate);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
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
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
			result = mcs.category3(list.getCategory3());
			result = transRoomType(result);
			list.setNameCategory3(result);

		}
		return listDate;
	}

	// 방 찾기 (코드입력 'A0801')
	public PlaceDTO selectCategory3(String parkId) throws Exception {
		String cat1 = parkId.substring(0, 1);

		ArrayList<Place> datas = pr.findByCategory3(parkId);
		Place data = datas.get(0);
		PlaceDTO result = new PlaceDTO(data);
		String in = mcs.category1(data.getCategory1());
		result.setNameCategory1(in);
		in = mcs.category2(data.getCategory2());
		result.setNameCategory2(in);
		in = mcs.category3(data.getCategory3());
		if (cat1 == "D")
			in = transRoomType(in);
		result.setNameCategory3(in);
		return result;
	}

	// 방 찾기 (코드입력 'A0801')
	public PlaceDTO selectCategory4(String parkId) throws Exception {
		String cat1 = parkId.substring(0, 1);

		ArrayList<Place> datas = pr.findByCategory4(parkId);
		Place data = datas.get(0);
		PlaceDTO result = new PlaceDTO(data);
		String in = mcs.category1(data.getCategory1());
		result.setNameCategory1(in);
		in = mcs.category2(data.getCategory2());
		result.setNameCategory2(in);
		in = mcs.category3(data.getCategory3());
		if (cat1 == "D")
			in = transRoomType(in);
		result.setNameCategory3(in);
		in = mcs.category4(data.getCategory4());
		result.setNameCategory4(in);
		return result;
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

	// 남은 방 검증(코드입력 'D0101', 입실일, 퇴실일)
	public int roomRestCategory3(String parkId, String diff, String startDate, String endDate) throws ParseException {
		System.out.println("서비스 카테고리3 ");
		Integer minback = Integer.parseInt(diff);
		// 1. place테이블에서 해당코드로 roomMax 알아내기
		ArrayList<Place> list = pr.findByCategory3(parkId);
		Integer roomMax = list.get(0).getRoomMax(); // 해당 코드 방의 갯수
		// System.out.println("장소 찾아내기>> 코드: " + list.get(0).getCategory4() + ", 룸 예약 가능
		// 수: " + roomMax);

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
		// System.out.println("timeStamp형식: " + betweenStart + ", " + betweenEnd);

		// 3.동일한 장소 코드와 날짜 사이에 해당하는 예약데이터 찾기
		List<Reservation> SelectDatas = rr.findAllByStartDayBetweenAndCategory3(betweenStart, betweenEnd, parkId);
		if (SelectDatas.isEmpty() == true) {
			return roomMax;
		}
//					System.out.println("DB가져온 값 =========================================================================");
//					for (Reservation data : SelectDatas) {
//						System.out.println("코드: " + data.getCategory4() + ", 관리번호: " + data.getSeq() + ", 입실일: "
//								+ data.getStartDay() + ", 퇴실일: " + data.getEndDay());
//					}
//					System.out.println("====================================================================================");

		ArrayList<Integer> arrList = new ArrayList<Integer>();
		for (int i = 0; i < minback; i++) {
			// 입실일 timeStamp형식 변환
			Timestamp timeStampStart = new Timestamp(date1.getTime());
			cal.setTime(timeStampStart);
			cal.add(Calendar.DATE, i);
			timeStampStart.setTime(cal.getTime().getTime());
			// System.out.println("(선택한날짜 순서대로 출력 중)실험군 날짜들 >> " + timeStampStart);

			// DB 예약된 데이터 한개씩 동일한 날짜 예약이 있는지 확인
			Timestamp save;
			for (Reservation data : SelectDatas) {
				Integer count = roomMax; // 4
				int num = Integer.parseInt(data.getAllDay());

				save = new Timestamp(data.getStartDay().getTime());
				// System.out.println("대조군 >> 관리번호 : " + data.getSeq() + ", 박일수 : " + num + ",
				// 시작-끝: " + data.getStartDay()+ ", " + data.getEndDay());

				for (int j = 0; j < num; j++) {
					Calendar calCompare = Calendar.getInstance();
					calCompare.setTime(save);
					calCompare.add(Calendar.DATE, j);
					save.setTime(calCompare.getTime().getTime());
					// System.out.println("봐보자: "+data.getStartDay());
					// System.out.println("대조군 날짜들 >> " + save);

					if (timeStampStart.equals(save)) {
						// System.out.println(" +=> 동일 ");
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
		// System.out.println("룸 비교 리스트 : " + arrList + ", 최솟값(해당 날짜에 예약가능 갯수): " +
		// min);
		return min;
	}

	// 남은 방 검증(코드입력 'D0101', 입실일, 퇴실일)
	public int roomNumCategory3(ReservationDTO resDto, String startDate, String endDate) throws ParseException {
		System.out.println("서비스 카테고리3 ");
		String parkId = resDto.getCategory3();
		Integer minback = transMinback(resDto.getAllDay());
		// System.out.println("민박 넘어온 값 : "+resDto.getAllDay());
		// 1. place테이블에서 해당코드로 roomMax 알아내기
		ArrayList<Place> list = pr.findByCategory3(parkId);
		Integer roomMax = list.get(0).getRoomMax(); // 해당 코드 방의 갯수
		// System.out.println("장소 찾아내기>> 코드: " + list.get(0).getCategory4() + ", 룸 예약 가능
		// 수: " + roomMax);

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
		// System.out.println("timeStamp형식: " + betweenStart + ", " + betweenEnd);

		// 3.동일한 장소 코드와 날짜 사이에 해당하는 예약데이터 찾기
		List<Reservation> SelectDatas = rr.findAllByStartDayBetweenAndCategory3(betweenStart, betweenEnd, parkId);
		if (SelectDatas.isEmpty() == true) {
			return roomMax;
		}
//				System.out.println("DB가져온 값 =========================================================================");
//				for (Reservation data : SelectDatas) {
//					System.out.println("코드: " + data.getCategory4() + ", 관리번호: " + data.getSeq() + ", 입실일: "
//							+ data.getStartDay() + ", 퇴실일: " + data.getEndDay());
//				}
//				System.out.println("====================================================================================");

		ArrayList<Integer> arrList = new ArrayList<Integer>();
		for (int i = 0; i < minback; i++) {
			// 입실일 timeStamp형식 변환
			Timestamp timeStampStart = new Timestamp(date1.getTime());
			cal.setTime(timeStampStart);
			cal.add(Calendar.DATE, i);
			timeStampStart.setTime(cal.getTime().getTime());
			// System.out.println("(선택한날짜 순서대로 출력 중)실험군 날짜들 >> " + timeStampStart);

			// DB 예약된 데이터 한개씩 동일한 날짜 예약이 있는지 확인
			Timestamp save;
			for (Reservation data : SelectDatas) {
				Integer count = roomMax; // 4
				int num = Integer.parseInt(data.getAllDay());

				save = new Timestamp(data.getStartDay().getTime());
				// System.out.println("대조군 >> 관리번호 : " + data.getSeq() + ", 박일수 : " + num + ",
				// 시작-끝: " + data.getStartDay()+ ", " + data.getEndDay());

				for (int j = 0; j < num; j++) {
					Calendar calCompare = Calendar.getInstance();
					calCompare.setTime(save);
					calCompare.add(Calendar.DATE, j);
					save.setTime(calCompare.getTime().getTime());
					// System.out.println("봐보자: "+data.getStartDay());
					// System.out.println("대조군 날짜들 >> " + save);

					if (timeStampStart.equals(save)) {
						// System.out.println(" +=> 동일 ");
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
		// System.out.println("룸 비교 리스트 : " + arrList + ", 최솟값(해당 날짜에 예약가능 갯수): " +
		// min);
		return min;
	}

	// 남은 방 검증(코드입력 'A010101', 입실일, 퇴실일)
	public int roomRest_Category4(ReservationDTO resDto, String startDate, String endDate) throws ParseException {
		// System.out.println("서비스 카테고리4 ");
		String parkId = resDto.getCategory4();
		Integer minback = transMinback(resDto.getAllDay());
		// System.out.println("민박 넘어온 값 : "+resDto.getAllDay());
		// 1. place테이블에서 해당코드로 roomMax 알아내기
		ArrayList<Place> list = pr.findByCategory4(parkId);
		Integer roomMax = list.get(0).getRoomMax(); // 해당 코드 방의 갯수
		// System.out.println("장소 찾아내기>> 코드: " + list.get(0).getCategory4() + ", 룸 예약 가능
		// 수: " + roomMax);

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
		// System.out.println("timeStamp형식: " + betweenStart + ", " + betweenEnd);

		// 3.동일한 장소 코드와 날짜 사이에 해당하는 예약데이터 찾기
		List<Reservation> SelectDatas = rr.findAllByStartDayBetweenAndCategory4(betweenStart, betweenEnd, parkId);
		if (SelectDatas.isEmpty() == true) {
			return roomMax;
		}
//				System.out.println("DB가져온 값 =========================================================================");
//				for (Reservation data : SelectDatas) {
//					System.out.println("코드: " + data.getCategory4() + ", 관리번호: " + data.getSeq() + ", 입실일: "
//							+ data.getStartDay() + ", 퇴실일: " + data.getEndDay());
//				}
//				System.out.println("====================================================================================");

		ArrayList<Integer> arrList = new ArrayList<Integer>();
		for (int i = 0; i < minback; i++) {
			// 입실일 timeStamp형식 변환
			Timestamp timeStampStart = new Timestamp(date1.getTime());
			cal.setTime(timeStampStart);
			cal.add(Calendar.DATE, i);
			timeStampStart.setTime(cal.getTime().getTime());
			// System.out.println("(선택한날짜 순서대로 출력 중)실험군 날짜들 >> " + timeStampStart);

			// DB 예약된 데이터 한개씩 동일한 날짜 예약이 있는지 확인
			Timestamp save;
			for (Reservation data : SelectDatas) {
				Integer count = roomMax; // 4
				int num = Integer.parseInt(data.getAllDay());

				save = new Timestamp(data.getStartDay().getTime());
				// System.out.println("대조군 >> 관리번호 : " + data.getSeq() + ", 박일수 : " + num + ",
				// 시작-끝: " + data.getStartDay()+ ", " + data.getEndDay());

				for (int j = 0; j < num; j++) {
					Calendar calCompare = Calendar.getInstance();
					calCompare.setTime(save);
					calCompare.add(Calendar.DATE, j);
					save.setTime(calCompare.getTime().getTime());
					// System.out.println("봐보자: "+data.getStartDay());
					// System.out.println("대조군 날짜들 >> " + save);

					if (timeStampStart.equals(save)) {
						// System.out.println(" +=> 동일 ");
						count--;
					}
				}

				arrList.add(count);
			}
		}
		// System.out.println(arrList);
		int min = arrList.get(0);
		for (int i = 0; i < arrList.size(); i++) {
			int num = arrList.get(i);
			if (min > num)
				min = num;
		}
		// System.out.println("룸 비교 리스트 : " + arrList + ", 최솟값(해당 날짜에 예약가능 갯수): " +
		// min);
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

	// 예약하기
	public void reservation(ReservationDTO resDto, String startDt, String endDt) throws Exception {
		Reservation re = new Reservation();

		// 관리코드
		PlaceDTO place = selectCategory3(resDto.getCategory3());
		re.setCategory1(place.getCategory1());
		re.setCategory2(place.getCategory2());
		re.setCategory3(place.getCategory3());

		// 이용시간
		String betweenDt = resDto.getAllDay();
		if (betweenDt.equals("1박 2일")) {
			betweenDt = "1";
		} else if (betweenDt.equals("2박 3일")) {
			betweenDt = "2";
		} else if (betweenDt.equals("3박 4일")) {
			betweenDt = "3";
		}

		// 주문시간, 입실일, 퇴시일 자료형변환
		Date now = new Date();
		Timestamp orderTime = new Timestamp(now.getTime());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = (Date) sdf.parse(startDt);
		Date date2 = (Date) sdf.parse(endDt);
		Timestamp timeStampStart = new Timestamp(date1.getTime());
		Timestamp timeStampEnd = new Timestamp(date2.getTime());

		String price = resDto.getPrice().substring(0, resDto.getPrice().indexOf(" "));
		price = price.replaceAll("원", "");
		
		re.setOrderTime(orderTime);
		re.setStartDay(timeStampStart);
		re.setEndDay(timeStampEnd);
		re.setAllDay(betweenDt);
		re.setPeople(resDto.getPeople());
		re.setPrice(price);

		re.setId(resDto.getId());//1204추가
		re.setChecked(false);//1204추가

		rr.save(re).getSeq();
	}

	public void test() throws ParseException {
		// date > timestamp 형변환
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = (Date) format.parse("2022-02-03");
//		Timestamp timestamp = new Timestamp(date.getTime());
//		System.out.println("타임스탬프 : " + timestamp);

		// 3박4일 시작일 + 3일
//		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//		String startDay = "2022-11-24";
//		String endDay = "2022-11-27";
//		
//		Date date1 = (Date) sdf1.parse(startDay);
//		Timestamp BetweenStart = new Timestamp(date1.getTime());
//		
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(BetweenStart);
//		cal.add(Calendar.DATE, 3);
//		BetweenStart.setTime(cal.getTime().getTime());
//		System.out.println(BetweenStart);

		// 데이터 삽입하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		Timestamp orderTime = new Timestamp(now.getTime());

		String startDay = "2022-12-04";
		String endDay = "2022-12-05";
		Date date1 = (Date) sdf.parse(startDay);
		Date date2 = (Date) sdf.parse(endDay);
		Timestamp timeStampStart = new Timestamp(date1.getTime());
		Timestamp timeStampEnd = new Timestamp(date2.getTime());
		System.out.println(timeStampStart.getDate());

//		Reservation re = new Reservation();
//		re.setId("user1");
//		re.setCategory1("D");
//		re.setCategory2("D01");
//		re.setCategory3("D0103");
//		re.setOrderTime(orderTime);
//		re.setPeople(2);
//		re.setPrice("40000");
//		
//		re.setAllDay("1");
//		re.setStartDay( timeStampStart);
//		re.setEndDay(timeStampEnd);
//		rr.save(re).getSeq();
	}
	// (끝)작성자: 김수정 ==============================================

	// (시작)작성자: 공주원================================================
	// - 나의 예약 목록 가져오기
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd[E]");
	SimpleDateFormat orderFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String[] nights = {"1박2일","2박 3일","3박 4일"}; 
	public String reservationList(Model model, String reserve, Integer page, Integer size,RedirectAttributes redirectAttrs) {
		
		if(session.getAttribute("id")==null) {
			redirectAttrs.addFlashAttribute("msg","로그인 먼저 해 주세요");
			return "redirect:login";
		}
		String id = (String)session.getAttribute("id");
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		
		PageRequest pageRequest = PageRequest.of(page, size);
		Page<Reservation> result = null;
		if(reserve.equals("future")) {
			result = rr.findByStatusAndFuture(id,"reserve","pay", timestamp, pageRequest);
			
			
		}else if(reserve.equals("past")) {
			result = rr.findByStatusAndPast(id,"reserve","pay", timestamp, pageRequest);
		}
		
		List<Reservation> reservations = result.getContent();
		int totalPage = result.getTotalPages();
		if(totalPage == 0) {
			totalPage = 1;
		}
		ArrayList<ReservationDTO> rds = new ArrayList<ReservationDTO>(); 

		for(Reservation r : reservations) {
			ReservationDTO rd = reserve(r);
			rds.add(rd);
		}
		
		model.addAttribute("reservations", rds);
		model.addAttribute("totalPage", totalPage);
		
		
		return "user/reservedList";
		
	}
	//나의 예약 디테일 정보
	public String reservationDetail(Model model, Integer seq, RedirectAttributes redirectAttrs) {
		String id = (String)session.getAttribute("id");
		if(id == null) {
			redirectAttrs.addFlashAttribute("msg","로그인 먼저 해 주세요.");
			return "redirect:login";
		}
		User user = ur.findByid(id);
		Reservation reservation = rr.findBySeqAndId(seq,id);
		if(reservation == null) {
			System.out.println("reservation"+reservation);
			redirectAttrs.addFlashAttribute("msg","잘못된 접근입니다.");
			session.invalidate();
			return "redirect:login";
		}
		ReservationDTO reservationDto = reserve(reservation);
		model.addAttribute("detail", reservationDto);
		model.addAttribute("user", user);
		
		System.out.println(reservation);
		return "user/reservationDetail";
	}
	
	public ReservationDTO reserve(Reservation r) {
		ReservationDTO rd = new ReservationDTO();
		rd.setSeq(r.getSeq());
		rd.setCategory1(r.getCategory1());
		rd.setNameCategory1(mcs.findCategory(r.getCategory1()));
		rd.setCategory2(r.getCategory2());
		rd.setNameCategory2(mcs.findCategory(r.getCategory2()));
		rd.setCategory3(r.getCategory3());
		rd.setNameCategory3(mcs.findCategory(r.getCategory3()));
		if(r.getCategory4()==null) {
			rd.setCategory4(" ");
			rd.setNameCategory4(" ");
		}else {
			rd.setCategory4(r.getCategory4());
			rd.setNameCategory4(mcs.findCategory(r.getCategory4()));
		}
		if(r.getRoom()==null) {
			rd.setRoom(" ");
		}else rd.setRoom("- "+r.getRoom().substring(7,9));
		
		rd.setPeriod(format.format(r.getStartDay()) + "~" + format.format(r.getEndDay())+nights[Integer.parseInt(r.getAllDay())-1]);
	
		rd.setOrderTime(orderFormat.format(r.getOrderTime()));
		rd.setStartDay(r.getStartDay());
		
		rd.setEndDay(r.getEndDay());
		rd.setPeople(r.getPeople());
		rd.setAllDay(r.getAllDay());
		rd.setPrice(r.getPrice());
		if(r.getChecked()) {
			rd.setChecked("결제완료");
		}else rd.setChecked("미결제");
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		if(r.getStartDay().after(now)) {
			rd.setIsDone(false);
		}else rd.setIsDone(true);
		return rd;
	}
	//결제 성공시 데이터베이스 입력
	public String savePayment(Model model, String imp_uid, String merchant_uid, String seq, RedirectAttributes ra) {
		if(session.getAttribute("id")==null) {
			ra.addFlashAttribute("msg","로그인 먼저 해 주세요");
			return "redirect:login";
		}
		Integer i = Integer.parseInt(seq);
		System.out.println(i);
		Reservation re = rr.findBySeq(i);
		re.setPaidNum(imp_uid);
		re.setMerchant_uid(merchant_uid);
		re.setChecked(true);
		re.setStatus("pay");
		rr.save(re);
		
		String id = (String)session.getAttribute("id");
		User user = ur.findByid(id);
		ReservationDTO reservationDto = reserve(re);
		model.addAttribute("detail", reservationDto);
		model.addAttribute("user", user);
		
		return "user/reservationDetail";
	}
	//예약취소
	public String cancleReserveData(Model model, String seq, RedirectAttributes ra) {
	
		Integer i = Integer.parseInt(seq);
		Reservation reservation = rr.findBySeq(i);
		if(reservation.getStatus().equals("reserve")) {
			System.out.println("여기옴?");
			reservation.setStatus("cancle");
			rr.save(reservation);
		}else if(reservation.getStatus().equals("pay")) {
			reservation.setStatus("refund");
			rr.save(reservation);
		}
		ra.addFlashAttribute("msg","삭제되었습니다.");
	
		return "redirect:reservedList?reserve=future&page=0&size=10";
		
	}
	
	//예약 데이터 임시로 만들기
	//@PostConstruct
	    public void initializing(){
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Date now = new Date();
	      Timestamp orderTime = new Timestamp(now.getTime());
	      
	      String startDay = "2022-12-05";
	      String endDay = "2022-12-07";
	      Date date1 = null;
	      Date date2 = null;
		try {
			date1 = (Date)sdf.parse(startDay);
			date2 = (Date)sdf.parse(endDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	      Timestamp timeStampStart = new Timestamp(date1.getTime());
	      Timestamp timeStampEnd = new Timestamp(date2.getTime());

	      Reservation re = new Reservation();
	      re.setId("user");
	      re.setCategory1("A");
	      re.setCategory2("A01");
	      re.setCategory3("A0103"); 
	      re.setCategory4("A010301");
	      re.setRoom("A01030101");
	      re.setOrderTime(orderTime);
	      re.setPeople(2);
	      re.setPrice("60000");
	      re.setAllDay("1");
	      re.setStartDay(timeStampStart);
	      re.setEndDay(timeStampEnd);
	      re.setChecked(false);
	      rr.save(re);
		 
	 }
	

	// (끝)작성자: 공주원===================================================

}
