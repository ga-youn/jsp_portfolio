package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dao.PaymentDAO;
import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.PaymentDTO;


public class Payment implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Payment.java 실행");
		
		
		String url = "/store/payment.jsp";
		HttpSession session = request.getSession();	
		MemberDTO loginUserInfo = (MemberDTO)session.getAttribute("loginUserInfo");
			
		ArrayList<PaymentDTO> paymentList;

		System.out.println("로그인 됨");
		
	
		System.out.println(loginUserInfo.getId());//로그인한 id 출력
		
		MemberDAO mControl = MemberDAO.getInstance();
		MemberDTO mResult = mControl.selectMember(loginUserInfo.getId());
		
		
		PaymentDAO cControl = PaymentDAO.getInstance();
		paymentList = cControl.loginPaymentList(mResult);
		
		
		
		//System.out.println(mResult);
		System.out.println("로그인 된 정보");
		System.out.println(mResult.getId());


		//객체에 담기
		request.setAttribute("paymentList", paymentList);

		request.getRequestDispatcher(url).forward(request,response);
		
	}

}
