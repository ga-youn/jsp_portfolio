package com.voguekorea.dto;

import java.sql.Timestamp;

public class ProductDTO {
	/*[테이블]
	CREATE TABLE product (
	    pseq    NUMBER(5) PRIMARY KEY,  --상품번호
	    name    VARCHAR2(20),           --상품이름        
	    content VARCHAR2(1000),         --상품설명
	    detail  VARCHAR2(3000),         --상품상세내용
	    indate  DATE DEFAULT SYSDATE,   --등록일
	    image   VARCHAR2(1000),         --상품대표이미지
	    price   NUMBER(8)				--가격
	); 
	 */
	//필드선언
	private int pseq;			//상품번호
	private String name;		//상품이름
	private String content;		//상품설명
	private String detail;		//상품상세내용
	private Timestamp indate;	//상품등록일
	private String image;		//상품대표이미지
	private int price;			//가격
	
	//접근을 위한 get(), set()메소드
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
}
