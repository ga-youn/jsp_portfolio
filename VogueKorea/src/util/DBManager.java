package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {
	
	/*ojdbc5.jar 라이브러리 이용*/
	//localhost : 오라클 서버가 작동하고 있는 컴퓨터의 IP주소
	//1521 : 포트 번호
	//XE : 오라클 서버의 전역 데이터 베이스 이름
	
	private static String url = "jdbc:oracle:thin:@localhost:1521:XE";//JDBC 형식 URL-이클립스 오라클 접속 방법
	private static String udi = "gd25th06";//오라클 아이디
	private static String pwd = "gd1234";//오라클 비밀번호
	
	//DB연결을 위한 메서드
	public static Connection getConnection(){
		Connection conn = null;//연결이 안됐을 때, 기본 
		try {
			//JDBC 드라이버를 로드를 하면 OracleDriver 객체가 생성
			Class.forName("oracle.jdbc.driver.OracleDriver");//로드
			conn = DriverManager.getConnection(url, udi, pwd);//접속 계정, 아이디, 비밀번호
		}catch(Exception e){//매개변수가 없기 때문에 Exception 사용가능
			e.printStackTrace();
		}
		return conn;
	}
	
	/*
		Connection 객체 : 데이터 베이스의 연결을 지원한다.
		PriparedStatement 객체 : SQL 표준 쿼리문을 수행하기 위하여 사용한다.
		ResultSet 객체 : 레코드 단위로 결과를 가져온다.
	 */
	//DB연결 해제를 위한 메서드			 1.연결				2.준비				3.응답
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rset){
		
		if(rset != null ){//결과값이 있을 때
			try {
				rset.close();//3.응답 끄기  - 역순으로 꺼줘야함
			}catch(SQLException e) {//매개 변수가 정해졌기 때문에 SQL안에서 예외처리 할것
				e.printStackTrace();
			}
		}
		if(pstmt != null ){//결과값이 있을 때
			try {
				pstmt.close();//2.준비 끄기
			}catch(SQLException e) {//매개 변수가 정해졌기 때문에 SQL안에서 예외처리 할것
				e.printStackTrace();
			}
		}
		if(conn != null ){//결과값이 있을 때
			try {
				conn.close();//1.연결 끄기
			}catch(SQLException e) {//매개 변수가 정해졌기 때문에 SQL안에서 예외처리 할것
				e.printStackTrace();
			}
		}
	}
	
	//오버로딩
	//DB연결 해제를 위한 메서드			 1.연결				2.준비				
	public static void close(Connection conn, PreparedStatement pstmt){
		
		if(pstmt != null ){//결과값이 있을 때
			try {
				pstmt.close();//2.준비 끄기
			}catch(SQLException e) {//매개 변수가 정해졌기 때문에 SQL안에서 예외처리 할것
				e.printStackTrace();
			}
		}
		if(conn != null ){//결과값이 있을 때
			try {
				conn.close();//1.연결 끄기
			}catch(SQLException e) {//매개 변수가 정해졌기 때문에 SQL안에서 예외처리 할것
				e.printStackTrace();
			}
		}
		
	}
}
