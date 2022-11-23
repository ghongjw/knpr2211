package com.reservation.knpr2211.service;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.entity.Favorite;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.FavoriteRepository;
import com.reservation.knpr2211.repository.PlaceRepository;
import com.reservation.knpr2211.repository.UserRepository;

@Service
public class PlaceService implements IPlaceService {
	@Autowired MountainCodeService mcs;
	@Autowired PlaceRepository pr;
	@Autowired UserRepository ur;
	@Autowired FavoriteRepository fr;
	@Autowired HttpSession session;


	@Transactional
	public ArrayList<PlaceDTO> selectPlace(String parkId,String parkDetail){
		System.out.println("parkId : "+parkId);
		if(parkDetail==null && parkDetail.isEmpty() && parkId == null && parkId.isEmpty()) {
			
			parkId="A01";
			parkDetail = "A0101";
		}
		if(parkDetail==null||parkDetail.isEmpty()) {
			parkDetail = parkId+"01";
		}if(parkId==null&&parkDetail!=null) {
			parkId = parkDetail.substring(0,3);
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
			//System.out.println("a"+a);
		}
		
		session.setAttribute("category2s", category2s);
		session.setAttribute("category3s", category3s);
		session.setAttribute("nameOfCategory2s", nameOfCategory2s);
		session.setAttribute("nameOfCategory3s", nameOfCategory3s);
		session.setAttribute("selectedParkDetail", parkDetail);
		
		
		ArrayList<Place>  places;
		if(category1.equals("C")||category1.equals("D")) {
			places= pr.find(parkId);
		}else
		places= pr.findByCategory3(parkDetail);
		
		System.out.println("places"+places);
		ArrayList<PlaceDTO> placeDtos = new ArrayList<>();
		
		for(Place a : places){
			
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
		} 
		
		
		int imagecount = imageFile(parkDetail);
		session.setAttribute("imagecount", imagecount);
		System.out.println(imagecount);
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
	
	@Transactional
	public ArrayList<PlaceDTO> selectMountain(String mountain){
		
		
		String category1 = mountain.substring(0,1);
		String category2 = mountain.substring(0,3);
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
		
		
		ArrayList<Place>  places= pr.findByCategory3(mountain);
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
		
		
	
	 return placeDtos;
	 
	}


	//즐겨찾기 조회
	public String checkFavorite(String param) {
		User entity = ur.findByid((String)session.getAttribute("id"));
		//User entity = ur.findByid("admin");
		param = param.substring(0, param.length() - 1);
		List<Favorite> list = fr.findByFavorite(entity);
	
		for(Favorite f : list) {
			if(f.getPlace().equals(param)) {
				if(f.isChecked()==true) {
					return "y";
				}else {
					return "n";
				}
			}
		}return "n";
	}
	//즐겨찾기 토글
	public String toggleCheck(HashMap<String, String> map) {
		if(session.getAttribute("id")==null) return "goLoginFirst";
		User entity = ur.findByid((String)session.getAttribute("id"));
	//	String id = "admin";
	//	User entity = ur.findByid(id);
		
		
		List<Favorite> list = fr.findByFavorite(entity);
		if(list.isEmpty()||list==null) {
			
			System.out.println("map : " + map.get("parkId"));
			Favorite f = Favorite.builder().place(map.get("parkId")).checked(true).favorite(entity).build();
			fr.save(f);
			return "y";
		}
		for(Favorite f : list) {
			if(f.getPlace().equals(map.get("parkId"))) {
				if(f.isChecked()==true) {
					f = Favorite.builder().place(map.get("parkId")).checked(false).favorite(entity).build();
					System.out.println("here : " + f);
					fr.save(f);
					return "n";
				}else {
				f = Favorite.builder().place(map.get("parkId")).checked(true).favorite(entity).build();
				fr.save(f);
				return "y";
				}
			
				}
			}
		Favorite f = Favorite.builder().place(map.get("parkId")).checked(true).favorite(entity).build();
		fr.save(f);
		return "y";
	}
	
}