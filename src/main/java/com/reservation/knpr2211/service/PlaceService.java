package com.reservation.knpr2211.service;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.repository.PlaceRepository;

@Service
public class PlaceService implements IPlaceService {
	@Autowired MountainCodeService mcs;
	@Autowired PlaceRepository pr;
	@Autowired HttpSession session;
	@PersistenceContext
	private EntityManager em;

	@Transactional
	public ArrayList<PlaceDTO> selectPlace(String parkId,String parkDetail){
		
		
		if(parkDetail==null||parkDetail.isEmpty()) {
			parkDetail = parkId+"01";
		}
		if(!parkId.equals(parkDetail.substring(0, 3))) {
			parkDetail = parkId+"01";
		}
		
		String category1 = parkDetail.substring(0,1);
		String category2 = parkDetail.substring(0,3);
		//카테고리별 중복제거 값 불러오기
		ArrayList<String> category2s = pr.findDistintCategory2(category1);
		ArrayList<String> category3s = pr.findDistintCategory3(category2);
		//카테고리별 값 한국어로 바꾸기
		ArrayList<String> nameOfCategory2s = new ArrayList<>();
		
		for(String a : category2s) {
			a = mcs.findCategory(a); 
			nameOfCategory2s.add(a);
		}
		ArrayList<String> nameOfCategory3s = new ArrayList<>();
		for(String a : category3s) {
			a = mcs.findCategory(a); 
			nameOfCategory3s.add(a);
		}
		session.setAttribute("category2s", category2s);
		session.setAttribute("category3s", category3s);
		session.setAttribute("nameOfCategory2s", nameOfCategory2s);
		session.setAttribute("nameOfCategory3s", nameOfCategory3s);
		session.setAttribute("selectedParkDetail", parkDetail);
		
		if(parkId.length() == 3) {
			parkId = parkId+"01";
		}
		ArrayList<Place>  places= pr.findByCategory3(parkDetail);
		System.out.println("places"+places);
		ArrayList<PlaceDTO> placeDtos = new ArrayList<>();
		
		for(Place a : places)
		try {
			PlaceDTO placeDto = new PlaceDTO();
			placeDto.setSeq(a.getSeq());
			placeDto.setCategory1(a.getCategory1());
			placeDto.setCategory2(a.getCategory2());
			placeDto.setCategory3(a.getCategory3());
			if(a.getCategory4()!=null||!a.getCategory4().isEmpty()) {
			placeDto.setCategory4(a.getCategory4());
			}
			placeDto.setNameCategory1(mcs.findCategory(a.getCategory1()));
			placeDto.setNameCategory2(mcs.findCategory(a.getCategory2()));
			placeDto.setNameCategory3(mcs.findCategory(a.getCategory3()));
			if(a.getCategory4()!=null||!a.getCategory4().isEmpty())
			placeDto.setNameCategory4(mcs.findCategory(a.getCategory4()));
			
			placeDto.setRoom(a.getRoom());
			placeDto.setRoomMax(a.getRoomMax());
			placeDto.setAddress(a.getAddress());
			placeDto.setMobile(a.getMobile());
			placeDto.setTime(a.getTime());
			placeDto.setPriceWeekend(a.getPriceWeekend());
			placeDto.setPriceDay(a.getPriceDay());
			placeDto.setPeopleMax(a.getPeopleMax());
			placeDto.setMemo(a.getMemo());
			placeDto.setX(a.getX());
			placeDto.setY(a.getY());
			
			placeDtos.add(placeDto);
			System.out.println(placeDtos);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		int imagecount = imageFile(parkDetail);
		session.setAttribute("imagecount", imagecount);
	
	 return placeDtos;
	 
	}

	
	@Override
	public int imageFile(String parkDetail) {
		
		File dir = new File(FILE_LOCATION);
		FilenameFilter filter = new FilenameFilter() {
		    public boolean accept(File f, String name) {
		        return name.startsWith(parkDetail);
		    }
		};
		
		File files[] = dir.listFiles(filter);
		int i = 0;
		for (i = 0; i < files.length; i++) {
		   System.out.println("file: " + files[i]);
		}		return i;
	}
	
	
}