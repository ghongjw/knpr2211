package com.reservation.knpr2211.service;

import java.util.ArrayList;

import com.reservation.knpr2211.dto.PlaceDTO;

public interface IPlaceService {
//	String FILE_LOCATION = "/opt/tomcat/tomcat-9/webapps/upload";
	String FILE_LOCATION = "/Users/largo/git/knpr2211/src/main/resources/static/cntnts/";
	
	public ArrayList<PlaceDTO> selectPlace(String parkId,String parkDetail);
	public int imageFile(String parkDetail);
}
