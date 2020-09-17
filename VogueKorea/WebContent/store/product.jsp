<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/goods.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/goods.js"></script>
	<h1 style="display:none;" id="hidden_title">보그코리아 | 스토어</h1>
        <!--###############################상품상세페이지시작#################################################################-->
        <main class="content_box">
            <!-- 상품 상단 -->
            <section class="item_photo_info_sec">
                <!--사진영역-->
                <div class="item_photo_view_box">
                    <div class="item_photo_view">
                        <div class="item_photo_big">
                            <span class="img_photo_big"  id="mainImage" class="zoom_layer_open btn_open_layer">
                            <img src="${pageContext.request.contextPath}/images/${product.image}" width="500" alt="지큐 정기구독" title="지큐 정기구독" class="middle"  /></span>
                        </div>
                        <!-- //item_photo_big -->
                    </div>
                    <!-- //item_photo_view -->
                </div>
                <!-- //item_photo_view_box -->
                <!--옵션선택 영역-->
                <form name="frmView" id="frmView" method="post">
                    <div class="item_info_box">
                        <div class="item_detail_tit">
                            <h3>${product.name}</h3>
                        </div>
                        <div class="item_detail_list">
                            <dl>
                                <dt>설명</dt>
                                <dd>${product.content}</dd>
                            </dl>
                            <dl class="item_price">
                                <dt>판매가</dt>
                                <dd>
                                    <strong><strong>${product.price}</strong></strong>원
                                </dd>
                            </dl>
                            <dl class="item_delivery">
                                <dt>배송비</dt>
                                <dd>
                                    <strong>무료</strong>
                                </dd>
                            </dl>
                            <!--옵션선택박스-->
                            <div class="item_add_option_box">
                                <dl>
                                    <dt>수량 선택</dt>
                                    <dd><input type="number" name="optionSnoInput" value="1"  min="1" max="100">개</dd>
                                    <!--  
                                    <dd>
                                        <select name="optionSnoInput" class="chosen-select" onchange="">
                                        <option value="">
                                            =옵션: 가격=
                                        </option>
                                        <option   value="1">
                                        1월 호부터
                                        </option>
                                        <option   value="2">
                                        2월 호부터
                                        </option>
                                        </select>
                                    </dd>
                                    -->
                                </dl>
                            </div>
                            <!-- //item_add_option_box -->
                        </div>
                        <!-- //item_detail_list -->
                        
                        <!--옵션 클릭시 생성-->
                        <!--
                        <div class="option_total_display_area item_choice_list">
                            <table class="option_display_area" border="0" cellpadding="0" cellspacing="0">
                                <colgroup>
                                    <col width="330px">
                                    <col>
                                    <col width="80px">
                                    <col width="40px">
                                </colgroup>
                            </table>
                            <div class="item_price_cont">
                                <div class="end_price item_tatal_box" style="display:none">
                                    <dl class="total_goods">
                                        <dt>총 상품금액</dt>
                                        <dd><strong class="goods_total_price"></strong></dd>
                                    </dl>
                                    <dl class="total_discount">
                                        <dt>총 할인금액</dt>
                                        <dd><strong class="total_benefit_price"></strong></dd>
                                    </dl>
                                    <dl class="total_amount">
                                        <dt>총 합계금액</dt>
                                        <dd><strong class="total_price"></strong></dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                        -->
                        <!--//옵션 클릭시 생성-->
                        <div class="btn_choice_box">
                            <div >
                            <a href="javascript:optionCheck_toShoppingCart('${product.pseq}');"><button type="button" class="btn_add_cart">장바구니</button></a>
                            <a href="javascript:optionCheck_toPayment('${product.pseq}');"><button type="button" class="btn_add_order">바로 구매</button></a>
                            <!-- <a href="#" onclick="this.href= optionCheck_toPayment()"><button type="button" class="btn_add_order">바로 구매</button></a> -->
                        </div>
                        <!-- //btn_choice_box -->
                    </div>
                    <!-- //item_info_box -->
                </form>
            </section>
            <!-- //item_photo_info_sec -->
            <!-- //상품 상단 끝 -->
            <!-- 상품상세 -->
            <div class="item_goods_sec">
                <div id="detail">
                    <div class="item_goods_tab">
                        <ul>
                            <li class="on"><a href="#detail">상세정보</a></li>
                            <li><a href="#delivery">배송안내</a></li>
                            <li><a href="#exchange">교환/반품안내</a></li>
                            <li><a href="#reviews">상품후기</a></li>
                            <li><a href="#qna">상품문의</a></li>
                        </ul>
                    </div>
                    <!-- //item_goods_tab -->
                    <div class="detail_cont">
                        <h3>상세정보</h3>
                        <div class="detail_explain_box">
                            <div class="image_manual"><img src="${pageContext.request.contextPath}/images/${product.detail}"></div>
                            <div class="txt-manual">
                            </div>
                        </div>
                        <!-- //detail_explain_box -->
                    </div>
                    <!-- //detail_cont -->
                </div>
                <!-- //#detail -->
                <div id="delivery">
                    <div class="item_goods_tab">
                        <ul>
                            <li><a href="#detail">상세정보</a></li>
                            <li class="on"><a href="#delivery">배송안내</a></li>
                            <li><a href="#exchange">교환/반품안내</a></li>
                            <li><a href="#reviews">상품후기 </a></li>
                            <li><a href="#qna">상품문의</a></li>
                        </ul>
                    </div>
                    <!-- //item_goods_tab -->
                    <div class="delivery_cont">
                        <h3>배송안내</h3>
                        <div class="admin_msg"><p><span><strong>1. 배송비는 무료 입니다.</strong></span></p><p><span ><strong>&nbsp;</strong></span></p><p><span ><strong>2. 매월20일이후 새 월간호가 출간이 되며 20일~23일 사이에 배송이 시작 됩니다.</strong></span></p><p><span><strong>&nbsp;</strong></span></p><p><span><strong>3. 배송지 변경은 매월 15일 이전 게시판 또는 전화, 카톡으로 연락해주세요.</strong></span></p><p><span><strong>&nbsp;</strong></span></p></div>
                    </div>
                    <!-- //delivery_cont -->
                </div>
                <!-- //#delivery -->
                <div id="exchange">
                    <div class="item_goods_tab">
                        <ul>
                            <li><a href="#detail">상세정보</a></li>
                            <li><a href="#delivery">배송안내</a></li>
                            <li class="on"><a href="#exchange">교환/반품안내</a></li>
                            <li><a href="#reviews">상품후기</a></li>
                            <li><a href="#qna">상품문의</a></li>
                        </ul>
                    </div>
                    <!-- //item_goods_tab -->
                    <div class="exchange_cont">
                        <h3>교환/반품안내</h3>
                        <div class="admin_msg">
                            <p><span style="font-size: 12pt;"><strong>잡지의 불량인쇄, 파본의 경우 무료로 교환 해드립니다.&nbsp;</strong></span></p>
                        </div>
                        <h3>환불안내</h3>
                        <div class="admin_msg">
                            <p><span style="font-size: 12pt;"><strong>1. 구독중 취소 : 환불금액 = 정기구독료 - (발송된 잡지정가 + 발송된 택배비)</strong></span></p><p><span style="font-size: 12pt;"><strong>&nbsp;예) 보그1년정기구독 중 6개월 구독후 취소 : 62,400원 - {(6,500원*6개월)+(2,500원*6회)} = 8,400원 환불금액</strong></span></p><p><span style="font-size: 12pt;"><strong>&nbsp;</strong></span></p><p><span style="font-size: 12pt;"><strong>2. 사은품 이벤트 정기구독 취소 : 미개봉상태 또는&nbsp;사용흔적이 없으며 판매가치에 문제가 없다고 보여지는 사은품을 반납 하셔야 구독취소가 가능합니다.</strong></span></p><p><span style="font-size: 12pt;"><strong>&nbsp;</strong></span></p><p><span style="font-size: 12pt;"><strong>3. 이미 받은책에 대해서는 환불이 불가 합니다. &nbsp;</strong></span></p>
                        </div>
                    </div>
                    <!-- //exchange_cont -->
                </div>
                <!-- //#exchange -->
                <div id="reviews">
                    <div class="item_goods_tab">
                        <ul>
                            <li><a href="#detail">상세정보</a></li>
                            <li><a href="#delivery">배송안내</a></li>
                            <li><a href="#exchange">교환/반품안내</a></li>
                            <li class="on"><a href="#reviews">상품후기</a></li>
                            <li><a href="#qna">상품문의</a></li>
                        </ul>
                    </div>
                    <!-- //item_goods_tab -->
            
            
                    <div class="reviews_cont">
                        <h3>상품후기</h3>
                        <div id="goodsreview-list">
                            <form id="goodsreview" name="goodsreview" method="#" target="">
                                <p class="no_data">등록된 게시글이 없습니다.</p>
                            </form>
                        </div>
                        <button class="btn_reviews_box">
                            상품 후기 글쓰기
                        </button>
                        <!-- //btn_reviews_box -->
                    </div>
                    <!-- //reviews_cont -->
                </div>
                <!-- //#reviews -->
                <div id="qna">
                    <div class="item_goods_tab">
                        <ul>
                            <li><a href="#detail">상세정보</a></li>
                            <li><a href="#delivery">배송안내</a></li>
                            <li><a href="#exchange">교환/반품안내</a></li>
                            <li><a href="#reviews">상품후기</a></li>
                            <li class="on"><a href="#qna">상품문의 </a></li>
                        </ul>
                    </div>
                    <!-- //item_goods_tab -->
                    <div class="qna_cont">
                        <h3>상품Q&amp;A</h3>
                        <div id="goodsqa-list">
                            <form id="goodsqa" name="goodsqa" method="#" target="">
                                <p class="no_data">등록된 게시글이 없습니다.</p>
                            </form>
                        </div>
                        <button class="btn_qna_box">상품 문의 글쓰기
                        </button>
                        <!-- //btn_qna_box -->
                    </div>
                    <!-- //qna_cont -->
                </div>
                <!-- //qna -->
            </div>
            <!-- //item_goods_sec -->
            <!-- //상품상세 끝 -->       
        </main>
        <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->