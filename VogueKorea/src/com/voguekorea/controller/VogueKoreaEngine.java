package com.voguekorea.controller;

import com.voguekorea.controlloer.action.Action;
import com.voguekorea.controlloer.action.Add_cart;
import com.voguekorea.controlloer.action.Add_orderList;
import com.voguekorea.controlloer.action.Add_paymentList;
import com.voguekorea.controlloer.action.Beauty;
import com.voguekorea.controlloer.action.CartToPayment;
import com.voguekorea.controlloer.action.Change_cart;
import com.voguekorea.controlloer.action.Delete_cart;
import com.voguekorea.controlloer.action.Error;
import com.voguekorea.controlloer.action.Fashion;
import com.voguekorea.controlloer.action.Index;
import com.voguekorea.controlloer.action.Join_agree;
import com.voguekorea.controlloer.action.Join_register;
import com.voguekorea.controlloer.action.Join_registerForm;
import com.voguekorea.controlloer.action.Living;
import com.voguekorea.controlloer.action.Login;
import com.voguekorea.controlloer.action.LoginForm;
import com.voguekorea.controlloer.action.Logout;
import com.voguekorea.controlloer.action.MyPageForm;
import com.voguekorea.controlloer.action.Mypage_change_info;
import com.voguekorea.controlloer.action.Notice;
import com.voguekorea.controlloer.action.Notice_detail;
import com.voguekorea.controlloer.action.OrderList;
import com.voguekorea.controlloer.action.Payment;
import com.voguekorea.controlloer.action.Product;
import com.voguekorea.controlloer.action.Service_center_home;
import com.voguekorea.controlloer.action.Shopping_cart;
import com.voguekorea.controlloer.action.Store;
import com.voguekorea.controlloer.action.Video;
public class VogueKoreaEngine {

		//싱글톤패턴
		public VogueKoreaEngine() {
			super();
		}
		
		private static VogueKoreaEngine instance = new VogueKoreaEngine();
		
		public static VogueKoreaEngine getInstance() {
			return instance;
		}
		
		//타입에 따른 객체를 생성
		public Action getType(String type) {
			
			Action act = null;
			System.out.print("type="+type+"->");//타입체크
			
			if(type.equals("index")) {//메인
				
				act = new Index();
				
			}else if(type.equals("join_agree")) {//약관동의

				act = new Join_agree();
				
			}else if(type.equals("join_registerForm")){//정보입력 화면
				
				act = new Join_registerForm();
				
			}else if(type.equals("join_register")){//정보입력 서비스
				
				act = new Join_register();
				
			}else if(type.equals("loginForm")){//로그인 화면
				
				act = new LoginForm();
				
			}else if(type.equals("login")){//로그인 서비스
				
				act = new Login();
				
			}else if(type.equals("logout")){//로그아웃
				
				act = new Logout();
				
			}else if(type.equals("fashion")){//패션컨텐츠
				
				act = new Fashion();
				
			}else if(type.equals("beauty")){//뷰티컨텐츠
				
				act = new Beauty();
				
			}else if(type.equals("living")){//리빙컨텐츠
				
				act = new Living();
				
			}else if(type.equals("video")){//비디오컨텐츠
				
				act = new Video();
				
			}else if(type.equals("store")){//스토어
				
				act = new Store();
				
			}else if(type.equals("product")){//스토어-상세
				
				act = new Product();
				
			}else if(type.equals("shopping_cart")){//장바구니
				
				act = new Shopping_cart();
				
			}else if(type.equals("add_cart")){//장바구니에 넣기
				
				act = new Add_cart();
				
			}else if(type.equals("delete_cart")){//장바구니에서 삭제
				
				act = new Delete_cart();
				
			}else if(type.equals("change_cart")){//장바구니에서 삭제
				
				act = new Change_cart();
				
			}else if(type.equals("payment")){//결제페이지로이동
				
				act = new Payment();
				
			}else if(type.equals("cart_to_payment")){//결제페이지로이동
				
				act = new CartToPayment();
				
			}else if(type.equals("add_paymentList")){//결제목록에 넣기
				
				act = new Add_paymentList();
				
			}else if(type.equals("notice")){//공지사항
				
				act = new Notice();
				
			}else if(type.equals("notice_detail")){//공지사항
				
				act = new Notice_detail();
				
			}else if(type.equals("service_center_home")){//고객센터
				
				act = new Service_center_home();
				
			}else if(type.equals("error")){//준비하지 못한 페이지
				
				act = new Error();
				
			}else if(type.equals("myPageForm")){//마이페이지 - 정보수정 페이지 이동
				
				act = new MyPageForm();
				
			}else if(type.equals("change_info")){//마이페이지 - 정보수정 업데이트
				
				act = new Mypage_change_info();
				
			}else if(type.equals("orderList")){//마이페이지 - 주문조회
				
				act = new OrderList();
				
			}else if(type.equals("add_orderList")){//주문테이블에 삽입
				
				act = new Add_orderList();
				
			}
			return act;
		}
		
	}
