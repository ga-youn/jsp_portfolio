package com.voguekorea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.voguekorea.dto.CartDTO;
import com.voguekorea.dto.MemberDTO;

import util.DBManager;

public class CartDAO {
	
	//생성자
	public CartDAO() {}
	
	//싱글톤 방식 
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
		return instance;
	}
	
	
	//insertCart메서드 - 장바구니 db에 추가
	public int insertCart(CartDTO cartList) {
		System.out.println("insertCart() 실행");//경로확인
		
		int result = 0;
		String sql = "INSERT INTO addCart(cseq,pseq,name,content,count,image,price,id)  VALUES(addCart_seq.NEXTVAL,?,?,?,?,?,?,?)";
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
			pstmt.setInt(1, cartList.getPseq());
			pstmt.setString(2, cartList.getName());
			pstmt.setString(3, cartList.getContent());
			pstmt.setInt(4, cartList.getCount());
			pstmt.setString(5, cartList.getImage());
			pstmt.setInt(6, cartList.getPrice());
			pstmt.setString(7, cartList.getId());
			
			
			
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
	public ArrayList<CartDTO> loginCartList(MemberDTO userId) {
		
		System.out.println("loginCartList():"+userId.getId());
		
		ArrayList<CartDTO> cartLists = new ArrayList<CartDTO>();//하나의 행을 가지고 있음
		
		String sql = "SELECT * FROM addCart WHERE id=? ORDER BY cseq";//인자값은 물음표
		
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
				
				CartDTO cartList = new CartDTO();
				//출력문 확인
				int cseq = rset.getInt("cseq");
				int pseq = rset.getInt("pseq");
				String name = rset.getString("name");
				String content = rset.getString("content");
				int price = rset.getInt("price");
				int count = rset.getInt("count");
				String image = rset.getString("image");
				String id = rset.getString("id");
		
				
				System.out.println(cseq);
				System.out.println(pseq);
				System.out.println(name);
				System.out.println(price);
				System.out.println(content);
				System.out.println(count);
				System.out.println(image);
				System.out.println(id);
			
				cartList.setCseq(cseq);
				cartList.setPseq(pseq);
				cartList.setName(name);
				cartList.setPrice(price);
				cartList.setContent(content);
				cartList.setCount(count);
				cartList.setImage(image);
				cartList.setId(id);
				
				//ArrayList에 추가
				cartLists.add(cartList);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
		return cartLists;
	}
	//cartToPayment 메서드 - 장바구니에서 결제페이지로 이동하기 위한 메서드
	public CartDTO cartToPayment(String incseq) {
		
		System.out.println("cartToPayment()");
		
		int usercseq = Integer.parseInt(incseq);
		CartDTO cartList = null;
		String sql = "SELECT * FROM addCart WHERE cseq=?";//인자값은 물음표
		
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		ResultSet rset = null;//결과
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,usercseq);
			rset = pstmt.executeQuery();//실행
			
			while(rset.next()) {//값 읽어오기
				
				cartList = new CartDTO();
				//출력문 확인
				int cseq = rset.getInt("cseq");
				int pseq = rset.getInt("pseq");
				String name = rset.getString("name");
				String content = rset.getString("content");
				int price = rset.getInt("price");
				int count = rset.getInt("count");
				String image = rset.getString("image");
				String id = rset.getString("id");
		
				
				System.out.println(cseq);
				System.out.println(pseq);
				System.out.println(name);
				System.out.println(price);
				System.out.println(content);
				System.out.println(count);
				System.out.println(image);
				System.out.println(id);
			
				cartList.setCseq(cseq);
				cartList.setPseq(pseq);
				cartList.setName(name);
				cartList.setPrice(price);
				cartList.setContent(content);
				cartList.setCount(count);
				cartList.setImage(image);
				cartList.setId(id);
				
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
		return cartList;
	}
		
	
	
	
	//cartList 메서드 - 비로그인상태 카트만 출력
	public ArrayList<CartDTO> cartList() {
		
		System.out.println("loginCartList():");
		
		ArrayList<CartDTO> cartLists = new ArrayList<CartDTO>();//하나의 행을 가지고 있음
		
		String sql = "SELECT * FROM addCart ORDER BY cseq DESC";//인자값은 물음표
		
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		ResultSet rset = null;//결과
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();//실행
			
			while(rset.next()) {//값 읽어오기
				
				CartDTO cartList = new CartDTO();
				//출력문 확인
				int cseq = rset.getInt("cseq");
				String name = rset.getString("name");
				String content = rset.getString("content");
				int count = rset.getInt("count");
				String image = rset.getString("image");
				String id = rset.getString("id");
		
				
				System.out.println(cseq);
				System.out.println(name);
				System.out.println(content);
				System.out.println(count);
				System.out.println(image);
				System.out.println(id);
			
				cartList.setCseq(cseq);
				cartList.setName(name);
				cartList.setContent(content);
				cartList.setCount(count);
				cartList.setImage(image);
				cartList.setId(id);
				
				//ArrayList에 추가
				cartLists.add(cartList);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
		return cartLists;
		
		
	}//장바구니 수정하기
	public void updateCart(int count,int userCseq) {
		System.out.println("updateCart()");

		String sql="UPDATE addCart SET count=? WHERE cseq=?";
		
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, userCseq);
			
	
			//쿼리문 실행
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	//장바구니 삭제하기
	public void deleteCart(String userCseq) {
		System.out.println("deleteCart()");
		
		int cseq = Integer.parseInt(userCseq);
		String sql="DELETE FROM addCart WHERE Cseq=?";
		
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);

			//쿼리문 실행
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
	}
}
