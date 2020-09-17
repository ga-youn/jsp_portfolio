package com.voguekorea.dto;

import java.sql.Timestamp;

public class OrderListDTO {
	
	/*[테이블]
	 
	CREATE TABLE orderList(
    	order_seq   NUMBER(5)     PRIMARY KEY,  --주문번호
	    order_name  VARCHAR2(20)    NOT NULL,   --주문자 이름
	    order_phone VARCHAR2(20)    NOT NULL,   --주문자 번호
	    order_mail  VARCHAR2(20)    NOT NULL,   --주문자 이메일
	    re_name     VARCHAR2(20)    NOT NULL,   --수취인 이름
	    re_address  VARCHAR2(100)    NOT NULL,  --수취인 주소
	    re_phone    VARCHAR2(20)    NOT NULL,   --수취인 번호
	    re_comment      VARCHAR2(100),              --남기실말씀
	    indate		date
	    pay_seq     NUMBER(5),                  --주문내역
	    id          VARCHAR2(20),               --주문자 아이디
	    --카드or현금 정보 추가해야함
	    CONSTRAINT orderList_fk_payment FOREIGN KEY(pay_seq) REFERENCES addPayment,
	    CONSTRAINT orderList_fk_id FOREIGN KEY(id) REFERENCES member   
	);
	*/
	//필드정의
	
	private int order_seq;
	private String order_name;
	private String order_phone;
	private String order_mail;
	private String re_name;
	private String re_address;
	private String re_phone;
	private String re_comment;
	private Timestamp indate;
	private int pay_seq;
	private int pseq;
	private String name;
	private String content;
	private int count;
	private String image;
	private int price;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	private String id;
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_mail() {
		return order_mail;
	}
	public void setOrder_mail(String order_mail) {
		this.order_mail = order_mail;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_address() {
		return re_address;
	}
	public void setRe_address(String re_address) {
		this.re_address = re_address;
	}
	public String getRe_phone() {
		return re_phone;
	}
	public void setRe_phone(String re_phone) {
		this.re_phone = re_phone;
	}
	public String getRe_comment() {
		return re_comment;
	}
	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}
	public int getPay_seq() {
		return pay_seq;
	}
	public void setPay_seq(int pay_seq) {
		this.pay_seq = pay_seq;
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
	
	
	
	
	
}
