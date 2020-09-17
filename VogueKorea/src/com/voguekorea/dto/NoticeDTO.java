package com.voguekorea.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	
	/*[테이블]
	CREATE TABLE notice (
	    nseq    NUMBER(5) PRIMARY KEY, --글번호
	    subject VARCHAR2(1000),        --글제목        
	    content VARCHAR2(3000),        --글내용
	    id      VARCHAR2(20),          --아이디(사용자)
	    indate  DATE DEFAULT SYSDATE,  --등록일
	    hit     NUMBER(10) DEFAULT 0   --조회수
	);
	 */
	//필드선언
	private int nseq;			//글번호
	private String subject;		//글제목
	private String content;		//글내용
	private String id;			//아이디(사용자)
	private Timestamp indate;	//글등록일
	private int hit;			//조회수
	
	
	//접근을 위한 get(), set()메소드
	public int getNseq() {
		return nseq;
	}
	public void setNseq(int nseq) {
		this.nseq = nseq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
