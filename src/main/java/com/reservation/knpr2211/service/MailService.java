package com.reservation.knpr2211.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class MailService {
	
	@Autowired JavaMailSender mailsender;
	
	public void MailSend(String to, String subject, String content) {
		MimeMessage message = mailsender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setSubject(subject);
			messageHelper.setText(content);
			messageHelper.setTo(to);
			mailsender.send(message);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			// TODO: handle exception
		} 
			
			
	
		
	}

}
