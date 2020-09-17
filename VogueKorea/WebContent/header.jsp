<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="auothor" content="박가연">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="./images/x-icon.JPG"><!--파비콘-->
    <title>보그 코리아</title>

    <script src="https://kit.fontawesome.com/cccee664d4.js" crossorigin="anonymous"></script>
    
<!--
JSTL : JSP Standard Tag Library = JSP에서 사용하는 태그를 모아둠  
jstl.jar : JSTL API 클래스
standard.jar : JSTL 구현 클래스
-->

<!-- prefix ="c" : 기본기능을 다룸 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- prefix ="fmt" : 형식화 -->
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagenation.css"><!--페이지네비게이션css-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pagenation.js"></script><!--페이지네비게이션js-->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		$(function(){$(document).attr("title",$('#hidden_title').html());});
</script>
</head>
<body>
    <!--전체 wrap-->
    <div id="wrapper">
        <!--#########################################헤더 시작###############################################-->
        <!--################################################################################################-->
        <header id="header">
            <!--pc헤더-->
            <div class="device_pc">
                <div id="header_row_1">
                    <!--sns바로가기-->
                    <div id="header_row_left">
                        <ul class="sns_icons">
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="instagram">
                                    <span><i class="fab fa-instagram"></i></span>
                                </a>
                            </li>
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="facebook">
                                    <span><i class="fab fa-facebook-square"></i></span>
                                </a>
                            </li>
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="youtube">
                                    <span><i class="fab fa-youtube"></i></span>
                                </a>
                            </li>
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="twitter">
                                    <span><i class="fab fa-twitter"></i></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!--gnb1-->
                    <nav id="header_row_right">
                        <ul class="menu">
                        	<c:choose> 
								<c:when test="${empty sessionScope.loginUserInfo}"> 
		                            <li class="menu_item">
		                                <a  href="vogueKorea.vk?type=loginForm" title="로그인하기" >
		                                    <span class="menu_text">로그인</span>
		                                </a>
		                            </li>
		                            <li class="menu_item">
		                                <a  href="vogueKorea.vk?type=join_agree" title="회원가입하기">
		                                    <span class="menu_text">회원가입</span>
		                                </a>
		                            </li>
		                       	</c:when>
								<c:otherwise>
		                            <li class="menu_item">
		                                <a  href="vogueKorea.vk?type=logout" title="로그아웃">
		                                    <span class="menu_text">로그아웃</span>
		                                </a>
		                            </li>
		                            <li class="menu_item">
		                                <a  href="vogueKorea.vk?type=orderList" title="마이페이지">
		                                    <span class="menu_text">마이페이지</span>
		                                </a>
		                            </li>
		                       	</c:otherwise>
							</c:choose>
                            <li class="menu_item">
                                <a  href="vogueKorea.vk?type=shopping_cart" title="장바구니로 이동">
                                    <span class="menu_text">장바구니</span>
                                </a>
                            </li>
                            <li class="menu_item">
                                <a  href="vogueKorea.vk?type=service_center_home" title="고객센터로 이동">
                                    <span class="menu_text">고객센터</span>
                                </a>
                            </li>
                            <li class="menu_item search_box device_pc">
                                <input type="text" placeholder="검색어를 입력하세요."  />
                                <button><i class="fas fa-search"></i></button>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--logo-->
                <div id="main_logo">
                    <a href="vogueKorea.vk?type=index">
                        <h1><img src="${pageContext.request.contextPath}/images/h1_logo.png" alt="보그 코리아 (Vogue Korea) Logo"  class="logo" /></h1>
                    </a>
                </div>
                <!--gnb2:카테고리-->
                <nav id="header_row_middle">
                    <ul class="main_menu">
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=fashion" >
                                <span class="menu_text">FASHION</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=beauty" >
                                <span class="menu_text">BEAUTY</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=living" >
                                <span class="menu_text">LIVING</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=video" >
                                <span class="menu_text">VIDEO</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=store" >
                                <span class="menu_text menu_text_store">STORE</span>
                            </a>
                        </li>
                        
                    </ul>
                </nav>
            </div>
            <!--고정헤더-->
            <div class="sticky_header" id="sticky_head">
                <div id="main_logo">
                    <a href="vogueKorea.vk?type=index">
                        <img src="${pageContext.request.contextPath}/images/h1_logo.png" alt="보그 코리아 (Vogue Korea) Logo"  class="logo" />
                    </a>
                </div>
                <nav id="header_row_middle">
                    <ul class="main_menu">
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=fashion" >
                                <span class="menu_text">FASHION</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=beauty" >
                                <span class="menu_text">BEAUTY</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=living" >
                                <span class="menu_text">LIVING</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=video" >
                                <span class="menu_text">VIDEO</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="vogueKorea.vk?type=store" >
                                <span class="menu_text">STORE</span>
                            </a>
                        </li>
                        <li class="menu_item search_box device_pc">
                            <input type="text" placeholder="검색어를 입력하세요." />
                            <button><i class="fas fa-search"></i></button>
                        </li>
                    </ul>
                </nav>
            </div>
            <!--모바일 헤더-->
            <div class="device_mobile">
                <div id="main_logo">
                    <a href="vogueKorea.vk?type=index">
                        <h1><img src="${pageContext.request.contextPath}/images/h1_logo.png" alt="보그 코리아 (Vogue Korea) Logo"  class="logo" /></h1>
                    </a>
                </div>
                <!--장바구니 바로가기 아이콘-->
                <div class="shopping_cart">
                    <a href="vogueKorea.vk?type=shopping_cart">
                        <i class="fas fa-shopping-cart"></i>
                    </a>
                </div>
                <!--모바일 메뉴 카테고리:메뉴전체 판넬 -->
                <div class="panel left">
                <!-- 눌렀을경우 메뉴가 나타나고, 사라지는 부분 -->
                    <a class="ninja-btn" title="menu"><span></span></a>
                    <!-- 메뉴의 내용부분 -->
                    <span class="mo-menu-title"></span>
                    <ul>
						<c:choose> 
							<c:when test="${empty sessionScope.loginUserInfo}"> 
                        		<li class="menu-label"><a  href="vogueKorea.vk?type=loginForm" title="로그인하기" >로그인</a></li>
                        		<li class="menu-label"><a  href="vogueKorea.vk?type=join_agree" title="회원가입하기">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li class="menu-label"><a  href="vogueKorea.vk?type=logout" title="로그아웃하기">로그아웃</a></li>
								<li class="menu-label"><a  href="#" title="마이페이지">마이페이지</a></li>                          
                         	</c:otherwise>
						</c:choose>
                        <li class="menu-label"><a  href="vogueKorea.vk?type=shopping_cart" title="장바구니로 이동">장바구니</a></li>
                        <li class="menu-label"><a  href="vogueKorea.vk?type=service_center_home" title="고객센터로 이동">고객센터</a></li>
                        <li class="sub-menu"><a  href="vogueKorea.vk?type=notice" title="공지사항으로 이동">공지사항</a></li>
                        <li class="menu-label"><a href="#">VOGUE</a></li>
                        <li class="sub-menu"><a href="vogueKorea.vk?type=fashion">FASHION</a></li>
                        <li class="sub-menu"><a href="vogueKorea.vk?type=beauty">BEAUTY</a></li>
                        <li class="sub-menu"><a href="vogueKorea.vk?type=living">LIVING</a></li>
                        <li class="sub-menu"><a href="vogueKorea.vk?type=video">VIDEO</a></li>
                        <li class="sub-menu"><a href="vogueKorea.vk?type=store">STORE</a></li>
                    </ul>
                </div><!--메뉴전체 판넬 -->
  
                <!--메뉴 밖에 어두워지는 부분-->
                <div class="panel-overlay"></div>
                
            </div>
        </header>
       
        
        <!--################################################################################################-->