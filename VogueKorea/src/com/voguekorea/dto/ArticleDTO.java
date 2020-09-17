package com.voguekorea.dto;

public class ArticleDTO {

	/*[테이블]
	CREATE TABLE article(
	    aseq    NUMBER(5) PRIMARY KEY,                          --콘텐츠번호
	    article_title VARCHAR2(100) NOT NULL,                   --콘텐츠제목
	    category_no NUMBER(5) NOT NULL,                         --콘텐츠카테고리 --외래키
	    article_image_pc   VARCHAR2(100)  DEFAULT 'default.jpg',--이미지 파일 피시
	    article_image_m  VARCHAR2(100)   DEFAULT 'default.jpg', --이미지 파일 모바일
	    CONSTRAINT article_fk FOREIGN KEY(category_no) REFERENCES Article_category
	); 
	 */
	//필드선언
	private int aseq;					//콘텐츠번호
	private String article_title;		//콘텐츠제목
	private int category_no;		//콘텐츠카테고리
	private String article_image_pc;		//이미지 이름
	private String article_image_m;
	
	//접근을 위한 get(), set() 메서드
	public int getAseq() {
		return aseq;
	}
	public void setAseq(int aseq) {
		this.aseq = aseq;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getArticle_image_pc() {
		return article_image_pc;
	}
	public void setArticle_image_pc(String article_image_pc) {
		this.article_image_pc = article_image_pc;
	}
	public String getArticle_image_m() {
		return article_image_m;
	}
	public void setArticle_image_m(String article_image_m) {
		this.article_image_m = article_image_m;
	}
	
	
	
}