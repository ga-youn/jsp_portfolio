package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.voguekorea.dao.CartDAO;


public class Delete_cart implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Delete_cart.java open");
		
		String path="vogueKorea.vk?type=shopping_cart";
      
		String[] checks = request.getParameterValues("cartSno");
		 

		//int cseq = Integer.parseInt(request.getParameter("cseq"));
		//System.out.println("cseq:"+cseq);
     
		for(int i=0; i<checks.length; i++) {
			CartDAO aControl = CartDAO.getInstance();
			aControl.deleteCart(checks[i]);
		}

		
		
   
		request.getRequestDispatcher(path).forward(request,response);

	}

}
