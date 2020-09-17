package com.voguekorea.dto;

public class CartDTO {

	
	/*[테이블]
		CREATE TABLE addCart (
		    cseq    NUMBER(5)       PRIMARY KEY,                    --주문번호
		    pseq    NUMBER(5)       NOT NULL,                       --제품번호
		    name    VARCHAR2(20)    NOT NULL,                       --상품이름        
		    content VARCHAR2(1000)  NOT NULL,                       --상품설명
		    count   NUMBER(5)       NOT NULL,                       --수량
		    image   VARCHAR2(1000)  NOT NULL,                       --상품대표이미지
		    price   NUMBER(8)       NOT NULL,                       --가격
		    id      VARCHAR2(20) default 'NULL',                    --유저아이디
		    CONSTRAINT addCart_fk_product FOREIGN KEY(pseq) REFERENCES product,
		    CONSTRAINT addCart_fk_id FOREIGN KEY(id) REFERENCES member
		);
	*/
	//필드선언
	private int cseq;
	private int pseq;
	
	private String name;
	private String content;
	private int count;
	private String image;
	private int price;
	private String id;
	
	//접근을 위한 get(), set() 메서드
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
