package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.CartDAO;
import com.voguekorea.dao.PaymentDAO;
import com.voguekorea.dto.CartDTO;
import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.PaymentDTO;

public class CartToPayment implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("CartToPayment.java open");
		String path;
		String[] checks = request.getParameterValues("cartSno");
		
		//DB에 담을 객체를 생성
		PaymentDTO paymentList = new PaymentDTO ();
		//로그인확인
		HttpSession session = request.getSession();	
		MemberDTO loginUserInfo = (MemberDTO)session.getAttribute("loginUserInfo");
		
		
		if(loginUserInfo == null){//로그인이 안된 경우
			System.out.println("로그인 안됨");
			//String message = "로그인이 필요한 서비스입니다. 로그인화면으로 이동합니다";
			//request.setAttribute("message", message);
			
			path = "vogueKorea.vk?type=loginForm";
		
			response.setCharacterEncoding("utf-8");
		    response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
		    out.println("alert('로그인이 필요한 서비스입니다. 로그인화면으로 이동합니다.')");
		    out.println("location.href='" + path + "';");
		    out.println("</script>");

			out.flush();
			out.close();
		}else {
			
			//장바구니 db에서 찾기
			PaymentDAO pControl = PaymentDAO.getInstance();
			pControl.deletePaymentList(loginUserInfo.getId());
			request.removeAttribute("paymentList");
			CartDTO cResult;
			for(int i=0; i<checks.length; i++) {
				CartDAO cControl = CartDAO.getInstance();
				
				cResult = cControl.cartToPayment(checks[i]);
				//객체에 담아 주기
				//cartList.setCseq(cseq);
				paymentList.setPseq(cResult.getPseq());
				paymentList.setName(cResult.getName());
				paymentList.setContent(cResult.getContent());
				paymentList.setCount(cResult.getCount());
				paymentList.setImage(cResult.getImage());
				paymentList.setPrice(cResult.getPrice());
				paymentList.setId(loginUserInfo.getId());
				pControl.insertPaymentList(paymentList);
			}

			path = "vogueKorea.vk?type=payment";
			request.getRequestDispatcher(path).forward(request, response);
			
		}
		
		
	}

}

	