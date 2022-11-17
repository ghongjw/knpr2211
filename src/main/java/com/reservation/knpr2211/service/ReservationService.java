
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
		String category2 = code.substring(1, 3);
		String category3 = code.substring(3, 5);
		
		List<PlaceDTO> list = new ArrayList<PlaceDTO>();
		
		//Entity ID로 검색해서 get()을 통해 객체 반환
		//Place op = pr.findById(1).get();
		//System.out.println(op.toString());
		
		List<Place> places = pr.findByCategory2AndCategory3(category2, category3);
		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO(place);
			list.add(dto);
		}
		return list;
	}

}
