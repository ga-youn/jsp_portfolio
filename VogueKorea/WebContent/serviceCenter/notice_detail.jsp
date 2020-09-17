<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice.css">
	<h1 style="display:none;" id="hidden_title">보그코리아 | 공지사항</h1>
   
        <!--#############################공지사항 상세 페이지 시작###################################################################-->
        <main >
            <section class="content_box">
            <!-- 본문 시작 -->
                <div class="content">
                    <div class="board_detail_sec">
                        <div class="board_zone_tit">
                            <h2>공지사항</h2>
                        </div>
                        <div class="board_detail_cont">
                            <div class="board_detail_list">
                                <table class="board_list_table" style="width:100%">
                                    <colgroup><!--행 1개-->
                                        <col style="width:100%">
                                    </colgroup>
                                    <!--공지사항헤더-->
                                    <thead>
                                        <tr>
                                            <th>${notice.subject}</th>
                                        </tr>
                                        <tr>
                                            <th>
                                                ${notice.id}
                                                <span><fmt:formatDate value="${notice.indate}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                                                <span class="view_point">조회수 ${notice.hit}</span>
                                                
                                            </th>
                                        </tr>
                                    </thead>
                                    <!--공지사항본문내용-->
                                    <tbody>
                                        <tr >
                                            <td>
                                                ${notice.content}
                                            </td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--목록 버튼-->
                        <a href="vogueKorea.vk?type=notice" class="list_btn">
                            <buttom>목록</buttom>
                        </a>
                        <!-- //board_zone_list -->
    
    
                    </div>
                    <!-- //board_zone_cont -->
                </div>
                <!-- //board_zone_sec -->
                
            </section>
        </main>
        <!--################################################################################################-->
<%@ include file="../footer.jsp"%> <!-- footer삽입 -->