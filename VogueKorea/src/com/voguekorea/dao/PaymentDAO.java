package com.voguekorea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.voguekorea.dto.CartDTO;
import com.voguekorea.dto.MemberDTO;
import com.voguekorea.dto.PaymentDTO;

import util.DBManager;

public class PaymentDAO {

	
	//생성자
		public PaymentDAO() {}
		
		//싱글톤 방식 
		private static PaymentDAO instance = new PaymentDAO();
		
		public static PaymentDAO getInstance() {
			return instance;
		}
		
		
		//insertCart메서드 - 장바구니 db에 추가
		public int insertPaymentList(PaymentDTO paymentList) {
			System.out.println("insertPayment 실행");//경로확인
			
			int result = 0;
			String sql = "INSERT INTO addPayment(pay_seq,pseq,name,content,count,image,price,id)  VALUES(addPayment_seq.NEXTVAL,?,?,?,?,?,?,?)";
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
				pstmt.setInt(1, paymentList.getPseq());
				pstmt.setString(2, paymentList.getName());
				pstmt.setString(3, paymentList.getContent());
				pstmt.setInt(4, paymentList.getCount());
				pstmt.setString(5, paymentList.getImage());
				pstmt.setInt(6, paymentList.getPrice());
				pstmt.setString(7, paymentList.getId());
				
				
				
				//쿼리문 실행
				result = pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
			
			return result;
		}

		//loginCartList 메서드 - 로그인된 id로 저장된 카트만 출력
		public ArrayList<PaymentDTO> loginPaymentList(MemberDTO userId) {
			
			System.out.println("loginPaymentList():"+userId.getId());
			
			ArrayList<PaymentDTO> paymentLists = new ArrayList<PaymentDTO>();//하나의 행을 가지고 있음
			
			String sql = "SELECT * FROM addPayment WHERE id=? ORDER BY pay_seq DESC";//인자값은 물음표
			
			Connection conn = null;//연결자
			PreparedStatement pstmt = null;//연결자
			ResultSet rset = null;//결과
			
			try {
				//DB에 연결합니다.
				conn = DBManager.getConnection();
				//쿼리문 준비
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId.getId());
				rset = pstmt.executeQuery();//실행
				
				while(rset.next()) {//값 읽어오기
					
					PaymentDTO paymentList = new PaymentDTO();
					//출력문 확인
					int pay_seq = rset.getInt("pay_seq");
					int pseq = rset.getInt("pseq");
					String name = rset.getString("name");
					String content = rset.getString("content");
					int price = rset.getInt("price");
					int count = rset.getInt("count");
					String image = rset.getString("image");
					String id = rset.getString("id");
			
					
					System.out.println(pay_seq);
					System.out.println(pseq);
					System.out.println(name);
					System.out.println(price);
					System.out.println(content);
					System.out.println(count);
					System.out.println(image);
					System.out.println(id);
				
					paymentList.setPay_seq(pay_seq);
					paymentList.setPseq(pseq);
					paymentList.setName(name);
					paymentList.setPrice(price);
					paymentList.setContent(content);
					paymentList.setCount(count);
					paymentList.setImage(image);
					paymentList.setId(id);
					
					//ArrayList에 추가
					paymentLists.add(paymentList);
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rset);
			}
			
			
			return paymentLists;
		}
		
		//주문 자동 삭제하기
		public void deletePaymentList(String userId) {
			System.out.println("deletePaymentList()");
			
			
			String sql="DELETE FROM addPayment WHERE id=?";
			
			Connection conn = null;//연결자
			PreparedStatement pstmt = null;//연결자
			
			try {
				//DB에 연결합니다.
				conn = DBManager.getConnection();
				//쿼리문 준비
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,userId);

				//쿼리문 실행
				pstmt.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}
		}
}
