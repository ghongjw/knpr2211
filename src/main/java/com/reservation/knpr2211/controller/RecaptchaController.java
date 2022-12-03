package com.reservation.knpr2211.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.service.VerifyRecaptchaService;

@Controller
@RequestMapping("/pro")
public class RecaptchaController{
	@ResponseBody
	@RequestMapping(value = "/VerifyRecaptcha", method = RequestMethod.POST)

	public int VerifyRecaptcha(HttpServletRequest request) { //현하 사이트키 : 6Ldy51AjAAAAAIjd0_u7DO7bwxNMxBj_IfCcNLr2
		 VerifyRecaptchaService.setSecretKey("6Ldy51AjAAAAAKOzy0nbJ7aIiblItVCCZHls4ff4");//현하 비밀키

		    String gRecaptchaResponse = request.getParameter("recaptcha");
		    try {
		       if(VerifyRecaptchaService.verify(gRecaptchaResponse))
		          return 0; // 성공
		       else return 1; // 실패
		    } catch (Exception e) {
		        e.printStackTrace();
		        return -1; //에러
		    }
	}
}