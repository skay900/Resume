package com.spring.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	private final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 클라이언트 요청을 처리한 뒤, 뷰를 통해 클라이언트에 응답을 전송하고 실행
		// 컨트롤러 처리 도중 예외가 발생해도 실행
		boolean result = false;
		try {
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String cp = request.getContextPath();
			
			// 로그인 되지 않은 상태에서 이동하면, 로그인 페이지로 이동되고 로그인 했을 경우 경로 그대로 이동
			if(info == null) {
				response.sendRedirect(cp + "/login");
			} else {
				result = true;
			}
			
		} catch (Exception e) {
			logger.info("pre : " + e.toString());
		}
		return result;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 클라이언트 요청을 처리한 후 호출,
		// 컨트롤러 실행 중 예외가 발생하면 실행하지 않음
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 클라이언트 요청이 컨트롤러에 도착하기 전에 호출
		// false를 리턴하면 컨트롤러 또는 HandlerInterceptor를 처리하지 않고 요청 종료
	}
	
}
