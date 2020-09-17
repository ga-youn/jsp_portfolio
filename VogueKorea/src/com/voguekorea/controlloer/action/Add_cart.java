package com.voguekorea.controlloer.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.voguekorea.dao.CartDAO;
import com.voguekorea.dao.ProductDAO;
import com.voguekorea.dto.CartDTO;
import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.ProductDTO;

public class Add_cart implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Add_cart.java open");
		
		String path;
		//DB에 담을 객체를 생성
		CartDTO cartList = new CartDTO ();
		//로그인확인
		HttpSession session = request.getSession();	
		MemberDTO loginUserInfo = (MemberDTO)session.getAttribute("loginUserInfo");
		//매개변수로 넘겨온 값을 불러온다.
		int pseq = Integer.parseInt(request.getParameter("pseq"));//상품
		int optionSnoInput= Integer.parseInt(request.getParameter("optionSnoInput"));//수량
		
		//해당되는 product 테이블에서 물건 정보 가져오기
		ProductDAO pControl = ProductDAO.getInstance();
		ProductDTO product = pControl.selectProduct(pseq);
		
		
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
		
			//객체에 담아 주기
			//cartList.setCseq(cseq);
			cartList.setPseq(pseq);
			cartList.setName(product.getName());
			cartList.setContent(product.getContent());
			cartList.setCount(optionSnoInput);
			cartList.setImage(product.getImage());
			cartList.setPrice(product.getPrice());
			cartList.setId(loginUserInfo.getId());
			
			
			//장바구니 db에 insert
			CartDAO cControl = CartDAO.getInstance();
			cControl.insertCart(cartList);
			
			path = "vogueKorea.vk?type=shopping_cart";
			request.getRequestDispatcher(path).forward(request, response);
			
		}
		
		
	}

}
