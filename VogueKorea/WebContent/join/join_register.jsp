<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%> <!-- header삽입 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/join.js"></script>
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
    <h1 style="display:none;" id="hidden_title">보그코리아 | 정보입력</h1>
    <!--###############################회원가입:정보입력 시작#################################################################-->
    <main>
        <section class="content_box">
             <!--location navigation-->
             <div class="join_tit">
                <h2>정보입력</h2>
                <ol>
                    <li><span>01</span> 약관동의 ></li>
                    <li class="page_on"><span>02</span> 정보입력 ></li>
                    <li><span>03</span> 가입완료</li>
                </ol>
            </div>
            <!-- 본문 시작 -->
            <div class="member_cont">
                <form id="formJoin" name="formJoin" onsubmit="return joinWelcome();" action="vogueKorea.vk?type=join_register" method="post" >
                    <!-- 회원가입/정보 기본정보 -->
                    <div class="base_info_box">
                        <h3>기본정보</h3>
                        <span class="important_txt">*표시는 반드시 입력하셔야 하는 항목입니다.</span>
                        <style>
                        
                        /* 반드시 입력표시 */
						th > .important{
						margin: 0 0 0 -10px; padding:0 0 0 10px; 
						background:url('${pageContext.request.contextPath}/images/icon_dot_03.png') no-repeat 0 center;
						}
						span.important_txt{float: right; font-size: 10px;}
						</style>
                        <div class="base_info_sec">
                            <table class="table_left">
                                <colgroup>
                                    <col width="25%">
                                    <col width="75%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span class="important">아이디</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" id="memId" name="memId" placeholder="아이디를 입력해주세요." >
                                            <!--<div class="alert alert-usedId" id="alert-usedId">이미 사용중인 아이디 입니다.</div>
                                            <div class="alert alert-success" id="alert-successId">사용가능한 아이디 입니다.</div>
                                            <div class="alert alert-id" id="alert-id">아이디는 영문, 숫자 조합으로, 6~20자 이내로 작성해주세요.(
                                                	대소문자 구별, 한글, 특수문자 사용불가.)</div>  -->
                                            <input type="button" value="ID중복확인" id="idCheck" onclick="idCheck()">

                                        </div>
                                    </td>
                    
                                </tr>
                                <tr class="">
                                    <th scope="row"><span class="important">비밀번호</span></th>
                                    <td class="member_password">
                                        <div class="member_warning">
                                            <input type="password" id="newPassword" name="memPw" autocomplete="off" placeholder="비밀번호를 입력해주세요.">
                                            <!--<i class="fa fa-eye fa-lg"></i>  -->
                                            <div class="alert alert-pw" id="alert-pw">비밀번호는 영문, 숫자, 특수문자 조합
                                                8~20자 이내로 작성 해주세요.</div> 
                                        </div>
                                    </td>
                                </tr>
                                <tr class="">
                                    <th scope="row"><span class="important">비밀번호 확인</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="password" class="check-id" name="memPwRe"id="newPassword2" autocomplete="off"placeholder="비밀번호를 한번 더 입력해주세요.">
                                            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span class="important" >이름</span></th>
                                    <td>
                                        <div class="member_warning">
                                            <input type="text" name="memNm"
                                            id="memName" value=""placeholder="이름을 입력해주세요."maxlength="10" >
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <span >이메일</span>
                                    </th>
                                    <td class="member_email">
                                        <div class="member_warning">
                                            <input type="text" name="email" id="email" value="" >
                                            <select id="emailDomain" name="emailDomain" class="chosen-select">
                                                <option value="self">직접입력</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="nate.com">nate.com</option>
                                                <option value="hotmail.com">hotmail.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="icloud.com">icloud.com</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>휴대폰번호</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" id="cellPhone" name="cellPhone" maxlength="14" placeholder="- 없이 입력하세요." data-pattern="gdNum" value=""class="phoneNumber">
                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <th><span>주소</span></th>
                                    <td class="member_address">
                                        <div class="address_postcode">
                                            <input type="text" name="address"id="sample4_postcode"readonly="readonly" placeholder="우편번호">
                                            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                                        </div>
                                        <div class="address_input">
                                            <div class="member_warning">
                                                <input type="text" name="address"id="sample4_roadAddress"readonly="readonly" placeholder="주소">
                                            </div>
                                            <div class="member_warning js_address_sub">
                                                <input type="text" name="address"id="sample4_detailAddress" placeholder="상세주소">
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- //base_info_sec -->
                    </div>
                    <!-- //base_info_box -->
                    
                    <div class="btn_box">
                        
                        <button type="button" id="btnCancel" onclick="goAgreePage()" class="btn_Prev">취소</button>
                       
                        <button type="submit" class="btn_Next " value="회원가입">회원가입</button>
                    </div>
                    <!-- //btn_center_box -->
                </form>
            </div>
            <!-- //member_cont -->
        </section>
    </main>
    <!--################################################################################################-->

<%@ include file="../footer.jsp"%> <!-- footer삽입 -->