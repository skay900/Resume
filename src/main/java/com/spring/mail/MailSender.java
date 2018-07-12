package com.spring.mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void mailSend(Mail dto) {
		try { 
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(dto.getSubject());
			messageHelper.setText(dto.getContent());
			messageHelper.setTo(dto.getReceiver());
			
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
