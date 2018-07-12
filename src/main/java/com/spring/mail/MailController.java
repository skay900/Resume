package com.spring.mail;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.member.SessionInfo;

@Controller
public class MailController {
	
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value = "/resume_mail")
	public String mailSendForm(
			@RequestParam(value="receiver") String receiver,
			Model model
			) {
		
		model.addAttribute("receiver", receiver);
		
		return "/mailSend";
	}
	
	@RequestMapping(value = "/resume_mail/do")
	public String mailSendSubmit(
			Mail dto,
			HttpSession session
			) {
		
		// 세션 정보
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setSubject(info.getUserName() + "에서 보낸 면접 요청 메일입니다.");
		
		mailSender.mailSend(dto);

		return "redirect:/resume_list";
	}

}
