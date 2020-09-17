package com.voguekorea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.OrderListDTO;

import util.DBManager;

public class OrderListDAO {

	//생성자
	public OrderListDAO() {}
	
	//싱글톤 방식 
	private static OrderListDAO instance = new OrderListDAO();
	
	public static OrderListDAO getInstance() {
		return instance;
	}
	//insertOrderList메서드 - db에 추가
	public int insertOrderList(OrderListDTO orderList) {
		System.out.println("insertOrderList() 실행");//경로확인
		
		int result = 0;
		String sql = "INSERT INTO orderList(order_seq,order_name,order_phone,order_mail,re_name,re_address,re_phone,re_comment,pay_seq,indate,id)"
				+ "VALUES(orderList_seq.NEXTVAL,?,?,?,?,?,?,?,?,sysdate,?)";
		/*
		INSERT INTO member(id,pwd,name,email,address,phone)
		values(?,?,?,?,?,?) 프리페어 스테이트먼트..?
		*/
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,orderList.getOrder_name());
			pstmt.setString(2,orderList.getOrder_phone());
			pstmt.setString(3,orderList.getOrder_mail());
			pstmt.setString(4,orderList.getRe_name());
			pstmt.setString(5,orderList.getRe_address());
			pstmt.setString(6,orderList.getRe_phone());
			pstmt.setString(7,orderList.getRe_comment());
			pstmt.setInt(8,orderList.getPay_seq());
			pstmt.setString(9,orderList.getId());
			
	
			//쿼리문 실행
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}
	//orderList 메서드
	public ArrayList<OrderListDTO> orderList(String userId) {
		
		System.out.println("orderList():"+userId);
		
		ArrayList<OrderListDTO> orderLists = new ArrayList<OrderListDTO>();//하나의 행을 가지고 있음
		
		String sql = "SELECT * FROM orderList NATURAL JOIN addPayment WHERE id=?";//날짜별로 생각하기
		
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		ResultSet rset = null;//결과
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();//실행
			
			while(rset.next()) {//값 읽어오기
				
				OrderListDTO orderList = new OrderListDTO();
				//출력문 확인
				int order_seq = rset.getInt("order_seq");
				String order_name = rset.getString("order_name");
				String order_phone = rset.getString("order_phone");
				String order_mail = rset.getString("order_mail");
				String re_name = rset.getString("re_name");
				String re_address = rset.getString("re_address");
				String re_phone = rset.getString("re_phone");
				String re_comment = rset.getString("re_comment");
				Timestamp indate = rset.getTimestamp("indate");
				int pay_seq = rset.getInt("pay_seq");
				int pseq = rset.getInt("pseq");
				String name = rset.getString("name");
				String content = rset.getString("content");
				int price = rset.getInt("price");
				int count = rset.getInt("count");
				String image = rset.getString("image");
				String id = rset.getString("id");
				orderList.setOrder_seq(order_seq);
				orderList.setOrder_phone(order_phone);
				orderList.setOrder_name(order_name);
				orderList.setOrder_mail(order_mail);
				orderList.setRe_address(re_address);
				orderList.setRe_comment(re_comment);
				orderList.setRe_name(re_name);
				orderList.setRe_phone(re_phone);
				orderList.setIndate(indate);
				orderList.setPay_seq(pay_seq);
				orderList.setPseq(pseq);
				orderList.setName(name);
				orderList.setPrice(price);
				orderList.setContent(content);
				orderList.setCount(count);
				orderList.setImage(image);
				orderList.setId(id);
				
				//ArrayList에 추가
				orderLists.add(orderList);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
		return orderLists;
	}	
		
}
