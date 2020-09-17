<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice.css">
	<h1 style="display:none;" id="hidden_title">보그코리아 | 공지사항</h1>
   	<!--#############################공지사항시작###################################################################-->
        <main >
            <section class="content_box">
            <!-- 본문 시작 -->
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>공지사항</h2>
                        </div>
                        <div class="board_zone_cont">
                            <div class="board_zone_list">
                                <table class="board_list_table" style="width:100%">
                                    <colgroup>
                                        <col style="width:10%">
                                        <col style="width:50%;">
                                        <col style="width:15%">
                                        <col style="width:15%">
                                        <col >
                                    </colgroup>
                                    <!--공지사항 헤드-->
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>날짜</th>
                                            <th>작성자</th>
                                            <th>조회</th>
                                        </tr>
                                    </thead>
                                     <!--공지사항 본문-->
                                    <tbody>
                                    	<c:forEach items="${noticeList}" var="notice">
	                                        <tr >
	                                            <td>
	                                                ${notice.nseq}
	                                            </td>
	                                            <td class="board_tit">
	                                                <a href="vogueKorea.vk?type=notice_detail&nseq=${notice.nseq}" >
	                                                    <strong>${notice.subject}</strong>
	                                                </a>
	                                                <!--
	                                                그림과 새로운글 이미지 첨부 기능 추가  
	                                                <img src="/images/icon_board_attach_img.png">
	                                                <img src="/images/icon_board_hot.png">
	                                                -->
	
	                                            </td>
	                                            <td><fmt:formatDate value="${notice.indate}" type="date" pattern="yyyy-MM-dd"/></td>
	                                            <td> ${notice.id} </td>
	                                            <td> ${notice.hit} </td>
	                                        </tr>
                         				</c:forEach>

                                    </tbody>
                                </table>
                                <!--페이지 네비게이션-->
                                <div id="pagination" style="text-align: center; display: inline-block;">
                                    <div id="data-container"></div>
                                    <div id="pagination-container"></div>  
                                </div>
                                <!--검색박스-->
                                <div class="board_search_box">
                                    <form name="frmList" id="frmList" action="#" method="get">
                                        <select class="chosen-select" name="searchField">
                                            <option value="subject">제목</option>
                                            <option value="contents">내용</option>
                                            <option value="writerNm">작성자</option>
                                        </select>
        
                                        <input type="text" class="text" name="searchWord" value="">
                                        <button class="btn_board_search"><i class="fas fa-search"></i></button>
                                    </form>
                                </div>
                                <!-- //board_search_box -->
                            </div>
                        </div>
                        <!-- //board_zone_list -->
    
    
                    </div>
                    <!-- //board_zone_cont -->
                </div>
                <!-- //board_zone_sec -->
                
            </section>
        </main>
        <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->