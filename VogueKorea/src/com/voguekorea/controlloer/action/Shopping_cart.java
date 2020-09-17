package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.CartDAO;
import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dto.CartDTO;
import com.voguekorea.dto.MemberDTO;

public class Shopping_cart implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Shoppong_cart.java 실행");
		
		
		
		HttpSession session = request.getSession();	
		MemberDTO loginUserInfo = (MemberDTO)session.getAttribute("loginUserInfo");
			
		ArrayList<CartDTO> cartList;
		if(loginUserInfo == null){//로그인이 안된 경우
			CartDAO cControl = CartDAO.getInstance(); //로그인이 안된경우 기능 구현 x
			cartList = cControl.cartList();				//일단 만들어둔 것
		}else {//로그인이 된 경우
			System.out.println("로그인 됨");
			
			//로그인한 고객의 정보를 출력한다.
			//String id=request.getParameter("id");//null값 뜸
			System.out.println(loginUserInfo.getId());//로그인한 id 출력
			
			MemberDAO mControl = MemberDAO.getInstance();
			MemberDTO mResult = mControl.selectMember(loginUserInfo.getId());
			
			
			CartDAO cControl = CartDAO.getInstance();
			cartList = cControl.loginCartList(mResult);
			
			
			
			//System.out.println(mResult);
			//System.out.println("로그인 된 정보");
			//System.out.println(mResult.getId());

	
			//객체에 담기
			request.setAttribute("cartList", cartList);
			//session.setAttribute("cartList", cartList);
			
		
		}

		String url = "/store/shopping_cart.jsp";
		request.getRequestDispatcher(url).forward(request,response);
		
	}

}
