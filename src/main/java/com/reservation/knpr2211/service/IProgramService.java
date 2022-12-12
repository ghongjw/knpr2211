package com.reservation.knpr2211.service;

public interface IProgramService {

	//이미지가 저장되어 있는 파일 디렉토리
	String FILE_LOCATION = "/opt/tomcat/tomcat-9/webapps/upload";
//	String FILE_LOCATION = "/Users/jeongseung-u/git/knpr2211/src/main/resources/static/cntnts/";
	
	String imageFile(String parkDetail);

}
