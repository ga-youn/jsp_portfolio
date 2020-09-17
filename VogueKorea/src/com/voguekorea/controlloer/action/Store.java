package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voguekorea.dao.ProductDAO;
import com.voguekorea.dto.ProductDTO;

public class Store implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Store.java 실행");
		
		
		String url = "/store/store.jsp";
		
		
		ProductDAO pControl = ProductDAO.getInstance();
		ArrayList<ProductDTO> productList;
		
		productList = pControl.selectAllProductLists();
		
		//객체에 담기
		request.setAttribute("productList", productList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}
}