<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/payment.js"></script>
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
	<script>
    	/*가격처리하기*/
    	function priceFunc(){
	    	var sum=0;
	    	var total=0;
	 		for(var i = 0; i<$(".view_count").length; i++){
	 			
	 			var price = parseInt($(".product_price").eq(i).text());
	 		    var count = parseInt($(".goods_num").eq(i).text());
	 	 			   
	 		   	sum = price * count;  
	 	 		total += sum;
	 	 		
	 	 		$(".sum_price").eq(i).text(sum);
	 	 		$("#totalGoodsPrice").text(total);
	 	 		$(".totalSettlePrice").text(total);
	 	 		
	 		}
		   
    	}
    	
    	
    	$(function(){
		   $("#totalGoodsCnt").text($(".view_count").length);//개수
		   priceFunc();
		   
		});
    </script>
	<h1 style="display:none;" id="hidden_title">보그코리아 | 결제페이지</h1>
        <!--############################################주문서시작#################################################################-->
        <main>
            <section class="content_box">
                <!--location navigation-->
                <div class="order_tit">
                    <h2>주문서작성/결제</h2>
                    
                    <ol>
                        <li><span>01</span> 장바구니 ></li>
                        <li  class="page_on"><span>02</span> 주문서작성/결제 ></li>
                        <li><span>03</span> 주문완료</li>
                    </ol>
                </div>
                <!-- 본문 시작 -->
                <form id="form_order" name="form_order" action="" method="post">
                    <div class="order_wrap">
                        
                        <div class="order_cont">
            
                            <div class="cart_cont_list">
                                <div class="order_cart_tit">
                                    <h3>주문상세내역</h3>
                                </div>
                                <div class="order_table_type">
                                    <!-- 장바구니 상품리스트 시작 -->
                                    <table>
                                        <colgroup>
                                            <col>					<!-- 상품명/옵션 -->
                                            <col style="width:5%">  <!-- 수량 -->
                                            <col style="width:10%"> <!-- 상품금액 -->
                                            <col style="width:13%"> <!-- 할인/적립 -->
                                            <col style="width:10%"> <!-- 합계금액 -->
                                            <col style="width:10%"> <!-- 배송비 -->
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>상품/옵션 정보</th>
                                            <th>수량</th>
                                            <th class="PJ_respon_hide">상품금액</th>
                                            <th class="PJ_respon_hide">할인/적립</th>
                                            <th class="PJ_respon_hide">합계금액</th>
                                            <th class="PJ_respon_hide">배송비</th>
                                        </tr>
                                        </thead>
                                        <tbody>
            
            								<c:forEach var="paymentList" items="${requestScope.paymentList}" varStatus="status">
		                                        <tr class="view_count">
		                                            <td class="td_left">
		                                                <div class="pick_add_cont">
		                                                    <span class="pick_add_img">
		                                                        <a href="vogueKorea.vk?type=product&pseq=${paymentList.pseq}"><img src="${pageContext.request.contextPath}/images/${paymentList.image}" width="40" alt="" class="middle" class="imgsize-s"/></a>
		                                                    </span>
		                                                    <div class="pick_add_info">
		                                                        <em>${paymentList.name}</em>
		                                                        <div class="pick_option_box">
		                                                            <span class="text_type_cont">${paymentList.content}</span>
		                                                        </div>
		                                                        <div class="pick_option_box">
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                                <!-- //pick_add_cont -->
		            
		                                                <!-- //pick_add_list -->
		            
		                                            </td>
		                                            <td class="td_order_amount">
		                                                <div class="order_goods_num">
		                                                    <strong class="goods_num">${paymentList.count}</strong>
		                                                </div>
		                                            </td>
		                                            <td class="PJ_respon_hide">
		                                                <strong class="order_sum_txt price product_price">${paymentList.price}</strong>
		                                            </td>
		                                            <td class="td_benefit PJ_respon_hide">
		                                                <ul class="benefit_list">
		                                                </ul>
		                                            </td>
		                                            <td class="PJ_respon_hide">
		                                                <strong class="order_sum_txt sum_price"></strong>
		                                            </td>
		                                            <td class="td_delivery PJ_respon_hide" rowspan="1">
		                                                기본
		                                               
		                                            </td>
		                                        </tr>
                                        
            
            								</c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- 장바구니 상품리스트 끝 -->
                                </div>
            
                            </div>
                            <!-- //cart_cont_list -->
            
                            <div class="btn_left_box">
                                <a href="vogueKorea.vk?type=shopping_cart" class="shop_go_link"><em>&lt; 장바구니 가기</em></a>
                            </div>
            
                            <div class="price_sum">
                                <div class="price_sum_cont">
                                    <div class="price_sum_list">
                                        <dl>
                                            <dt>총 <strong id="totalGoodsCnt"></strong> 개의 상품금액 </dt>
                                            <dd><strong id="totalGoodsPrice">12,345원</strong>원</dd>
                                        </dl>
                                        <span>+</span>
                                        <dl>
                                            <dt>배송비</dt>
                                            <dd><strong>0</strong>원</dd>
                                        </dl>
                                        <span>=</span>
                                        <dl class="price_total">
                                            <dt>합계</dt>
                                            <dd><strong class="totalSettlePrice">12,345원</strong>원
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                                <!-- //price_sum_cont -->
                            </div>
                            <!-- //price_sum -->
            
            
                            <div class="order_view_info">
            
            
                                <div class="order_info">
                                    <div class="order_zone_tit">
                                        <h4>주문자 정보</h4>
                                    </div>
            
                                    <div class="order_table_type">
                                        <table class="table_left">
                                            <colgroup>
                                                <col style="width:15%;">
                                                <col style="width:85%;">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row"><span class="important">주문하시는 분</span></th>
                                                <td><input type="text" name="order_name" value="" id="orderName"maxlength="20"/></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <span class="important">휴대폰 번호</span>
                                                </th>
                                                <td>
                                                    <input type="text" id="mobileNum" name="order_phone" value="" class="phoneNumber" maxlength="14" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="important">이메일</span></th>
                                                <td class="member_email">
                                                    <input type="text" name="order_mail"id="orderEmail" value="" />
            
                                                    <select id="emailDomain" class="chosen-select">
                                                        <option value="self">직접입력</option>
                                                        <option value="naver.com">naver.com</option>
                                                        <option value="daum.net">daum.net</option>
                                                        <option value="nate.com">nate.com</option>
                                                        <option value="gmail.com">gmail.com</option>
                                                        <option value="icloud.com">icloud.com</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- //order_info -->
            
                                <div class="delivery_info">
                                    <div class="order_zone_tit">
                                        <h4>배송정보</h4>
                                    </div>
            
                                    <div class="order_table_type shipping_info">
                                        <table class="table_left shipping_info_table">
                                            <colgroup>
                                                <col style="width:15%;">
                                                <col style="width:85%;">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row">배송지 확인</th>
                                                <td>
                                                    <div class="form_element">
                                                        <ul>
                                                            <li>
                                                                <input type="radio" name="shipping" id="shippingBasic"checked>
                                                                <label for="shippingBasic" class="choice_s">기본 배송지</label>
                                                            </li>
                                                            <li>
                                                                <input type="radio" name="shipping" id="shippingRecently">
                                                                <label for="shippingRecently" class="choice_s">최근 배송지</label>
                                                            </li>
                                                            <li>
                                                                <input type="radio" name="shipping" id="shippingNew">
                                                                <label for="shippingNew" class="choice_s">직접 입력</label>
                                                            </li>
                                                            <li>
                                                                <input type="radio" name="shipping" id="shippingSameCheck"onclick="Copy();"
                                                                >
                                                                <label for="shippingSameCheck" class="choice_s">주문자정보와 동일</label>
                                                            </li>
                                                        </ul>
                                                        <a href="#" class=" btn_open_layer "><span>배송지 관리</span></a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="important">받으실분</span>
                                                </th>
                                                <td><input type="text" name="re_name"id="receiverName"   maxlength="20"/></td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="important">받으실 곳</span></th>
                                                <td class="member_address">
                                                    <input type="text" id="sample4_postcode"readonly="readonly" placeholder="우편번호">
                                                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                                    <input type="text" id="sample4_roadAddress"readonly="readonly" placeholder="주소" name="re_address">
                                                    
                                                    <input type="text" id="sample4_detailAddress" placeholder="상세주소">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row"><span class="important">휴대폰 번호</span>
                                                </th>
                                                <td>
                                                    <input type="text" id="receiverCellPhone" name="re_phone"class="phoneNumber" maxlength="14"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">남기실 말씀</th>
                                                <td class="td_last_say"><input type="text" name="re_comment"/></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- //delivery_info -->
            
                                <!-- //addition_info -->
            
                                <div class="payment_info">
                                    <div class="order_zone_tit">
                                        <h4>결제정보</h4>
                                    </div>
            
                                    <div class="order_table_type">
                                        <table class="table_left">
                                            <colgroup>
                                                <col style="width:15%;" >
                                                <col style="width:85%;">
                                                
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row">상품 합계 금액</th>
                                                <td>
                                                    <strong id="totalGoodsPrice" class="order_payment_sum totalSettlePrice">12,345</strong>원
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">배송비</th>
                                                <td>
                                                    <span id="totalDeliveryCharge">0</span>원
                                                    <span class="multi_shipping_text"></span>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <th scope="row">최종 결제 금액</th>
                                                <td>
                                                    <strong id="totalSettlePrice" class="order_payment_sum totalSettlePrice">12,345</strong>원
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- //payment_info -->
            
                                <div class="payment_progress">
                                    <div class="order_zone_tit">
                                        <h4>결제수단 선택 / 결제</h4>
                                        <p class="js_pay_content">※ 고객님은 안전거래를 위해 현금으로 결제시 저희 쇼핑몰에서 가입한 구매안전서비스인 NHN KCP의 구매안전(에스크로)서비스를 이용하실 수 있습니다.</p>
                                    </div>
            
                                    <div class="payment_progress_list">
                                        <div class="js_pay_content">
            
                                            <!-- N : 일반결제 시작 -->
                                            <div id="settlekind_general" class="general_payment">
                                                <dl>
                                                    <dt>일반결제</dt>
                                                    <dd>
                                                        <div class="form_element">
                                                            <ul class="payment_progress_select">
                                                                <li id="settlekindType_gb">
                                                                    <input type="radio" id="settleKind_gb" name="settleKind" value="gb"/>
                                                                    <label for="settleKind_gb" class="choice_s">무통장 입금</label>
                                                                </li>
                                                                <li id="settlekindType_pc">
                                                                    <input type="radio" id="settleKind_pc" name="settleKind" value="pc"/>
                                                                    <label for="settleKind_pc" class="choice_s">신용카드</label>
                                                                </li>
                                                                <li id="settlekindType_pb">
                                                                    <input type="radio" id="settleKind_pb" name="settleKind" value="pb"/>
                                                                    <label for="settleKind_pb" class="choice_s">계좌이체</label>
                                                                </li>
                                                                <li id="settlekindType_pv">
                                                                    <input type="radio" id="settleKind_pv" name="settleKind" value="pv"/>
                                                                    <label for="settleKind_pv" class="choice_s">가상계좌</label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                            <!-- //general_payment -->
                                            <!-- N : 일반결제 끝 -->
            
                                            <!-- N : 에스크로결제 시작 -->
                                            <div id="settlekind_escrow" class="escrow_payment">
                                                <dl>
                                                    <dt>에스크로결제</dt>
                                                    <dd>
                                                        <div class="form_element">
                                                            <ul class="payment_progress_select">
                                                                <li>
                                                                    <input type="radio" name="settleKind" id="settleKind_ec" value="ec">
                                                                    <label for="settleKind_ec" class="choice_s">신용카드</label>
                                                                </li>
                                                                <li>
                                                                    <input type="radio" name="settleKind" id="settleKind_eb" value="eb">
                                                                    <label for="settleKind_eb" class="choice_s">계좌이체</label>
                                                                </li>
                                                                <li>
                                                                    <input type="radio" name="settleKind" id="settleKind_ev" value="ev">
                                                                    <label for="settleKind_ev" class="choice_s">가상계좌</label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                            <!-- //escrow_payment -->
                                            <!-- N : 에스크로결제 끝 -->
                                        </div>
                                    </div>
                                    <!-- //payment_progress_list -->
                                    <div class="payment_final">
                                        <div class="payment_final_total">
                                            <dl>
                                                <dt>최종 결제 금액</dt>
                                                <dd><span><strong id="totalSettlePriceView" class="totalSettlePrice">12,345</strong>원</span></dd>
                                            </dl>
                                        </div>
                                        <div class="payment_final_check">
                                            <div class="form_element">
                                                <input type="checkbox" id="chkAgree" >
                                                <label for="termAgree_orderCheck" class="check_s"><b>(필수)</b> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                                            </div>
                                        </div>
                                        <div class="btn_center_box">
                                            <a href="#"onclick="this.href=pay_complete()"><button type="button"class="btn_order_buy">결제하기</button></a>
                                        </div>
                                    </div>
                                    <!-- //payment_final -->
            
                                </div>
                                <!-- //payment_progress -->
            
                            </div>
                            <!-- //order_view_info -->
                        </div>
                        <!-- //order_cont -->
                    </div>
                    <!-- //order_wrap -->
                </form>
            </section>
        </main>
        <!--################################################################################################-->
        <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->