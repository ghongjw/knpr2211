
package com.reservation.knpr2211.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.repository.PlaceRepository;
import com.reservation.knpr2211.repository.ReservationRepository;


@Service
public class ReservationService {

	@Autowired
	MountainCodeService mcs;

	@Autowired
	PlaceRepository pr;
	
	@Autowired
	ReservationRepository rr;

	public List<PlaceDTO> campsiteView(String code) throws Exception {
		// A0101
		String category1 = code.substring(0, 1);
		String category2 = code.substring(1, 3);
		String category3 = code.substring(3, 5);

		List<PlaceDTO> list = new ArrayList<PlaceDTO>();

		
		//Entity ID로 검색해서 get()을 통해 객체 반환
		//Place op = pr.findById(1).get();
		//System.out.println(op.toString());
		
		List<Place> places = pr.findByCategory1AndCategory2AndCategory3(category1, category2, category3);
		


		// Entity ID로 검색해서 get()을 통해 객체 반환
		// Place op = pr.findById(1).get();
		// System.out.println(op.toString());

		//List<Place> places = pr.findByCategory2AndCategory3(category2, category3);

		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();
			String c1 = place.getCategory1();
			String c2 = place.getCategory2();
			String c3 = place.getCategory3();
			String c4 = place.getCategory4();
			String roomName = place.getRoom().replace("0","");	

			String code1 = c1 + c2;
			String code2 = c1 + c2 + c3;
			String code3 = c1 + c2 + c3 + c4;
			
			dto.setCategory2(mcs.findCategory(code1));
			dto.setCategory3(mcs.findCategory(code2));
			dto.setCategory4(mcs.findCategory(code3));
			dto.setRoom(roomName);
			dto.setRoomMax(place.getRoomMax());
			
			list.add(dto);

		}
	
		return list;
	}
	
	
	public List<String> checkBoxList(String code) throws Exception {
		String category1 = code.substring(0, 1);
		String category2 = code.substring(1, 3);
		String category3 = code.substring(3, 5);
		
		
		List<String> cmapsiteNames = new ArrayList<>();
		List<String> checkList = new ArrayList<>();
		
		List<Place> places = pr.findByCategory1AndCategory2AndCategory3(category1, category2, category3);
		for (Place place : places) {
			String c1 = place.getCategory1();
			String c2 = place.getCategory2();
			String c3 = place.getCategory3();
			String c4 = place.getCategory4();
			
			String code3 = c1 + c2 + c3 + c4;
			cmapsiteNames.add(mcs.findCategory(code3));
			
		}
		
			for( String campsite : cmapsiteNames) {
				if(!checkList.contains(campsite)) {
					checkList.add(campsite);
				}
			}
		
		return checkList;
	}
	
	
	public List<PlaceDTO> roomView(String code){
		String category1 = code.substring(0, 1);
		String category2 = code.substring(1, 3);
		String category3 = code.substring(3, 5);
		String category4 = code.substring(5);
		
		
		List<PlaceDTO> rooms = new ArrayList<>();
		
		List<Place> places = pr.findByCategory1AndCategory2AndCategory3AndCategory4(category1, category2, category3, category4);
		
		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();
			
			String c1 = place.getCategory1();
			String c2 = place.getCategory2();
			String c3 = place.getCategory3();
			String c4 = place.getCategory4();
			
			String code3 = c1 + c2 + c3 + c4;

			String campsite = mcs.findCategory(code3);
			dto.setCategory4(campsite);
			
			String roomName = place.getRoom().replace("0","");
			dto.setRoom(roomName);
			
			rooms.add(dto);

			
		}
		
		return rooms;
	}
	

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
