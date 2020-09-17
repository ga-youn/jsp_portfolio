package com.voguekorea.dto;

import java.sql.Timestamp;

public class MemberDTO {
	/*[테이블]
	 
	CREATE TABLE member(
	    id VARCHAR2(20) PRIMARY KEY,    --아이디
	    pwd VARCHAR2(20),               --비밀번호
	    name VARCHAR2(20),              --이름
	    email VARCHAR2(40),             --이메일
	    address VARCHAR2(100),          --주소
	    phone VARCHAR2(20),             --휴대폰번호
	    indate DATE DEFAULT SYSDATE,    --가입날짜
	    use CHAR(1)                     --탈퇴   
	);
	*/
	//필드선언
	private String id; 
	private String pwd; 
	private String name; 
	private String email; 
	private String phone; 
	private String address;
	private Timestamp indate ;
	private String use;
	
	//접근을 위한 get(), set()메소드
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getPwd() {return pwd;}
	public void setPwd(String pwd) {this.pwd = pwd;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getAddress() {return address;}
	public void setPhone(String phone) {this.phone = phone;}
	public Timestamp getIndate() {return indate;}
	public void setAddress(String address) {this.address = address;}
	public String getPhone() {return phone;}
	public void setIndate(Timestamp indate) {this.indate = indate;}
	public String getUse() {return use;}
	public void setUse(String use) {this.use = use;} 
	
}
