package com.reservation.knpr2211.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.repository.PlaceRepository;

@Service
public class PlaceService {
	@Autowired MountainCodeService mcs;
	@Autowired PlaceRepository pr;
	

	public List<Place> selectPlace(String parkId){
	
		parkId = parkId+"01";
		List<Place> place = pr.findByCategory3(parkId);
		List<Place> places = new ArrayList<>();
 
		for(Place p : place) {
			
			Place pl = new Place();
			pl.setSeq(p.getSeq());
			pl.setCategory1(mcs.findCategory(p.getCategory1()));
			pl.setCategory2(mcs.findCategory(p.getCategory2()));
			pl.setCategory3(mcs.findCategory(p.getCategory3()));
			pl.setCategory4(mcs.findCategory(p.getCategory4()));
			pl.setAddress(p.getAddress());
			pl.setMobile(p.getMobile());
			pl.setTime(p.getTime());
			pl.setPriceWeekend(p.getPriceWeekend());
			pl.setPriceDay(p.getPriceDay());
			pl.setMax(p.getMax());
			pl.setMemo(p.getMemo());
			pl.setX(p.getX());
			pl.setY(p.getY());
			
			places.add(pl);
			System.out.println("check"+pl.getCategory1());
		}
			
	 return places;
	 
	}

}