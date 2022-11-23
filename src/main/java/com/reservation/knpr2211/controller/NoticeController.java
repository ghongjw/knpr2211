package com.reservation.knpr2211.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reservation.knpr2211.dto.NoticeDTO;
import com.reservation.knpr2211.service.INoticeService;

@Controller
public class NoticeController {
	final static Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired INoticeService service;
	
	//공지사항등록
	@RequestMapping(value = "writeProc")
	public String writeProc(MultipartHttpServletRequest multi) {
		service.writeProc(multi);
		return "forward:noticeProc";
	}
	
	@RequestMapping(value = "noticeProc")
	public String noticeProc(Model model, 
			@RequestParam(value="currentPage", required = false, defaultValue = "1")int currentPage,
			String search, String select, HttpServletRequest req ) {
		System.out.println("asdsad");
		service.noticeProc(model, currentPage, search, select, req);
		/* return "forward:noticeForm?formpath=notice"; */
		return "notice/noticeForm";
	}
	
	//상세페이지
	@RequestMapping(value = "viewProc")
	public String viewProc(@RequestParam(value = "writeNo", required = false) String writeNo, Model model) {
		if(writeNo == null || writeNo == "")
			return "forward:/index?formpath=notice";
		
		int no = Integer.parseInt(writeNo);
		service.viewProc(no, model);
		service.upHit(no);
		return "notice/viewForm";
	}
	//파일 다운로드
	@RequestMapping(value = "download")
	public void download(@RequestParam(value="fileName") String fileName, HttpServletResponse res) throws Exception {
		if(fileName == "" || "파일 없음".equals(fileName))
			return ;
			
		res.addHeader("Content-disposition", "attachment; filename="+fileName);
		File file = new File(INoticeService.FILE_LOCATION + "\\" + fileName);
		FileInputStream input = new FileInputStream(file);
		FileCopyUtils.copy(input, res.getOutputStream());
		input.close();
	}
	//공지사항 수정
	@RequestMapping(value = "/modifyProc")
	public String modifyProc(NoticeDTO notice) {
		boolean check = service.modifyProc(notice);
		if(check == false) {
			return "forward:index?formpath=modify";
		}
		return "forward:noticeProc";
	}
	//공지사항 삭제
	@RequestMapping(value = "deleteProc")
	public String deleteProc(String pw, String pwOk, String no) {
		boolean check = service.deleteProc(pw, pwOk, no);
		if(check == false) {
			return "redirect:delete";
		}
		return "forward:noticeProc";
	}
	@RequestMapping(value = "deletes")
	public String deletes(String[] checks,String pw, String pwOk ) {
		boolean check = service.deletes(pw, pwOk, checks);
		if(check == false) {
			return "redirect:delete";
		}
		return "forward:noticeProc";
	}
}
