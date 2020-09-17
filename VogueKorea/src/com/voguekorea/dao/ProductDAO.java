package com.voguekorea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.voguekorea.dto.NoticeDTO;
import com.voguekorea.dto.ProductDTO;

import util.DBManager;

public class ProductDAO {

	//생성자
	public  ProductDAO() {}
	
	//싱글톤 방식 
	private static  ProductDAO instance = new  ProductDAO();
	
	public static  ProductDAO getInstance() {
		return instance;
	}
			
	//전체 제품을 나열하기
	public ArrayList<ProductDTO> selectAllProductLists() {
		
		System.out.println("selectAllProductLists()");
		
		ArrayList<ProductDTO> productLists = new ArrayList<ProductDTO>();//하나의 행을 가지고 있음
		
		String sql = "SELECT * FROM product";
		
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
				
				ProductDTO productList = new ProductDTO();
				
				//출력문 확인
				int pseq = rset.getInt("pseq");
				String name = rset.getString("name");
				String content = rset.getString("content");
				int price = rset.getInt("price");
				String image = rset.getString("image");
				

				
				System.out.println(pseq);
				System.out.println(name);
				System.out.println(content);
				System.out.println(price);
				System.out.println(image);
		
				
				productList.setPseq(pseq);
				productList.setName(name);
				productList.setContent(content);
				productList.setPrice(price);
				productList.setImage(image);
			
				
				//ArrayList에 추가
				productLists.add(productList);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
		return productLists;
	}
	
	//상품 상세보기
	public ProductDTO selectProduct(int clickPseq) {
		System.out.println("selectProduct()");//경로확인
		
		ProductDTO product = null;
		
		String sql = "SELECT * FROM product WHERE pseq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, clickPseq);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				product = new ProductDTO();
				
				int pseq = rset.getInt("pseq");					//상품번호
				String name = rset.getString("name");			//상품이름
				String content = rset.getString("content");		//상품설명
				String detail = rset.getString("detail");		//상품상세설명
				Timestamp indate = rset.getTimestamp("indate");	//글등록일
				int price = rset.getInt("price");				//가격
				String image = rset.getString("image");			//상품이미지
				
				
				System.out.println(pseq);
				System.out.println(name);
				System.out.println(content);
				System.out.println(detail);
				System.out.println(indate);
				System.out.println(price);
				System.out.println(image);
				
				product.setPseq(pseq);
				product.setName(name);
				product.setContent(content);
				product.setDetail(detail);
				product.setIndate(indate);
				product.setPrice(price);
				product.setImage(image);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		return product; 
	}
}
