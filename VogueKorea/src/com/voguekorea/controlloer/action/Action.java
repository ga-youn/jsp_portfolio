package com.voguekorea.controlloer.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	//실행만들기
	public void execute(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException;
	
}
