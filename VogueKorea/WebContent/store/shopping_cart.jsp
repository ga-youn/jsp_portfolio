<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shopping_cart.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/goods.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/shopping_cart.js"></script>
    <script type="text/javascript">
        
    	/*전체 체크박스 클릭시 전체선택, 전체취소*/
        function allCheckNCancel(){
            var allchk = document.getElementById("allCheck");//전체체크하기 객체변수
            var allCheckBox = document.getElementsByClassName("checkbox");//전체체크박스들의 개수 객체변수
            
            for(var i = 0; i < allCheckBox.length; i++){       
                if(allchk.checked == true){
                    allCheckBox[i].checked = true;//전체체크박스 체크
                   
                }
                else{
                    allCheckBox[i].checked = false;//전체체크박스 체크해제
                   
                }

            }
            console.log(allchk.checked);
        }
        /*전체 선택이 아닐 때 전체체크박스 버튼 해제*/
        function memberAllClick(){
            var allchk = document.getElementById("allCheck");//전체체크하기 객체변수
            var allCheckBox = document.getElementsByName("cartSno");//하위체크박스들의 개수 객체변수
            
            for(var i=0; i<allCheckBox.length; i++){
                if(allCheckBox[i].checked == true){
                    allchk.checked = true; //전체체크박스 클릭
                }
                else{
                    allchk.checked = false;//전체체크박스 클릭안함
                }
            }
            
        }
    </script>
    <script>
    	/*가격처리하기*/
    	function priceFunc(){
	    	var sum=0;
	    	var total=0;
	 		for(var i = 0; i<$(".view_count").length; i++){
	 			
	 			var price = parseInt($(".product_price").eq(i).text());
	 		    var count = parseInt($(".goods_num").eq(i).val());
	 	 			   
	 		   	sum = price * count;  
	 	 		total += sum;
	 	 		
	 	 		$(".sum_price").eq(i).text(sum);
	 	 		$("#totalGoodsPrice").text(total);
	 	 		$("#totalSettlePrice").text(total);
	 	 		
	 		}
		   
    	}
    	
    	
    	$(function(){
		   $("#totalGoodsCnt").text($(".view_count").length);//개수
		   $(".goods_num").bind("change",function(){
			   priceFunc();
		   });
		   priceFunc();
		   
		});
    </script>
    <script>
    	/*장바구니삭제*/
    	function checkDel() {
		  var chkFirList = document.getElementsByName('cartSno');
		  var arrFir = new Array();
		  var cnt = 0;
		  for ( var idx = chkFirList.length - 1; 0 <= idx; idx--) {
		   if (chkFirList[idx].checked) {//체크된 값 넣기
		    arrFir[cnt] = chkFirList[idx].value;
		    cnt++;
		   }
		  }
		  if (arrFir.length != 0) {
			document.frmCart.action = "vogueKorea.vk?type=delete_cart";
		   	document.frmCart.submit();
		  } else {
		   alert('선택한 상품이 없습니다.');
		   return;
		  }
		}
    	/*장바구니 수량변경*/
    	function changeQty(cseq, count){
    		//var change_btn = document.getElementById('change_btn');
    		//var parent = change_btn.parentNode;
    		//var count = parent.firstChild.value;
    		location.href="vogueKorea.vk?type=change_cart&cseq="+cseq+"&count="+count;

    	}
    	$(function(){
 		 
 		   $(".change_btn").bind("click",function(){
 			  var grand = $(this).parent().parent().parent();
 			  console.log(parent);
 			  var parent = $(this).parent();
 			  var count = parent.find(".goods_num").val();
 			  var cseq = grand.find(".checkbox").val();
 			  console.log(count);
 			  console.log(cseq);
 			  changeQty(cseq, count);
 		   });
 		   
 		   
 		});
 	
    </script>
	<h1 style="display:none;" id="hidden_title">보그코리아 | 장바구니</h1>
        <!--###############################장바구니시작#################################################################-->
        <main>
            <section class="content_box">
                
                <!--location navigation-->
                <div class="order_tit">
                    <h2>장바구니</h2>
                    <ol>
                        <li class="page_on"><span>01</span> 장바구니 ></li>
                        <li><span>02</span> 주문서작성/결제 ></li>
                        <li><span>03</span> 주문완료</li>
                    </ol>
                </div>
                <!-- 본문 시작 -->
                <div class="order_wrap">
                    <div class="cart_cont">
                        <form id="frmCart" name="frmCart" method="post" target="">
	                       
							<c:if test="${empty requestScope.cartList}"> 
	                            <p class="no_data">장바구니에 담겨있는 상품이 없습니다.</p>
	                       	</c:if >
							<c:if test="${not empty requestScope.cartList}">		
	                            <!-- 장바구니 상품리스트 시작 -->
	                            <div class="cart_cont_list">
	                                <div class="order_table_type">
	                                    <table>
	                                        <colgroup>
	                                            <col style="width:5%">  <!-- 체크박스 -->
	                                            <col>					<!-- 상품명/옵션 -->
	                                            <col style="width:10%">  <!-- 수량 -->
	                                            <col style="width:10%"> <!-- 상품금액 -->
	                                            <col style="width:13%"> <!-- 할인/적립 -->
	                                            <col style="width:10%"> <!-- 합계금액 -->
	                                            <col style="width:10%"> <!-- 배송비 -->
	                                        </colgroup>
	                                        <thead>
	                                            <tr>
	                                                <th>
	                                                    <div class="form_element">
	                                                        <input type="checkbox" id="allCheck" class="gd_select_all_goods checkbox"onclick="allCheckNCancel()">
	                                                        <label for="allCheck" ></label>
	                                                    </div>
	                                                </th>
	                                                <th>상품/옵션 정보</th>
	                                                <th>수량</th>
	                                                <th class="PJ_respon_hide">상품금액</th>
	                                                <th class="PJ_respon_hide">할인/적립</th>
	                                                <th class="PJ_respon_hide">합계금액</th>
	                                                <th class="PJ_respon_hide">배송비</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        <c:forEach var="cartList" items="${requestScope.cartList}" varStatus="status">
		                                        <tr class="view_count">
		                                            <td class="td_chk">
		                                                <div class="form_element">
		                                                    <input type="checkbox" id="cartSno1" name="cartSno" value="${cartList.cseq}" class="checkbox" onclick="memberAllClick()" >
		                                                    <label for="cartSno1" ></label>
		                                                </div>
		                                            </td>
		                                            <td class="td_left">
		                                                <div class="pick_add_cont">
		                                                    <span class="pick_add_img">
		                                                        <a href="vogueKorea.vk?type=product&pseq=${cartList.pseq}" width="40" alt="상품" title="상품" class="middle" class="imgsize-s"><img src="${pageContext.request.contextPath}/images/${cartList.image}"></a>
		                                                    </span>
		                                                    <div class="pick_add_info"><em><a href="vogueKorea.vk?type=product&pseq=${cartList.pseq}">${cartList.name}</a></em>
		                                                    </div>
		                                                </div>
		                                                <!-- //pick_add_cont -->
		                    
		                                                <!-- //pick_add_list -->
		                                            </td>
		                                            <td class="td_order_amount">
		                                                <div class="order_goods_num">
		                                                    <input class="goods_num" type="number" min="1" max="100" name="goods_num" style="text-align:right; width:40px;" value="${cartList.count}"> 
		                                                    
		                                                    <input type="button" class="change_btn" value="수정">
		                                                </div>
		                                            </td>
		                                            <td class="PJ_respon_hide">
		                                                <strong class="order_sum_txt price product_price">${cartList.price}</strong>
		                                                <p class="add_currency"></p>
		                                            </td>
		                                            <td > x </td>
		                                            <td class="PJ_respon_hide">
		                                                <strong class="order_sum_txt price sum_price"></strong>
		                                                <p class="add_currency"></p>
		                                            </td>
		                                            <td class="td_delivery  PJ_respon_hide" rowspan="1">
		                                                기본 - 배송비<br/>
		                                                무료배송
		                    
		                                                <br/>
		                                                (택배)
		                                            </td>
		                                        </tr>
	                    					</c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>
	                    
	                            </div>
	                       	</c:if>
                        </form>
                        <div class="btn_left_box">
                            <a href="vogueKorea.vk?type=store" class="shop_go_link"><em>&lt; 쇼핑 계속하기</em></a><!--이전페이지-->
                        </div>
                        <div class="price_sum">
                            <div class="price_sum_cont">
                                <div class="price_sum_list">
                                    <dl>
                                        <dt>총 <strong id="totalGoodsCnt">0</strong> 개의 상품금액 </dt>
                                        <dd><strong id="totalGoodsPrice">0</strong>원</dd>
                                    </dl>
                                
                                    <dl>
                                        <dt>배송비</dt>
                                        <dd><strong id="totalDeliveryCharge">0</strong>원</dd>
                                    </dl>
                                    
                                    <dl class="price_total">
                                        <dt>합계</dt>
                                        <dd><strong id="totalSettlePrice">0</strong>원
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <!-- //price_sum_cont -->
                        </div>
                        <!-- //price_sum -->
        
                    </div>
                    <!-- //cart_cont -->
                </div>
                <!-- //order_wrap -->
                <div class="btn_order_box">
                    <span class="btn_left_box">
                        <button type="button" class="btn_order_choice_del" onclick="checkDel();">선택 상품 삭제</button>
                    </span>
                    <span class="btn_right_box">
                        <a href="javascript:optionCheck_toPayment();"><button type="button" class="btn_order_choice_buy" >선택 상품 주문</button>
                        </a>
                        <a href="javascript:allCheck_toPayment();"><button type="button" class="btn_order_whole_buy" >전체 상품 주문</button></a>
                    </span>
                </div>
            <!-- //btn_order_box -->
            </section>
        <!-- //본문 끝 contents -->
        </main>
       
        <!---------------------------------------//장바구니---------------------------------------->
        <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->