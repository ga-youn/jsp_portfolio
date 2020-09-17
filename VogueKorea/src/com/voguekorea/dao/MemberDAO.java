package com.voguekorea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.voguekorea.dto.MemberDTO;

import util.DBManager;

public class MemberDAO {

	//생성자
	public MemberDAO() {}
	
	//싱글톤 방식 
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	//회원정보를 저장
	public int insertMember(MemberDTO member) {
		System.out.println("insertMember() 실행");//경로확인
		
		int result = 0;
		String sql = "INSERT INTO member(id,pwd,name,email,phone,address) VALUES(?,?,?,?,?,?)";
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
			pstmt.setString(1, member.getId());//varchat2로 받기 때문에 모두 String으로 
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(5, member.getAddress());
			
			
			//쿼리문 실행
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}
	

	
	//로그인시 회원정보를 불러온다.
	public MemberDTO selectMember(String userId) {
		
		System.out.println("selectMember() 실행");
		System.out.println("selectMember's id:"+userId);
		
		MemberDTO member = null;
		
		String sql = "SELECT * FROM member WHERE id=?";//인자값은 물음표
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		ResultSet rset = null;//결과
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);//첫번째 인자값
			rset = pstmt.executeQuery();//실행
			
			if(rset.next()) {//값 읽어오기
				
				//출력문 확인
				String id = rset.getString("id");
				String pwd = rset.getString("pwd");
				String name = rset.getString("name");
				String email = rset.getString("email");
				String phone = rset.getString("phone");
				String address = rset.getString("address");
				
				
				System.out.println(id);
				System.out.println(pwd);
				System.out.println(name);
				System.out.println(email);
				System.out.println(phone);
				System.out.println(address);
				
				//member = new MemberDTO();
				//member.setId(id);
				
				member = new MemberDTO();
				member.setId(id);
				member.setPwd(pwd);
				member.setName(name);
				member.setEmail(email);
				member.setPhone(phone);
				member.setAddress(address);

			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rset);
		}
		
		
	
		return member;
	}
	
	//아이디 중복 체크
	public int duplecateID(String id){ 
		int cnt=0; 
		try{ 
			Connection con= DBManager.getConnection(); 
			StringBuilder sql=new StringBuilder(); //아이디 중복 확인 
			sql.append(" SELECT count(id) as cnt "); 
			sql.append(" FROM member "); 
			sql.append(" WHERE id = ? "); 
			PreparedStatement pstmt=con.prepareStatement(sql.toString()); 
			pstmt.setString(1, id); 
			ResultSet rs=pstmt.executeQuery(); 
				if(rs.next()){ 
					cnt=rs.getInt("cnt"); 
				} 
		}catch(Exception e){ 
			System.out.println("아이디 중복 확인 실패 : " + e); 
			//try end }//duplecateID end
		}
		return cnt;
	}

	//수정된 회원정보 저장하기
	public void updateMember(MemberDTO member) {
		System.out.println("updateMember()");
		String id = member.getId();
		String pwd = member.getPwd();
		String name = member.getName();
		String email = member.getEmail();
		String address = member.getAddress();
		String phone = member.getPhone();
		
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(name);
		System.out.println(email);
		System.out.println(address);
		System.out.println(phone);
		
		String sql="UPDATE member SET pwd=?, name=?, email=?, address=?, phone=? WHERE id=?";
		
		Connection conn = null;//연결자
		PreparedStatement pstmt = null;//연결자
		
		try {
			//DB에 연결합니다.
			conn = DBManager.getConnection();
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			pstmt.setString(6, id);
			
			pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		
	}
}
