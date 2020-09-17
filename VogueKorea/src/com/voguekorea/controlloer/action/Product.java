package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voguekorea.dao.ProductDAO;
import com.voguekorea.dto.ProductDTO;

public class Product implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Product.java 실행");
		
		
		String url = "/store/product.jsp";
		
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		System.out.println("pseq:"+pseq);//체크

		ProductDAO pControl = ProductDAO.getInstance();
		ProductDTO product = pControl.selectProduct(pseq);
		request.setAttribute("product", product);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}