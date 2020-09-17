package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.CartDAO;
import com.voguekorea.dao.PaymentDAO;
import com.voguekorea.dto.CartDTO;
import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.PaymentDTO;

public class Change_cart implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Change_cart.java open");
		
		String path="vogueKorea.vk?type=shopping_cart";
      
		int count = Integer.parseInt(request.getParameter("count"));
		int cseq = Integer.parseInt(request.getParameter("cseq"));

		
		CartDAO aControl = CartDAO.getInstance();
		aControl.updateCart(count, cseq);
		

		request.getRequestDispatcher(path).forward(request,response);

	}

}
