package com.reservation.knpr2211.place.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.place.entity.Place;
import com.reservation.knpr2211.place.repository.PlaceRepository;
import com.reservation.knpr2211.service.MountainCodeService;

@Service
public class ecoReservationService {
	@Autowired PlaceRepository pr;
	@Autowired MountainCodeService mcService;
	
	// 객실 종류 리스트 'A08'
	public List<Place> selectRoomType(String parkId) {
		
		List<Place> listDate = pr. findAllByCategory2(parkId);
		// C0801, C0802, C0803
		// ArrayList<String> roomType = new ArrayList<>();
		for( Place list : listDate ) {
			String result = mcService.category3(list.getCategory3());
			list.setCategory3(result);
		}
		return listDate;
	}

	private String[] Add(String[] roomType, String result) {
		// TODO Auto-generated method stub
		return null;
	}
}
