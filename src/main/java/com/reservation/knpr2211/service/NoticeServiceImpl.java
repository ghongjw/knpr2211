package com.reservation.knpr2211.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reservation.knpr2211.dto.LoginDTO;
import com.reservation.knpr2211.dto.NoticeDTO;
import com.reservation.knpr2211.repository.IMemberDAO;
import com.reservation.knpr2211.repository.INoticeDAO;


@Service
public class NoticeServiceImpl implements INoticeService{
	@Autowired private INoticeDAO noticeDao;
	@Autowired INoticeDAO mapper;
	
	//공지사항 등록
	@Override
	public void writeProc(MultipartHttpServletRequest req) {
		String id = (String)session.getAttribute("id");
		String title = req.getParameter("title");
		String content= req.getParameter("content");
		String category1= req.getParameter("category1");
		NoticeDTO notice = new NoticeDTO();
		if ("y".equals(notice.getNoti()) || "n".equals(notice.getNoti()))
			noticeDao.insertMember(notice);
		String noti = req.getParameter("noti");
		
		
		notice.setId(id);		
		notice.setTitle(title); 
		notice.setCategory1(category1);
		notice.setContent(content);	
		notice.setNoti(noti);		
		notice.setHit(0);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		notice.setCreateDate(sdf.format(date));
		
		MultipartFile file = req.getFile("fileName");
		if(file.getSize() != 0) {
			Calendar cal = Calendar.getInstance();
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileName = sdf.format(cal.getTime()) + file.getOriginalFilename();
			notice.setFileName(fileName);
			File save = new File(INoticeService.FILE_LOCATION + "\\" + fileName);
			try {
				file.transferTo(save);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else {
			notice.setFileName("파일 없음");
		}
		
		
		
		mapper.writeProc(notice);
	}
	//공지사항리스트
	@Override
	public void noticeProc(Model model, int currentPage, String search, String select, HttpServletRequest req) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("select", select);
		
		int totalCount = mapper.noticeCount(map);
		int pageBlock = 10;
		int end = currentPage * pageBlock;
		int begin = end+1 - pageBlock;

		ArrayList<NoticeDTO> noticeList = mapper.noticeProc(begin, end, select, search);
		ArrayList<NoticeDTO> noticeList1 = mapper.noticeProc1();
		model.addAttribute("noticeList", noticeList); 
		model.addAttribute("noticeList1", noticeList1);
		//페이징 전환은 이것으로 사용(멤버 서비스 보다는)
		String url = req.getContextPath() + "/noticeProc?";
		if(select != null) {
			url+="select="+select+"&";
			url+="search="+search+"&";	
		}
			url+="currentPage=";
		model.addAttribute("page", PageService.getNavi(currentPage, pageBlock, totalCount, url));
	}
	//상세페이지
	@Override
	public void viewProc(int no, Model model) {
		NoticeDTO notice = mapper.viewProc(no);
		model.addAttribute("notice", notice);
	}
	//조회수
	@Override
	public void upHit(int no) {
		mapper.upHit(no);
	}
	//수정
	@Override
	public boolean modifyProc(NoticeDTO notice) {
		int result = mapper.modifyProc(notice);
		if(result == 0)
			return false;
		return true;
	}

	@Autowired
	HttpSession session;

	@Autowired
	IMemberDAO memberDao;

	private boolean pwcheck(String pw, String pwOk) {
		if (pw == "" || pw == null)
			return false;

		// 회원DB에서 게시글 작성자의 PW와 입력 패스워드 비교 
		LoginDTO check = memberDao.userPassword((String) session.getAttribute("id"));
		BCryptPasswordEncoder encode = new BCryptPasswordEncoder();

		if (check == null || encode.matches(pw, check.getPw()) == false)
			return false;
		return true;
	}

	private void deleteImage(String fileName) {
		File deleteFile = new File(FILE_LOCATION + "//" + fileName);
		deleteFile.delete();
	}

	@Override
	public boolean deleteProc(String pw, String pwOk, String n) {
		boolean check = pwcheck(pw, pwOk);
		if (check == false)
			return false;

		int no = Integer.parseInt(n);

		String fileName = mapper.getFileName(no);
		int result = mapper.deleteProc(no);
		if (result == 0)
			return false;
		deleteImage(fileName);
		return true;
	}

	@Override
	public boolean deletes(String pw, String pwOk, String[] checks) {
		boolean check = pwcheck(pw, pwOk);
		if (check == false)
			return false;
		if (checks == null)
			return false;

		for (String n : checks) {
			int no = 0;
			try {
				no = Integer.parseInt(n);
			} catch (Exception e) {
				continue;
			}

			String fileName = mapper.getFileName(no);
			mapper.deleteProc(no);
			deleteImage(fileName);
		}

		return true;
	}
	 
}
