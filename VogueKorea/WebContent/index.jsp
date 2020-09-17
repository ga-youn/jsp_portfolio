<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp"%> <!-- header삽입 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<h1 style="display:none;" id="hidden_title">보그코리아 | 홈</h1>
	<!--###############################메인시작#################################################################-->
        
        <main>
            <section class="content_box">
                <!--메인기사-->
                <div class="container"> 
                    <a href="#" target="_top" >
                        <article class="main_article">
                            <h2 class="txt"></h2>
                            <div class="border"></div>
                            <img class="device_pc" src="${pageContext.request.contextPath}/images/main_article_pc03.jpg" alt="메인기사">
                            <img class="device_mobile" src="${pageContext.request.contextPath}/images/main_article_m03.jpg" alt="메인기사">
                        </article>
                    </a>
                </div>
                <!--서브기사-->
               
                <div class="device_pc sub_article" >
                    <c:forEach items="${articleList}" var="article">
	                    <a href="#" title="서브기사">
	                        <article class="main_news" style="background: url(${pageContext.request.contextPath}/images/${article.article_image_pc})">
	                            <h2 class="txt" style="display:none">${article.article_title}</h2>
	                            <div class="border"></div>
	                        </article> 
	                    </a>
					</c:forEach>
                </div>
                <!--모바일-->
                <div class="device_mobile" style="overflow: hidden;">
                    <c:forEach items="${articleList}" var="article">
	                    <a href="#" title="서브기사">
	                        <article class="main_news" style="background: url(${pageContext.request.contextPath}/images/${article.article_image_pc})">
	                            <h2 class="txt" style="display:none">${article.article_title}</h2>
	                            <div class="border"></div>
	                        </article> 
	                    </a>
					</c:forEach>
                </div>
                
            </section>
        </main>
        <!--################################################################################################-->
<%@ include file="./footer.jsp"%> <!-- footer삽입 -->
