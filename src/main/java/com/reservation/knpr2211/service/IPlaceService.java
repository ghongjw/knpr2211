package com.reservation.knpr2211.service;

import java.util.ArrayList;

import com.reservation.knpr2211.dto.PlaceDTO;

public interface IPlaceService {
	//이미지가 저장되어 있는 파일 디렉토리
//	String FILE_LOCATION = "/opt/tomcat/tomcat-9/webapps/upload";
	String FILE_LOCATION = "/Users/largo/git/knpr2211/src/main/resources/static/cntnts/";
	
	public ArrayList<PlaceDTO> selectPlace(String parkId,String parkDetail);
	public int imageFile(String parkDetail);
}
