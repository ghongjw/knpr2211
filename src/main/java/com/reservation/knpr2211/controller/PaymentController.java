package com.reservation.knpr2211.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.service.ReservationService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

		private IamportClient api;
		@Autowired ReservationService rs;
		
		public PaymentController() {
	    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
			this.api = new IamportClient("1241764112134883","oNv6BoLRqGYLAAIh0Ox8QoCzH97NwK12ChIdDcJbYRRVdDn2m2Hv7oAbB6UJ7MD2k717S0AROEmLVoyW");
		}
			
		@ResponseBody
		@RequestMapping(value="/verifyIamport/{imp_uid}", produces = "application/json; charset=UTF-8")
		public IamportResponse<Payment> paymentByImpUid(
				Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
		{		
			System.out.println(imp_uid);
			return api.paymentByImpUid(imp_uid);
		}
		
		@PostMapping("successPayment")
		public String successPayment(Model model,String imp_uid, String merchant_uid, String seq, RedirectAttributes ra) {
			System.out.println(imp_uid);
			System.out.println(merchant_uid);
			System.out.println(seq);
			
			return 	rs.savePayment(model, imp_uid, merchant_uid, seq,ra);
		}
		@PostMapping("cancleReserveData")
		public String cancleReserveData(Model model,String imp_uid, String merchant_uid, String seq, RedirectAttributes ra) {
			System.out.println(imp_uid);
			System.out.println(merchant_uid);
			System.out.println(seq);
			
			return 	rs.cancleReserveData(model,seq,ra);
		}
		
		
	
	}
	

