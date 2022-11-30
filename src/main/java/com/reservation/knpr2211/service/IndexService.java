package com.reservation.knpr2211.service;


import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.repository.PlaceRepository;

@Service
public class IndexService implements IIndexService {
	@Autowired MountainCodeService mcs;
	@Autowired PlaceRepository pr;
	@Autowired HttpSession session;
	@PersistenceContext
	private EntityManager em;

	

	@Transactional
	public ArrayList<PlaceDTO> selectMountain1(String mountain1){
		
		
		String category1 = mountain1.substring(0,1);
		String category2 = mountain1.substring(0,3);
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
		session.setAttribute("mountain1", category2s);
		session.setAttribute("Location1", category3s);
		session.setAttribute("nameOfMountain1", nameOfCategory2s);
		session.setAttribute("nameOfLocation1", nameOfCategory3s);
		
		ArrayList<PlaceDTO> placeDtos = new ArrayList<>();
	
		
		
	
	 return placeDtos;
	 
	}


	@Transactional
	public ArrayList<PlaceDTO> selectMountain2(String mountain2){
		
		
		String category1 = mountain2.substring(0,1);
		String category2 = mountain2.substring(0,3);
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
		session.setAttribute("mountain2", category2s);
		session.setAttribute("Location2", category3s);
		session.setAttribute("nameOfMountain2", nameOfCategory2s);
		session.setAttribute("nameOfLocation2", nameOfCategory3s);
		
		ArrayList<PlaceDTO> placeDtos = new ArrayList<>();
	
		
		
	
	 return placeDtos;
	 
	}


	@Transactional
	public ArrayList<PlaceDTO> selectMountain3(String mountain3){
		
		
		String category1 = mountain3.substring(0,1);
		String category2 = mountain3.substring(0,3);
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
		session.setAttribute("mountain3", category2s);
		session.setAttribute("Location3", category3s);
		session.setAttribute("nameOfMountain3", nameOfCategory2s);
		session.setAttribute("nameOfLocation3", nameOfCategory3s);
		
		ArrayList<PlaceDTO> placeDtos = new ArrayList<>();
	
		
		
	
	 return placeDtos;
	 
	}
	@Transactional
	public ArrayList<PlaceDTO> selectMountain4(String mountain4){
		
		
		String category1 = mountain4.substring(0,1);
		String category2 = mountain4.substring(0,3);
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
		session.setAttribute("mountain4", category2s);
		session.setAttribute("Location4", category3s);
		session.setAttribute("nameOfMountain4", nameOfCategory2s);
		session.setAttribute("nameOfLocation4", nameOfCategory3s);
		
		ArrayList<PlaceDTO> placeDtos = new ArrayList<>();
	
		
		
	
	 return placeDtos;
	 
	}


	@Override
	public ArrayList<PlaceDTO> selectPlace(Model model, String parkId, String parkDetail) {
	
		return null;
	}
	
}