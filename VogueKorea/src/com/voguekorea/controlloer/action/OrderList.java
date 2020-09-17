package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dao.OrderListDAO;
import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.OrderListDTO;

public class OrderList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("OrderList.java 실행");
		
		
		String url = "/myPage/orderList.jsp";
		HttpSession session = request.getSession();	
		MemberDTO loginUserInfo = (MemberDTO)session.getAttribute("loginUserInfo");
			
		ArrayList<OrderListDTO> orderList;
		
		OrderListDAO oControl = OrderListDAO.getInstance();
		orderList = oControl.orderList(loginUserInfo.getId());

		//객체에 담기
		request.setAttribute("orderList", orderList);

		request.getRequestDispatcher(url).forward(request,response);
		
	}

}
