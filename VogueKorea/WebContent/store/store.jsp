<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/store.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/store.js"></script>
	<h1 style="display:none;" id="hidden_title">보그코리아 | 스토어</h1>
        <!--###############################스토어시작#################################################################-->
        <main id="container">
            <section id="contents">
            <!-- 본문 시작 -->
                <div class="sub_content">
                    <div class="content">
                        <div class="goods_list_item">
                            <div class="goods_list_item_tit">
                                <h2>
                                    Store
                                </h2>
                            </div>
                            <div class="goods_pick_list">
                                <span class="pick_list_num">상품 <strong>
                                </strong> 개</span>
                                <form name="frmList" action="#">
                                    <div class="pick_list_box">
                                        <ul class="device_pc pick_list ">
                                            <li>
                                                <input type="radio" id="sort1" class="radio" name="sort" value="">
                                                <label for="sort1">추천순</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="sort2" class="radio" name="sort" value="">
                                                <label for="sort2">판매인기순</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="sort3" class="radio" name="sort" value="" onclick="sortLI()">
                                                <label for="sort3">낮은가격순</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="sort4" class="radio" name="sort" value="" onclick="reverseLI()">
                                                <label for="sort4">높은가격순</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="sort5" class="radio" name="sort" value="">
                                                <label for="sort5">상품평순</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="sort6" class="radio" name="sort" value="">
                                                <label for="sort6">등록일순</label>
                                            </li>
                                        </ul>
                                        <!-- 상품 개수 별로 보기 -> 나중에
                                        <div class="choice_num_view">
                                            <select class="chosen-select" name="pageNum">
                                                <option value="10"  >10개씩보기</option>
                                                <option value="20"  >20개씩보기</option>
                                                <option value="30"  >30개씩보기</option>
                                                <option value="40"  >40개씩보기</option>
                                            </select>
                                        </div>
                                        -->
                                        <div class="choice_num_view device_mobile" id="PJ_sort_border">
                                            <select class="chosen-select" id="PJ_sort">
                                                <option value="sort1" selected="selected">추천순</option>
                                                <option value="sort2" >판매인기순</option>
                                                <option value="sort3" onclick="sortLI()">낮은가격순</option>
                                                <option value="sort4" onclick="reverseLI()">높은가격순</option>
                                                <option value="sort5" >상품평순</option>
                                                <option value="sort6" >등록일순</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="goods_list">
                                <div class="goods_list_cont">
                                <!-- 상품 리스트 -->
                                    <div class="item_gallery_type">
                                        <ul id="lists">
                                        	<c:forEach items="${productList}" var="product">
	                                            <li style="color:transparent">
	                                                <div class="item_cont">
	                                                    <div class="item_photo_box" >
	                                                        <a href="vogueKorea.vk?type=product&pseq=${product.pseq}" >
	                                                            <img src="${pageContext.request.contextPath}/images/${product.image}" width="300" alt="" title="" class="middle"  />
	                                                        </a>
	                                                    </div>
	                                                    <div class="PJ_good_table">
	                                                        <div class="item_info_cont">
	                                                            
	                                                            <div class="item_tit_box">
	                                                                <a href="vogueKorea.vk?type=product&pseq=${product.pseq}">
	                                                                <strong class="item_name">${product.name}</strong>
	                                                                <span class="item_name_explain">${product.content}</span>
	                                                                </a>
	                                                            </div>
	                                                            <!-- //item_tit_box -->
	                                                            <div class="item_money_box">
	                                                                <del>${product.price}</del>
	                                                                <strong class="item_price">
	                                                                    <span>${product.price}</span>
	                                                                </strong>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </li>
	                                        </c:forEach>
                                        </ul>
                                        <!--리스트정렬하기-->
                                        <script type="text/javascript">
                                            var myUL = document.getElementById( "lists" ); 
                                            var replace = replacement( myUL ); 
                                            function sortLI(){  replace.ascending();  } 
                                            function reverseLI(){  replace.descending();  } 
                                        </script>
                                    </div>
                                </div>
                            </div>
                            <!--페이지 네비게이션-->
                            <div id="pagination">
                                <div id="data-container"></div>
                                <div id="pagination-container"></div>  
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //sub_content -->
            
            </section>
        </main>
        <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->