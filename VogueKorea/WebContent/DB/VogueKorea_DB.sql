--모든테이블 삭제
--DROP TABLE member cascade constraints; DROP TABLE article cascade constraints;DROP TABLE Article_category;DROP TABLE notice;DROP TABLE product cascade constraints;
--DROP TABLE addCart;DROP TABLE addPayment;DROP SEQUENCE addCart_seq;DROP SEQUENCE product_seq;DROP SEQUENCE Article_category_seq;
--DROP SEQUENCE article_seq;DROP SEQUENCE notice_seq;DROP SEQUENCE addPayment_seq;

--member 테이블
CREATE TABLE member(
    id VARCHAR2(20) PRIMARY KEY,    --아이디
    pwd VARCHAR2(20) NOT NULL,      --비밀번호
    name VARCHAR2(10) NOT NULL,     --이름
    email VARCHAR2(40),             --이메일
    phone VARCHAR2(12),             --휴대폰번호
    address VARCHAR2(100),          --주소
    indate DATE DEFAULT SYSDATE,    --가입날짜
    use CHAR(1) DEFAULT 'Y'         --탈퇴   
);
--테이블 확인
DESC member;
--데이터 확인
SELECT * 
FROM member;
--기본 회원 데이터 베이스 설정
INSERT INTO member(id, pwd, name, email, phone, address)
VALUES ('scott123', 'tiger123!', '홍길동', 'scott123@gmail.com', '01012341234', '인천광역시 미추홀구 한나루로');
--article category 테이블
CREATE TABLE Article_category(
    category_no  NUMBER(5)      PRIMARY KEY,     --카테고리 넘버
    category_name VARCHAR2(20)  NOT NULL         --카테고리 이름
);
--article 테이블
CREATE TABLE article(
    aseq    NUMBER(5) PRIMARY KEY,                          --콘텐츠번호
    article_title VARCHAR2(100) NOT NULL,                   --콘텐츠제목
    category_no NUMBER(5) NOT NULL,                         --콘텐츠카테고리 --외래키
    article_image_pc   VARCHAR2(100)  DEFAULT 'default.jpg',--이미지 파일 피시
    article_image_m  VARCHAR2(100)   DEFAULT 'default.jpg', --이미지 파일 모바일
    CONSTRAINT article_fk FOREIGN KEY(category_no) REFERENCES Article_category
); 

--article category 번호 부여를 위한 시퀀스
CREATE SEQUENCE Article_category_seq START WITH 1;
--카테고리추가
INSERT INTO  Article_category --패션카테고리삽입
VALUES(Article_category_seq.NEXTVAL,'FASHION');
INSERT INTO  Article_category --뷰티카테고리삽입
VALUES(Article_category_seq.NEXTVAL,'BEAUTY');
INSERT INTO  Article_category --리빙카테고리삽입
VALUES(Article_category_seq.NEXTVAL,'LIVING');
INSERT INTO  Article_category --비디오카테고리삽입
VALUES(Article_category_seq.NEXTVAL,'VIDEO');

DESC Article_category;
SELECT *
FROM Article_category;
DESC Article;
SELECT *
FROM Article;
--article 번호 부여를 위한 시퀀스
CREATE SEQUENCE article_seq START WITH 1;
COMMIT;

--기사 추가
INSERT INTO article(aseq, article_title, category_no, article_image_pc)
VALUES(article_seq.NEXTVAL,'공효진의 매력','1','sub_article.jpg');
INSERT INTO article(aseq, article_title, category_no, article_image_pc)
VALUES(article_seq.NEXTVAL,'향수에 관하여','1','sub_article02.jpg');
INSERT INTO article(aseq, article_title, category_no, article_image_pc)
VALUES(article_seq.NEXTVAL,'선물의 관행','1','sub_article03.jpg');


