package com.reservation.knpr2211.place.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.palce.entity.Place;
import com.reservation.knpr2211.place.repository.PlaceRepository;
import com.reservation.knpr2211.service.MountainCodeService;

@Service
public class PlaceService {
	@Autowired MountainCodeService mcs;
	@Autowired PlaceRepository pr;
	
	public Place selectPlace(String parkId){
	
		parkId = parkId+"01";
		Place place = pr.findByCategory3(parkId);
		

		String category1 = mcs.findCategory(place.getCategory1());
		String category2 = mcs.findCategory(place.getCategory2());
		place.setCategory1(category1);
		place.setCategory2(category2);
			
	 return place;
	 
	}

}