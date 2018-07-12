package com.spring.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.resume.dao.CommonDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private CommonDAO dao;

	/****************************************************************************/
	/**로그인 시 회원정보 불러오기**/
	/****************************************************************************/
		@Override
		public Member readMember(String userId) {
			Member user = null;
			
			try {
				user = dao.selectOne("member.readMember", userId);
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return user;
		}
	/****************************************************************************/

}
