package com.voguekorea.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.voguekorea.dto.NoticeDTO;

import util.DBManager;

public class NoticeDAO {

		//생성자
		public NoticeDAO() {}
		
		//싱글톤 방식 
		private static NoticeDAO instance = new NoticeDAO();
		
		public static NoticeDAO getInstance() {
			return instance;
		}
		
		
		//LastNoticeList 메서드 - 고객센터 페이지에서 마지막 공지사항만 출력
		public ArrayList<NoticeDTO> lastNoticeList() {
			
			System.out.println("lastNoticeList()");
			
			ArrayList<NoticeDTO> noticeLists = new ArrayList<NoticeDTO>();//하나의 행을 가지고 있음
			
			String sql = "SELECT * FROM (SELECT * FROM notice ORDER BY ROWNUM DESC) WHERE ROWNUM = 1";
			
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
					
					NoticeDTO noticeList = new NoticeDTO();
					//출력문 확인
	
					int nseq = rset.getInt("nseq");			//글번호
					String subject = rset.getString("subject");		//글제목
					String content = rset.getString("content");		//글내용
					String id = rset.getString("id");			//아이디(사용자)
					Timestamp indate = rset.getTimestamp("indate");	//글등록일
					int hit = rset.getInt("hit");			//조회수
					
					
					System.out.println(nseq);
					System.out.println(subject);
					System.out.println(content);
					System.out.println(id);
					System.out.println(indate);
					System.out.println(hit);
					
				
					noticeList.setNseq(nseq);
					noticeList.setSubject(subject);
					noticeList.setContent(content);
					noticeList.setId(id);
					noticeList.setIndate(indate);
					noticeList.setHit(hit);
					
					//ArrayList에 추가
					noticeLists.add(noticeList);
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rset);
			}
			
			
			return noticeLists;
		}
		//allNoticeLists 메서드 - 공지사항 모두 출력
		public ArrayList<NoticeDTO> allNoticeLists() {
			
			System.out.println("allNoticeLists()");
			
			ArrayList<NoticeDTO> noticeLists = new ArrayList<NoticeDTO>();//하나의 행을 가지고 있음
			
			String sql = "SELECT * FROM notice ORDER BY nseq DESC";
			
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
					
					NoticeDTO noticeList = new NoticeDTO();
					//출력문 확인
	
					int nseq = rset.getInt("nseq");			//글번호
					String subject = rset.getString("subject");		//글제목
					String content = rset.getString("content");		//글내용
					String id = rset.getString("id");			//아이디(사용자)
					Timestamp indate = rset.getTimestamp("indate");	//글등록일
					int hit = rset.getInt("hit");			//조회수
					
					
					System.out.println(nseq);
					System.out.println(subject);
					System.out.println(content);
					System.out.println(id);
					System.out.println(indate);
					System.out.println(hit);
					
				
					noticeList.setNseq(nseq);
					noticeList.setSubject(subject);
					noticeList.setContent(content);
					noticeList.setId(id);
					noticeList.setIndate(indate);
					noticeList.setHit(hit);
					
					//ArrayList에 추가
					noticeLists.add(noticeList);
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rset);
			}
			
			
			return noticeLists;
		}
		
		//공지사항 상세보기
		public NoticeDTO selectNotice(int clickNseq) {
			System.out.println("selectNotice()");//경로확인
			NoticeDTO notice = null;
			
			String sql = "SELECT * FROM notice WHERE nseq=?";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			try {
				
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, clickNseq);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					notice = new NoticeDTO();
					
					int nseq = rset.getInt("nseq");			//글번호
					String subject = rset.getString("subject");		//글제목
					String content = rset.getString("content");		//글내용
					String id = rset.getString("id");			//아이디(사용자)
					Timestamp indate = rset.getTimestamp("indate");	//글등록일
					int hit = rset.getInt("hit");			//조회수
					
					hit++; //클릭 할 때마다 조회수 증가하기 위해서 
					updateHit(clickNseq, hit);
					
					
					System.out.println(nseq);
					System.out.println(subject);
					System.out.println(content);
					System.out.println(id);
					System.out.println(indate);
					System.out.println(hit);
					
				
					notice.setNseq(nseq);
					notice.setSubject(subject);
					notice.setContent(content);
					notice.setId(id);
					notice.setIndate(indate);
					notice.setHit(hit);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rset);
			}
			
			return notice; 
		}
		//공지사항 조회수 업데이트
		public void updateHit(int clickNseq, int hit) {
			System.out.println("updateHit()");//경로확인
			
			String sql = "UPDATE notice SET hit=" + hit + "where nseq=" +clickNseq;
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				
				//DB에 연결합니다.
				conn = DBManager.getConnection();
				//쿼리문 준비
				pstmt = conn.prepareStatement(sql);
		
				//쿼리문 실행
				pstmt.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt);
			}

		}
}