package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dto.MemberDTO;

public class Mypage_change_info implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Mypage_change_info.java 실행");
		//DB에 담을 객체를 생성
		MemberDTO member = new MemberDTO ();
		
		//매개변수로 넘겨온 값을 불러온다.
		String id=request.getParameter("memId");
		String pwd=request.getParameter("memPw");
		String name=request.getParameter("memNm");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("cellPhone");
		
		//값확인
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(name);
		System.out.println(email);
		System.out.println(address);
		System.out.println(phone);
		
		//객체에 담아 주기
		member.setId(id);
		member.setPwd(pwd);
		member.setName(name);
		member.setEmail(email);
		member.setAddress(address);
		member.setPhone(phone);
		
		//1.오라클에서 입력받은 id의 정보를 수정하는 쿼리 작성
		/*	UPDATE member
			SET pwd=2,name=3,email=4,address=5,phone=6
			WHERE id=1;
		*/
		//2.updateMember 메서드 생성 ->memberDAO.java
		MemberDAO mControl = MemberDAO.getInstance();
		mControl.updateMember(member);
	
		//3.updateMember 메서드에서 입력받은 고객정보를 출력
		//4.DB에 쿼리를 적용
		
		//5.정상적으로 DB에 UPDATE가 되면 index.jsp로 이동
		
		String path = "vogueKorea.vk?type=index";
		request.getRequestDispatcher(path).forward(request, response);
	
			
		
		
	}

		
	

}
