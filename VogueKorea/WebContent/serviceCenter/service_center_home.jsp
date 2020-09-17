<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/service_center.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/service_center.js"></script>
	<h1 style="display:none;" id="hidden_title">보그코리아 | 고객센터</h1>
        <!--#############################고객센터_홈###################################################################-->
        <main >
            <!--상단 section 자주묻는 질문 검색-->
            <section class="content_box">
                <form name="frmList" id="frmList" action="#" method="#">
                    <div class="date_faq_list">
                        <h2>자주묻는 질문 검색</h2>
                        <input type="text" name="searchWord" class="text" placeholder="검색어를 입력하세요"/>
                        <button type="button" class="search_button">검색</button>
                    </div>
                    <div class="date_faq_txt">
                        <p><strong>찾으시는 질문이 없다면?</strong></p>
                        <button>1대1 문의하기</button>
                    </div>
                </form>
            </section>
            <!--중단 section 자주묻는 질문-->
            <section class="content_box">
                <div class="faq_tit">
                    <h3>BEST FAQ</h3>
                </div>
                <div class="board_list_faq">
                    <div class="board_hot_list">
                        <ul>
                            <li class="on"><a href="#"><span>전체</span></a></li>
                            <li ><a href="#"><span>회원가입/정보</span></a></li>
                            <li ><a href="#"><span>결제/배송</span></a></li>
                            <li ><a href="#"><span>교환/반품/환불</span></a></li>
                            <li ><a href="#"><span>마일리지 적립</span></a></li>
                            <li ><a href="#"><span>기타</span></a></li>
                        </ul>
                    </div>
                    <table id="faqList" class="board_list_table" align="center">
                        <colgroup>
                            <col style="width:10%">
                            <col style="width:15%">
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>분류</th>
                                <th>내용</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="toggle_faq" data-sno="5">
                                <td>5</td>
                                <td>기타</td>
                                <td class="board_tit">
                                    <span class="icon_qan"><img src="${pageContext.request.contextPath}/images/icon_qna_q.png" alt="질문제목"></span>
                                    <strong class="btnView">정기구독권 구매</strong>
                                    <p> 
                                        <strong>정기구독권을 구매 하고 싶습니다.</strong><br/><br/><br/>
                                        정기구독권은 전화로 구매 가능하며 0502-3398-0600 으로 연락주시면 안내해 드리겠습니다.
                                    </p>
                                </td>
                            </tr>
                            <tr class="toggle_faq" data-sno="4">
                                <td>4</td>
                                <td>결제/배송</td>
                                <td class="board_tit">
                                    <span class="icon_qan"><img src="${pageContext.request.contextPath}/images/icon_qna_q.png" alt="질문제목"></span>
                                    <strong class="btnView">배송지 변경</strong>
                                    <p> 
                                        <strong>주소가 변경되었을 경우 어떻게 해야 하나요?</strong> <br/><br/><br/>

                                        답변<br/>
                                        배송지 변경은 매월 15일 이전에 알려주셔야 하며,<br/>
                                        
                                        1:1 문의글에 아래 양식 복사 후  작성 부탁드립니다.<br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        --------------------------------------------------------
                                        <br/>
                                        <br/>
                                        <br/>
                                        이름 :
                                        <br/>
                                        <br/>
                                        <br/>
                                        연락처 :
                                        <br/>
                                        <br/>
                                        <br/>
                                        변경전 주소 :
                                        <br/>
                                        <br/>
                                        <br/>
                                        변경요청 주소 :
                                        <br/><br/>
                                          
                                    </p>
                                </td>
                            </tr>
                            <tr class="toggle_faq" data-sno="3">
                                <td>3</td>
                                <td>교환/반품/환불</td>
                                <td class="board_tit">
                                    <span class="icon_qan"><img src="${pageContext.request.contextPath}/images/icon_qna_q.png"  alt="질문제목"></span>
                                    <strong class="btnView">파책교환</strong>
                                    <p> 
                                        <strong>손상된 책이 왔는데 어떻게 해야하나요?  </strong><br/><br/> <br/>

                                        답변<br/>
                                        배송중 손상된책, 파본은 새 책으로 교환해 드립니다.<br/>
                                        <br/>
                                        게시글 또는 0502-3398-0600 문의 및 카톡 플친'두산매거진'으로 연락주세요!  <br/>
                                    </p>
                                </td>
                            </tr>
                            <tr class="toggle_faq" data-sno="2">
                                <td>2</td>
                                <td>교환/반품/환불</td>
                                <td class="board_tit">
                                    <span class="icon_qan"><img src="${pageContext.request.contextPath}/images/icon_qna_q.png"  alt="질문제목"></span>
                                    <strong class="btnView">정기구독 중도취소및 환불</strong>
                                    <p> 
                                        <strong>정기구독을 보던 중에 취소가 가능한가요? 가능하다면 환불은 어떻게 되나요?</strong> <br/><br/><br/>
                                        <br/>
                                        답변
                                        <br/>
                                        <br/>
                                        1. 정기구독중 취소 : 환불금액 = 정기구독료 – (발송된 잡지정가 + 발송된 택배비)
                                        <br/>
                                        <br/>
                                        <br/>
                                            예) 보그1년정기구독 6개월 구독후 취소 : 62,400원-(39,000원+15,000원) = 8,400원 환불
                                            <br/>
                                            <br/>
                                            <br/>
                                            <br/>
                                            <br/>
                                            <br/>
                                            <br/>
                                        2. 사은품 이벤트 정기구독 취소 : 미개봉된 사은품 또는 판매가치에 문제가 없다고 보여지는 사은품을 반납 하셔야 구독취소가 됩니다.
                                        <br/>
                                        <br/>(ex. 얼루어, 더블유 선택부록 및 보그 오엠크림 이벤트)
                                        <br/>
                                            <br/>
                                            <br/>
                                            <br/>
                                        3. 받은책에 대해서는 단순 변심으로 환불이 불가 합니다.
                                    </p>
                                </td>
                            </tr>
                            <tr class="toggle_faq" data-sno="1">
                                <td>1</td>
                                <td>결제/배송</td>
                                <td class="board_tit">
                                    <span class="icon_qan"><img src="${pageContext.request.contextPath}/images/icon_qna_q.png"  alt="질문제목"></span>
                                    <strong class="btnView">결제방법</strong>
                                    <p> 
                                        <strong>결제방법은 어떻게 되나요?</strong> <br/><br/><br/>

                                        답변<br/>
                                        ​1. 카드결제<br/>
                                        <br/>
                                        결제 대행사(www.kcp.co.kr)에서 제공하는 카드사를 선택하여 결제할 수 있습니다.<br/>
                                        <br/>
                                        <br/>
                                        2. 무통장 입금<br/>
                                        <br/>
                                        이용이 편한 은행 계좌로 입금해 주시면 됩니다.<br/>
                                        입금시 입금하시는 분의 이름은 주문하신 분의 이름으로 넣어주셔야 하고,<br/>
                                        입금인이 다른 경우, 전화(☎ 0502-3398-0600)으로 알려주셔야 합니다.<br/>
                                        <br/>
                                        국민은행(004-25-0019-961)<br/>
                                        신한은행(100-014-525345)<br/>
                                        <br/>
                                        예금주 : 두산매거진<br/>
                                        <br/>
                                        3. 지로<br/>
                                        <br/>
                                        지로납입을 원할 경우, 지로용지를 보내드리며,<br/>
                                        구독기간이 만료되기 2개월 전부터 재구독안내문과 함께 지로용지를 보내드립니다. <br/>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section> 
            <!--하단 section 공지사항-->
            <section class="content_box">
                <div class="wrap_notice">
                    <div class="service_main_notice">
                        <h3>공지사항</h3>
                        <a href="vogueKorea.vk?type=notice" class="btn_board_more">+ 더보기</a>
                        
                        <ul>
                        	<c:forEach items="${noticeList}" var="notice">
                            <li>
                                <img src="${pageContext.request.contextPath}/images/icon_dot_03.png">
                                <a href="vogueKorea.vk?type=notice_detail&nseq=${notice.nseq}">${notice.subject}</a>
                                <span><fmt:formatDate value="${notice.indate}" type="date" pattern="yyyy-MM-dd"/></span>
                            </li>
                            </c:forEach>
                        </ul>
                       
                    </div>
                </div>
            </section>
        </main>
        <!--################################################################################################-->
 <%@ include file="../footer.jsp"%> <!-- footer삽입 -->