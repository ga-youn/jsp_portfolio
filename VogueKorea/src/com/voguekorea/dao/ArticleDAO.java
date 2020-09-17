package com.voguekorea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.voguekorea.dto.ArticleDTO;

import util.DBManager;

public class ArticleDAO {
	
	//생성자
	public ArticleDAO() {}
	
	
	//싱글톤 방식
	private static ArticleDAO instance = new ArticleDAO();
	
	public static ArticleDAO getInstance() {
		return instance;
	}
	/*
	//전체 기사 나열하기
	public ArrayList<ArticleDTO> selectAllArticleLists() {
		
		System.out.println(" selectAllArticleLists()");
		
		ArrayList<ArticleDTO> articleLists = new ArrayList<ArticleDTO>();//하나의 행을 가지고 있음
		
		String sql = "SELECT * FROM article";
		
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
				
				ArticleDTO  articleList = new ArticleDTO();
				
				//출력문 확인
				int aseq = rset.getInt("aseq");
				String article_title = rset.getString("article_title");
				int article_category = rset.getInt("article_category");
				String article_image = rset.getString("article_image");
				
				
				System.out.println(aseq);
				System.out.println(article_title);
				System.out.println(article_category);
				System.out.println(article_image);
		
				
				articleList.setAseq(aseq);
				articleList.setArticle_title(article_title);
				articleList.setArticle_category(article_category);
				articleList.setArticle_image(article_image);
			
				
				//ArrayList에 추가
				articleLists.add(articleList);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
		return articleLists;
	}*/
	//패션 카테고리 기사 나열하기
	public ArrayList<ArticleDTO> fashionArticleLists() {
		
		System.out.println("fashionArticleLists()");
		
		ArrayList<ArticleDTO> articleLists = new ArrayList<ArticleDTO>();//하나의 행을 가지고 있음
		
		String sql = "SELECT * FROM article where category_no = 1";
		
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
				
				ArticleDTO  articleList = new ArticleDTO();
				
				//출력문 확인
				int aseq = rset.getInt("aseq");
				String article_title = rset.getString("article_title");
				int category_no = rset.getInt("category_no");
				String article_image_pc = rset.getString("article_image_pc");
				String article_image_m = rset.getString("article_image_m");
				
				System.out.println(aseq);
				System.out.println(article_title);
				System.out.println(category_no);
				System.out.println(article_image_pc);
				System.out.println(article_image_m);
		
				
				articleList.setAseq(aseq);
				articleList.setArticle_title(article_title);
				articleList.setCategory_no(category_no);
				articleList.setArticle_image_pc( article_image_pc);
				articleList.setArticle_image_m(article_image_m);
			
				
				//ArrayList에 추가
				articleLists.add(articleList);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
		return articleLists;
	}
	
}