INSERT INTO article(aseq, article_title, category_no, article_image_pc)
VALUES(article_seq.NEXTVAL,'아티클패션','1','article_fashion_01.PNG');
INSERT INTO article(aseq, article_title, category_no, article_image_pc)
VALUES(article_seq.NEXTVAL,'사진찍기','1','article_fashion_02.PNG');
INSERT INTO article(aseq, article_title, category_no, article_image_pc)
VALUES(article_seq.NEXTVAL,'패션에관하여','1','article_fashion_03.PNG');
INSERT INTO article(aseq, article_title, category_no, article_image_pc)
VALUES(article_seq.NEXTVAL,'유행은돌고돌아','1','article_fashion_04.PNG');
--SELECT * FROM article where category_no=1;
--공지사항 테이블
CREATE TABLE notice (
    nseq    NUMBER(5) PRIMARY KEY, --글번호
    subject VARCHAR2(1000),        --글제목        
    content VARCHAR2(3000),        --글내용
    id      VARCHAR2(20),          --아이디(사용자)
    indate  DATE DEFAULT SYSDATE,  --등록일
    hit     NUMBER(10) DEFAULT 0   --조회수
); 

--공지사항 번호 부여를 해결하기 위한 시퀀스
CREATE SEQUENCE notice_seq START WITH 1;

