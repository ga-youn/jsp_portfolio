<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/article.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/contents.js"></script>
</head>
<body>
	<h1 style="display:none;" id="hidden_title">보그코리아 | fashion</h1>
        <!--###############################콘텐츠시작#################################################################-->
        <main id="main">
            <div class="fusion-row">
                <!--카테고리 제목-->
                <h2 class="entry-title">Fashion</h2>   
                <!-- 서브 카테고리 -->
                <div class="sub_menu">
                    <ul>
                        <li class="sub_menu_in"><a href="#">전체</a></li>
                        <li class="sub_menu_in"><a href="#">트렌드</a></li>
                        <li class="sub_menu_in"><a href="#">쇼핑</a></li>
                        <li class="sub_menu_in"><a href="#">피플</a></li>
                        <li class="sub_menu_in"><a href="#">화보</a></li>			
                    </ul>
                </div>
                <!--콘텐츠 목록-->
                <section class="home_content" style="width: 100%;">
                    <div class="" >
                    <c:forEach items="${articleList}" var="article">
                        <a href="#" title="${article.article_title}">
                            <article class="main_news" style="background: url(${pageContext.request.contextPath}/images/${article.article_image_pc})">  
                                <h3 class="txt" style="display:none">${article.article_title}</h3>
                                <div class="border"></div>
                            </article>
                            
                        </a> 
                     </c:forEach> 
                    </div>
                </section>    
            </div> 
        </main> 
        <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->