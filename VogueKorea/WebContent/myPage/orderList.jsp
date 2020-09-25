<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/changeInfo.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/my_page.js"></script>
    <script type="text/javascript">
        /*우편번호찾기 API*/
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 도로명 조합형 주소 변수
    
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                    if(fullRoadAddr !== ''){
                        fullRoadAddr += extraRoadAddr;
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                    document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
    
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        //예상되는 도로명 주소에 조합형 주소를 추가한다.
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
    
                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
    
                    } else {
                        document.getElementById('guide').innerHTML = '';
                    }
                }
            }).open();
        }
    </script>
    <h1 style="display:none;" id="hidden_title">보그코리아 | 주문조회</h1>
    <!--###############################회원가입:정보입력 시작#################################################################-->
     <!-- 서브메뉴 -->
    <style>
   	 	/* ------------- 서브 컨텐츠 시작 ------------- */
		.sub_content{padding:45px 0 0 45px;float:left;}
		.sub_content:after{display:block; clear:both; content:"";}
		/* ------------- 서브 사이드 영역 ------------- */
		.sub_content .side_cont{float:left; width:200px;}
		/* 서브 사이드 메뉴 */
		.side_cont .sub_menu_box{min-height:250px; padding:0 0 50px 0;}
		.side_cont .sub_menu_box .mypage_title{padding:0 0 14px 10px; border-bottom:1px solid #ececec; font-size:25px;}
		.side_cont .sub_menu_box .sub_menu{margin:7px 0 0 0;}
		.side_cont .sub_menu_box .sub_menu li{padding:1px 0 0 0;}
		.side_cont .sub_menu_box .sub_menu a{display:block; padding:7px 0 6px 10px; font-size:14px;}
		.side_cont .sub_menu_box .sub_menu a:hover,
		.side_cont .sub_menu_box .sub_menu .active{font-weight:bold; background:#f8f8f8; color:#ab3e55;}
		.side_cont .sub_menu_box .sub_menu .sub_depth1{margin:0 0 15px 0;}
		.side_cont .sub_menu_box .sub_menu .sub_depth1 li{}
		.side_cont .sub_menu_box .sub_menu .sub_depth1 a{padding:0 0 0 10px; font-size:12px;}
		
		
		/* 서브메뉴 1뎁스 */
		.sub_menu_box .sub_depth1 > li{}
		.sub_menu_box .sub_depth1 > li > a{display:block; padding:5px 10px 7px 19px; font-size:12px;}
		.sub_menu_box .sub_depth1 > li > a:hover{background:#ab3e55;}
		.sub_menu_box .sub_depth1 > li > a.active{background:#ab3e55;}
		/* 서브메뉴 2,3,4 뎁스 CSS */
		.sub_menu_box .sub_depth1 li{position:relative;}
		.sub_menu_box .sub_depth1 li a{display:block; padding:5px 10px 7px 19px; font-size:12px;}
		.sub_menu_box .sub_depth1 li a:hover{background:#ab3e55;}
		.sub_menu_box .sub_depth1 li a.active{background:#ab3e55;}
		
		/* 서브사이드  마이페이지 */
		.side_cont .sub_menu_box .sub_menu_mypage{margin:7px 0 0 0;}
		.side_cont .sub_menu_box .sub_menu_mypage > li{padding:8px 0 15px 0; font-size:14px; font-weight:bold; background:url('../../img/common/lnb_tit.png') no-repeat top left;}
		.side_cont .sub_menu_box .sub_menu_mypage > li:first-child{margin:30px 0 0 0;}
		.side_cont .sub_menu_box .sub_menu_mypage a{display:block; padding:7px 0 6px 0; font-size:14px;}
		.side_cont .sub_menu_box .sub_menu_mypage a:hover,
		.side_cont .sub_menu_box .sub_menu_mypage .active{font-weight:bold; background:#f8f8f8; color:#ab3e55;}
		.side_cont .sub_menu_box .sub_menu_mypage .sub_depth1{margin:5px 0 25px 0;}
		.side_cont .sub_menu_box .sub_menu_mypage .sub_depth1 li{padding:1px 0 0 0; font-weight:normal;}
		.side_cont .sub_menu_box .sub_menu_mypage .sub_depth1 a{font-size:12px; text-indent:10px;}
	
	
		
    </style>
    <div class="sub_content">
	    <div class="side_cont">
			<div class="sub_menu_box">
			    <div class="mypage_title">마이페이지</div>
			    <ul class="sub_menu_mypage">
			        <li>쇼핑정보
			            <ul class="sub_depth1">
			                <li><a href="vogueKorea.vk?type=orderList">- 주문목록/배송조회</a></li>
			            </ul>
			        </li>
			        <li>회원정보
			            <ul class="sub_depth1">
			                <li><a href="vogueKorea.vk?type=myPageForm">- 회원정보 변경</a></li>
			                <li><a href="#">- 배송지 관리</a></li>
			            </ul>
			        </li>
			        <li>나의 상품문의
			            <ul class="sub_depth1">
			                <li><a href="#">- 나의 상품문의</a></li>
			            </ul>
			        </li>
			        <li>나의 상품후기
			            <ul class="sub_depth1">
			                <li><a href="#">- 나의 상품후기</a></li>
			            </ul>
			        </li>
			    </ul>
			</div>
		</div>
		<!-- //sub_menu_box -->
	</div>
    <!-- 마이페이지 회원 요약정보 -->
    <main>
    	<section class="content_box">
    		<div class="mypage_lately_info">
		        <div class="mypage_zone_tit">
		            <h3>주문목록/배송조회</h3>
		        </div>
		
		        <div class="date_check_box">
		            <form method="get" name="frmDateSearch">
		                <h3> 조회기간 </h3>
		                <div class="date_check_list" data-target-name="wDate[]">
		                    <button type="button" data-value="0">오늘</button>
		                    <button type="button" data-value="7">7일</button>
		                    <button type="button" data-value="15">15일</button>
		                    <button type="button" data-value="30">1개월</button>
		                    <button type="button" data-value="90">3개월</button>
		                    <button type="button" class="oneYear" data-value="365">1년</button>
		                </div>
		                <!-- //date_check_list -->
		                <button type="submit" class="btn_date_check">조회</button>
		            </form>
					
		        </div>
		        <!-- //date_check_box -->
		
		        	<div class="mypage_lately_info_cont">
			           
		            	<!-- 주문상품 리스트 -->
		           		<div class="mypage_table_type">
					    <table>
					        <colgroup>
					            <col style="width:15%"> <!-- 날짜/주문번호 -->
					            <col>					<!-- 상품명/옵션 -->
					            <col style="width:15%"> <!-- 상품금액/수량 -->
					            <col style="width:15%"> <!-- 주문상태 -->
					           
					        </colgroup>
					        <thead>
					        <tr>
					            <th>날짜/주문번호</th>
					            <th>상품명/옵션</th>
					            <th class="PJ_respon_hide">상품금액/수량</th>
					            <th class="PJ_respon_hide">주문상태</th>
					            
					        </tr>
					        </thead>
					        <tbody>
							<c:if test="${empty requestScope.orderList}"> 
						        <tr>
						            <td colspan="6"><p class="no_data">조회내역이 없습니다.</p></td>
						        </tr>
					        </c:if >
					        <c:if test="${not empty requestScope.orderList}">	
					       	 	<c:forEach var="orderList" items="${requestScope.orderList}" varStatus="status">
						        	<tr>
						        		<td><fmt:formatDate value="${orderList.indate}" type="date" pattern="yyyy-MM-dd"/>/${orderList.order_seq}</td>
						        		<td>${orderList.name}/${orderList.content}</td>
						        		<td>${orderList.price}/${orderList.count}</td>
						        		<td>진행중</td>
						        	
						        	</tr>
					        	</c:forEach>
					        </c:if>	
					        </tbody>
					    </table>
					</div>
				</div>
			</div>
    	</section>
    
    </main>
    
    <!--################################################################################################-->

<%@ include file="../footer.jsp"%> <!-- footer삽입 -->