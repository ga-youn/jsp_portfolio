package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.MemberDAO;
import com.voguekorea.dao.OrderListDAO;
import com.voguekorea.dao.PaymentDAO;
import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.OrderListDTO;
import com.voguekorea.dto.PaymentDTO;

public class Add_orderList implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Add_orderList");
		
		String path;
		//DB에 담을 객체를 생성
		OrderListDTO orderList = new OrderListDTO ();
		//로그인확인
		HttpSession session = request.getSession();	
		MemberDTO loginUserInfo = (MemberDTO)session.getAttribute("loginUserInfo");
		//payment 테이블--주문상세정보에서 추가하기
		MemberDAO mControl = MemberDAO.getInstance();
		MemberDTO mResult = mControl.selectMember(loginUserInfo.getId());
		
		
		PaymentDAO cControl = PaymentDAO.getInstance();
		ArrayList<PaymentDTO> paymentList = cControl.loginPaymentList(mResult);
		
		//매개변수로 넘겨온 값을 불러온다.
		String order_name = request.getParameter("order_name");
		String order_phone = request.getParameter("order_phone");
		String order_mail = request.getParameter("order_mail");
		String re_name = request.getParameter("re_name");
		String re_address = request.getParameter("re_address");
		String re_phone = request.getParameter("re_phone");
		String re_comment = request.getParameter("re_comment");
		//주문list db에 insert
		OrderListDAO oControl = OrderListDAO.getInstance();

		//객체에 담아 주기
		orderList.setOrder_name(order_name);
		orderList.setOrder_phone(order_phone);
		orderList.setOrder_mail(order_mail);
		orderList.setRe_name(re_name);
		orderList.setRe_address(re_address);
		orderList.setRe_phone(re_phone);
		orderList.setRe_comment(re_comment);
		orderList.setPay_seq(paymentList.get(0).getPay_seq());
		orderList.setId(loginUserInfo.getId());
		

		oControl.insertOrderList(orderList);
		
		path = "vogueKorea.vk?type=index";
		request.getRequestDispatcher(path).forward(request, response);
		
		
		
		
	}

}
