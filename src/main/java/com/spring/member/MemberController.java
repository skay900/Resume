package com.spring.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() throws Exception {
		
		return "/resume_login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String password,
			Member user,
			Model model,
			HttpSession session
			) throws Exception {
		
		// 유저정보 dto에 담기
		user = service.readMember(userId);
		
		// 입력된 아이디, 비밀번호 DB 정보와 틀릴 경우 아래 메세지 출력
		if(user==null || (! user.getPassword().equals(password))) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "/resume_login";
		}

		// 로그인 정보를 세션에 저장
		SessionInfo info = new SessionInfo();
		info.setUserId(user.getUserId());
		info.setUserName(user.getUserName());
		info.setEmail(user.getEmail());
		info.setAuthority(user.getAuthority());
		session.setAttribute("member", info);
		
		return "redirect:/";
	}	

	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		// 로그인 정보를 세션에서 삭제
		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/";
	}

}
