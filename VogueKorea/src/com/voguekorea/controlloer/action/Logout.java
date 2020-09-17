package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Logout.java 실행");
		
		String path = "vogueKorea.vk?type=index"; //메인으로이동
		
		HttpSession session = request.getSession(false); //세션이 생성되었나요?
		
			
		if(session != null)//세션 크로스 체크
			session.invalidate();//세션 끊어주기

		request.getRequestDispatcher(path).forward(request, response);
		
	}

}