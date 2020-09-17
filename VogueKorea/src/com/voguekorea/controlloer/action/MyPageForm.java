package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dto.MemberDTO;

public class MyPageForm implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("MyPageForm.java 실행");
		String path = "/myPage/changeInfo.jsp";
		
		HttpSession session = request.getSession();
		
		MemberDTO loginUserInfo = (MemberDTO)session.getAttribute("loginUserInfo");
		
		if(loginUserInfo == null){//로그인이 안된 경우
			System.out.println("로그인 안됨");
			path = "vogueKorea.vk?type=loginForm";
		}else {//로그인이 된 경우
			System.out.println("로그인 됨");
			
			//로그인한 고객의 정보를 출력한다.
			//String id=request.getParameter("id");//null값 뜸
			System.out.println(loginUserInfo.getId());
			
			MemberDAO mControl = MemberDAO.getInstance();
			MemberDTO mResult = mControl.selectMember(loginUserInfo.getId());
			//System.out.println(mResult);
			
			System.out.println("로그인 된 정보");
			System.out.println(mResult.getId());
			System.out.println(mResult.getPwd());
			System.out.println(mResult.getName());
			System.out.println(mResult.getEmail());
			System.out.println(mResult.getAddress());
			System.out.println(mResult.getPhone());
			
			
			request.setAttribute("myInfo", mResult);
		}
		
		request.getRequestDispatcher(path).forward(request,response);
		
	}

}