INSERT INTO
notice(nseq, subject, content, id)
VALUES(notice_seq.NEXTVAL,'시스템 메뉴얼로 인한 비밀번호 초기화 안내입니다.','안녕하세요,<br/>
                                                <br/>
                                                매거진샵을 이용해 주셔서 감사 드립니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                매거진샵은 편리하고 신속한 서비스 제공을 위해 <br/>전면적인 시스템 개편을 하게 되었습니다.<br/>
                                                <br/>
                                                그 과정에 개인정보보호, <br/>비밀번호 암호화의 이유로 고객 데이터가 이전되지 못하였습니다.<br/>
                                                <br/>
                                                따라서 2019년 9월 5일 이전 가입 고객께서는 아래 <br/>안내에 따라 비밀번호를 <br/>재설정해 주시기 바랍니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                고객님의 기존 비밀번호는<br/> 관리자라 할지라도 조회나 확인이 불가능하기에<br/>
                                                <br/>
                                                부득이하게 임시번호를 부여해 드렸음을 <br/>알려드립니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                불편을 끼쳐드려 죄송하며,<br/> 궁금한 점은 고객센터로 연락 주시거나 카카오톡 (id:두산매거진)로 문의 주시기 바랍니다.<br/>
                                                <br/>
                                                성심껏 답변 드리도록 하겠습니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                감사합니다.<br/>','관리자');
INSERT INTO notice(nseq, subject, content, id)
VALUES(notice_seq.NEXTVAL,'두번째 공지사항 입니다.','안녕하세요,<br/>
                                                <br/>
                                                매거진샵을 이용해 주셔서 감사 드립니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                매거진샵은 편리하고 신속한 서비스 제공을 위해 <br/>전면적인 시스템 개편을 하게 되었습니다.<br/>
                                                <br/>
                                                그 과정에 개인정보보호, <br/>비밀번호 암호화의 이유로 고객 데이터가 이전되지 못하였습니다.<br/>
                                                <br/>
                                                따라서 2019년 9월 5일 이전 가입 고객께서는 아래 <br/>안내에 따라 비밀번호를 <br/>재설정해 주시기 바랍니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                고객님의 기존 비밀번호는<br/> 관리자라 할지라도 조회나 확인이 불가능하기에<br/>
                                                <br/>
                                                부득이하게 임시번호를 부여해 드렸음을 <br/>알려드립니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                불편을 끼쳐드려 죄송하며,<br/> 궁금한 점은 고객센터로 연락 주시거나 카카오톡 (id:두산매거진)로 문의 주시기 바랍니다.<br/>
                                                <br/>
                                                성심껏 답변 드리도록 하겠습니다.<br/>
                                                <br/>
                                                <br/>
                                                <br/>
                                                감사합니다.<br/>','관리자');
SELECT *
FROM notice;

--마지막 공지사항 게시물만 검색
--SELECT * FROM(SELECT * FROM notice ORDER BY ROWNUM ASC)WHERE ROWNUM = 1;
--SELECT * FROM notice ORDER BY nseq DESC;

--상품 테이블
CREATE TABLE product (
    pseq    NUMBER(5) PRIMARY KEY,  --상품번호
    name    VARCHAR2(20),           --상품이름        
    content VARCHAR2(1000),         --상품설명
    detail  VARCHAR2(3000),         --상품상세내용
    indate  DATE DEFAULT SYSDATE,   --등록일
    image   VARCHAR2(1000),         --상품대표이미지
    price   NUMBER(8)
); 

--상품 번호 부여를 해결하기 위한 시퀀스
CREATE SEQUENCE product_seq START WITH 1;
--상품추가
INSERT INTO product(pseq, name, content, detail, image, price)
VALUES(product_seq.NEXTVAL,'9월호 상품','9월호 입니다.','image_manual.jpg','goods_image.jpg','56400');
INSERT INTO product(pseq, name, content, detail, image, price)
VALUES(product_seq.NEXTVAL,'8월호 상품','8월호 입니다.','image_manual.jpg','goods_image02.jpg','12400');
INSERT INTO product(pseq, name, content, detail, image, price)
VALUES(product_seq.NEXTVAL,'7월호 상품','7월호 입니다.','image_manual.jpg','goods_image03.jpg','33400');
INSERT INTO product(pseq, name, content, detail, image, price)
VALUES(product_seq.NEXTVAL,'5월호 상품','5월호 입니다.','image_manual.jpg','goods_image.jpg','56400');


commit;

--장바구니 테이블
CREATE TABLE addCart (
    cseq    NUMBER(5)       PRIMARY KEY,                    --장바구니번호
    pseq    NUMBER(5)       NOT NULL,                       --제품번호
    name    VARCHAR2(20)    NOT NULL,                       --상품이름        
    content VARCHAR2(1000)  NOT NULL,                       --상품설명
    count   NUMBER(5)       NOT NULL,                       --수량
    image   VARCHAR2(1000)  NOT NULL,                       --상품대표이미지
    price   NUMBER(8)       NOT NULL,                       --가격
    id      VARCHAR2(20) default 'NULL',                    --유저아이디
    CONSTRAINT addCart_fk_product FOREIGN KEY(pseq) REFERENCES product ON DELETE CASCADE,
    CONSTRAINT addCart_fk_id FOREIGN KEY(id) REFERENCES member
    ON DELETE CASCADE
);
COMMIT;
CREATE SEQUENCE addCart_seq START WITH 1;

--SELECT * FROM addCart WHERE id='scott123' ORDER BY cseq DESC;

--결제리스트
CREATE TABLE addPayment(
    pay_seq NUMBER(5)       PRIMARY KEY,                    --결제번호
    pseq    NUMBER(5)       NOT NULL,                       --제품번호
    name    VARCHAR2(20)    NOT NULL,                       --상품이름        
    content VARCHAR2(1000)  NOT NULL,                       --상품설명
    count   NUMBER(5)       NOT NULL,                       --수량
    image   VARCHAR2(1000)  NOT NULL,                       --상품대표이미지
    price   NUMBER(8)       NOT NULL,                       --가격
    id      VARCHAR2(20) default 'NULL',                    --유저아이디
    CONSTRAINT addPayment_fk_product FOREIGN KEY(pseq) REFERENCES product ON DELETE CASCADE,
    CONSTRAINT addPayment_fk_id FOREIGN KEY(id) REFERENCES member ON DELETE CASCADE
);
CREATE SEQUENCE addPayment_seq START WITH 1;
COMMIT;

--주문리스트
CREATE TABLE orderList(
    order_seq   NUMBER(5)     PRIMARY KEY,  --주문번호
    order_name  VARCHAR2(20)    NOT NULL,   --주문자 이름
    order_phone VARCHAR2(20)    NOT NULL,   --주문자 번호
    order_mail  VARCHAR2(20)    NOT NULL,   --주문자 이메일
    re_name     VARCHAR2(20)    NOT NULL,   --수취인 이름
    re_address  VARCHAR2(100)    NOT NULL,  --수취인 주소
    re_phone    VARCHAR2(20)    NOT NULL,   --수취인 번호
    re_comment     VARCHAR2(100),           --남기실말씀
    indate        DATE  DEFAULT SYSDATE,
    pay_seq     NUMBER(5),  --주문내역
    id          VARCHAR2(20),               --주문자 아이디
    --카드or현금 정보 추가해야함
    CONSTRAINT orderList_fk_payment FOREIGN KEY(pay_seq) REFERENCES addPayment ON DELETE CASCADE,
    CONSTRAINT orderList_fk_id FOREIGN KEY(id) REFERENCES member ON DELETE CASCADE  
);
select *
from orderlist;
SELECT * FROM orderList NATURAL JOIN addPayment order by id;
CREATE SEQUENCE orderList_seq START WITH 1;
COMMIT;