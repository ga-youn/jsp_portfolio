package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voguekorea.dao.NoticeDAO;
import com.voguekorea.dto.NoticeDTO;

public class Notice implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Notice.java 실행");

		String url = "/serviceCenter/notice.jsp";
		
		
		NoticeDAO nControl = NoticeDAO.getInstance();
		ArrayList<NoticeDTO> noticeList = nControl.allNoticeLists();
		
		//객체에 담기
		request.setAttribute("noticeList", noticeList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}