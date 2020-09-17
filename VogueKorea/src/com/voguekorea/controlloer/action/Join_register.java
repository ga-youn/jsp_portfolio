package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dto.MemberDTO;



public class Join_register implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Join_register.java 실행");
		
		//DB에 담을 객체를 생성
		MemberDTO member = new MemberDTO ();
		
		/*
		member.setId(request.getParameter("id")); 
		member.setPwd(request.getParameter("pwd")); 
		member.setName(request.getParameter("name")); 
		member.setEmail(request.getParameter("email")); 
		member.setAddress(request.getParameter("address")); 
		*/
		
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
		
		MemberDAO mControl = MemberDAO.getInstance();
		mControl.insertMember(member);
		
		//메인으로 페이지 이동
		String path = "/index.jsp";
		
		RequestDispatcher dispathcher = request.getRequestDispatcher(path);
		dispathcher.forward(request,response);
		
		
	}

}
