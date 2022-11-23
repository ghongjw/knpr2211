
package com.reservation.knpr2211.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.repository.PlaceRepository;


@Service
public class ReservationService {

	@Autowired
	MountainCodeService mcs;

	@Autowired
	PlaceRepository pr;

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
	

}
