<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script> 
	
	<h1 style="display:none;" id="hidden_title">보그코리아 | 로그인</h1>
	<!--###############################메인시작#################################################################-->
    <main>
        <section>
            <form id="login_form" name="login_form" action="vogueKorea.vk?type=login" method="post" onsubmit="return loginChk();">
                <h2>
                    LOGIN
                </h2>
                <!--입력영역-->
                <fieldset>
                    <div id=loginField>
                        <input type="text" name="id" id="loginId" placeholder="ID" value="" class="input_login">
                        <input type="password" name="pwd" id="loginPw"placeholder="PSASSWORD" value=""class="input_login">
                        
                        <div class="device_mobile">
                        	<button type="submit" class="btnLogin">로그인</button>
                        </div>
                        
                        <!--로그인상태유지-->
                        <div class="input_bottom">
                            <input type="checkbox" id="maintain_icon" class="checkbox_icon">
                            <label for="maintain_icon" id="maintain_icon">
                                <i class="fas fa-check-circle"></i>
                                <span title="개인정보 보호를 위해 개인pc에서만 사용해주세요.">로그인 상태 유지</span>
                            </label>
                            <!--아이디 비밀번호 찾기-->
                            <div class ="searchInfo">
                                <a href="#" title="아이디찾기">아이디 찾기</a> / 
                                <a href="#" title="비밀번호찾기">비밀번호 찾기</a>
                            </div>
                        </div>
                    </div>
                    <!--로그인버튼-->
                    <div class=" device_pc">
                    	<button type="submit" class="btnLogin device_pc">로그인</button>
                    </div>
                    
                </fieldset>
            </form>
        </section>
    </main>
    <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->