package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voguekorea.dao.ArticleDAO;
import com.voguekorea.dto.ArticleDTO;

public class Beauty implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Beauty.java 실행");
		
		
		ArticleDAO aControl = ArticleDAO.getInstance();
		ArrayList<ArticleDTO> articleList;
		
	
		articleList = aControl.fashionArticleLists();

		
		//객체에 담기
		request.setAttribute("articleList", articleList);
		
		String url = "/article/fashion.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
