package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voguekorea.dao.NoticeDAO;
import com.voguekorea.dto.NoticeDTO;

public class Notice_detail  implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Notice_detail.java 실행");
		
		
		String url = "/serviceCenter/notice_detail.jsp";
		
		int nseq = Integer.parseInt(request.getParameter("nseq"));
		System.out.println("nseq:"+nseq);//체크

		NoticeDAO nControl = NoticeDAO.getInstance();
		NoticeDTO notice = nControl.selectNotice(nseq);
		request.setAttribute("notice", notice);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}