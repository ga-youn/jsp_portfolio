package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dto.MemberDTO;

public class Login implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Login.java 실행");
		
		String path = "/join/login.jsp";//로그인 실패시 기본
		HttpSession session = request.getSession(); //세션 import
		

		//id와 pwd를 출력
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		System.out.println("입력받은 id="+id);
		System.out.println("입력받은 pwd="+pwd);
		
		
		
		MemberDAO mControl = MemberDAO.getInstance();
		MemberDTO mResult = mControl.selectMember(id);
		
		
		
		if(mResult != null) {//로그인 성공 시
			if(mResult.getPwd().equals(pwd)) {
				
				path = "vogueKorea.vk?type=index";//메인 페이지 이동
				session.removeAttribute("id"); //기존에 계정이 있으면 지우고, 새로운 계정으로 설정
				session.setAttribute("loginUserInfo", mResult);
				request.getRequestDispatcher(path).forward(request, response);
	
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디나 패스워드가 일치하지 않습니다.'); history.back();</script>");
				out.flush();
				out.close();
			}
			
			
			
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디나 패스워드가 일치하지 않습니다.'); history.back();</script>");
			out.flush();
			
			
		}
		

		
		
	}

}
