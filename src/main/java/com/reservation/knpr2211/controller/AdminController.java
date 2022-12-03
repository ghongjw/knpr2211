package com.reservation.knpr2211.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.entity.Attention;
import com.reservation.knpr2211.service.AdminAttentionService;
import com.reservation.knpr2211.service.AdminMemberListService;
import com.reservation.knpr2211.service.AdminOperationService;
import com.reservation.knpr2211.service.IAdminAttentionService;

@Controller
public class AdminController {
	@Autowired AdminMemberListService amls;
	@Autowired AdminOperationService aos;
	@Autowired AdminAttentionService aas;
	
	// (시작)작성자:공주원 ==============================================
	//관리자index 
	@RequestMapping(value = "adminIndex")
	public String adminIndex() {
		return "admin/adminIndex";
	}
	
	//관리자 회원정보조회
	@RequestMapping("adminMemberList")
    public String getAllUserWithPage(Integer page, Integer size,String member,String select, String search, Model model) {
        System.out.println(member+select+search);
		amls.paging(model, page, size, member, select, search );
		
        return "admin/adminMemberList";
    }
	//관리자 회원정보 수정
	@RequestMapping("adminMemberModify")
	public String memberModyfy(Model model,String memberId) {
		
		String msg = amls.memberModify(model,memberId);
		model.addAttribute("msg",msg);
		
		return "admin/adminMemberModify";
	}
	
	//관리자 회원 수정 확인
	@RequestMapping("adminMemberModifyConfirm")
	public String adminMemberModifyConfirm(Model model, String id, String name, String email,String mobile, String member, String deleted) {
		amls.memberModify(model, id, name, email, mobile, member,deleted);

		return "redirect:adminMemberList";
	}
	//관리자 회원 삭제 확인
	@RequestMapping("adminDeleteConfirm")
	public String adminDeleteConfirm(Model model, String id, String name, String email,String mobile, String member, String deleted) {
		amls.memberDelete(model, id, name, email, mobile, member,deleted);
		model.addAttribute("msg","삭제되었습니다");
		
		return "redirect:adminMemberList";
	}
	
	//관리자 회원 예약정보 조회
	@RequestMapping("adminReservationModify")
	public String adminReservationModify(Model model,String memberId, String reserve, Integer page,Integer size,RedirectAttributes redirectAttrs) {
		String url = amls.adminReservationModify(model,memberId, reserve, page, size, redirectAttrs);
	
	return url;
	
	}
	
	//예약 리스트 --> 예약 상세정보
	@PostMapping("adminReservationDetail")
	public String adminReservationDetail(Model model, String memberId, Integer seq,RedirectAttributes redirectAttrs) {
		
		
		return amls.adminReservationDetail(model, memberId, seq,redirectAttrs);
	}
	//예약 딜리트
	@PostMapping("adminCancleReserveData")
	public String adminCancleReserveData(Model model, String seq, RedirectAttributes ra) {
		return amls.adminCancleReserveData(model, seq, ra);
	}
	
	//관리자 예약정보(회원예약 막기 처음페이지)
	@RequestMapping("adminOperation")
	public String adminOreration(Model model) {
		
		return "admin/adminOperation";
	}
	//공지사항 보기
	@RequestMapping("adminAttentionList")
	public String adminAttentionList(Model model, String category2, String select, String search, Integer page,	
			Integer size, RedirectAttributes ra) {
		return aas.getAdminAttentionLists(model, category2, select, search, page ,size, ra);
	}
	//공지사항 글쓰기 페이지
	@RequestMapping("adminAttentionWrite")
	public String adminAttentionWrite(Model model) {
		
		return aas.adminAttentionWrite(model);
	}
	//새 공지사항 등록
	@PostMapping("adminAttentionWriteProc")
	public String adminAttentionWriteProc(Model model, RedirectAttributes ra,Attention attention,MultipartHttpServletRequest req) {
				
		return aas.adminAttentionWriteProc(model,ra,attention,req);
	}
	//공지사항 확인
	@RequestMapping("adminAttentionDetail")
	public String adminAttentionDetail(Model model,String seq) {
		return aas.adminAttentionDetail(model,seq);
	}
	//파일 다운로드 
	@RequestMapping(value = "attentionDownload")
	public void download(@RequestParam(value="fileName") String fileName, HttpServletResponse res) throws Exception {
		if(fileName == "" || "파일 없음".equals(fileName))
			return ;
			
		res.addHeader("Content-disposition", "attachment; filename="+fileName);
		File file = new File(IAdminAttentionService.FILE_LOCATION + "/" + fileName);
		FileInputStream input = new FileInputStream(file);
		FileCopyUtils.copy(input, res.getOutputStream());
		input.close();
		
	}
	//공지사항 삭제 
	@RequestMapping("adminAttentionDelete")
	public String adminAttentionDelete(Model model, RedirectAttributes ra, String seq) {
		return aas.deleteproc(model, ra, seq);
	}
	//공지사항 수정
	@RequestMapping("adminAttentionModify")
	public String adminAttentionModify(Model model, RedirectAttributes ra, String seq) {
		return aas.adminAttentionModify(model, ra, seq);
	}
	
	@PostMapping("adminAttentionModifyProc")
	public String adminAttentionModifyProc(Model model, RedirectAttributes ra,Attention attention,MultipartHttpServletRequest req) {
				
		return aas.adminAttentionModifyProc(model,ra,attention,req);
	}
	//파일 수정 다운로드 
	
	
	
	
	//예약설정 카테고리2
	@ResponseBody
	@RequestMapping(value = "findCategory2", produces ="text/html; charset=UTF-8;")
	public String findCategory2(@RequestBody String category1) {
		
		return aos.findCategory2(category1);
	}
	@ResponseBody
	@RequestMapping(value = "findCategory3", produces ="text/html; charset=UTF-8;")
	public String findCategory3(@RequestBody String category2) {
		
		return aos.findCategory3(category2);
	}
	@ResponseBody
	@RequestMapping(value = "findCategory4", produces ="text/html; charset=UTF-8;")
	public String findCategory4(@RequestBody String category3) {
		
		return aos.findCategory4(category3);
	}
	@ResponseBody
	@RequestMapping(value = "findRoom", produces ="text/html; charset=UTF-8;")
	public String findRoom(@RequestBody String category4) {
		
		return aos.findRoom(category4);
	}
	
	
	
	
	
	// (끝)작성자:공주원 ==============================================

	
}
