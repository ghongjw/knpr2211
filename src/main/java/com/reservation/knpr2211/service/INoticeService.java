package com.reservation.knpr2211.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reservation.knpr2211.dto.NoticeDTO;

public interface INoticeService {
	
	String FILE_LOCATION = "/opt/tomcat/tomcat-9/webapps/upload";
	
	void writeProc(MultipartHttpServletRequest multi);

	void viewProc(int no, Model model);

	void noticeProc(Model model, int currentPage, String search, String select, HttpServletRequest req);

	void upHit(int no);

	boolean modifyProc(NoticeDTO notice);

	boolean deleteProc(String pw, String pwOk, String no);

	boolean deletes(String pw, String pwOk, String[] checks);
}
