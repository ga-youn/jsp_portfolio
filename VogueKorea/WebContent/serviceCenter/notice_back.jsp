<!DOCTYPE html>
<html lang="ko" class="home_pc">
<head>
    <meta charset="UTF-8">
    <meta name="auothor" content="박가연">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="#"><!--파비콘-->
    <title>보그코리아::공지 사항</title>
    <script src="https://kit.fontawesome.com/cccee664d4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="./css/notice.css">
    <link rel="stylesheet" href="/css/pagenation.css"><!--페이지네비게이션css-->
    <script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="/js/pagenation.js"></script><!--페이지네비게이션js-->
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript">

        /*페이지 네비게이션*/
        $(document).ready (function(){
            $('#pagination-container').pagination({
                dataSource: [1,2],
                callback: function(data, pagination) {
                    // template method of yourself
                    var html = template(data);
                    $('#data-container').html(html);
                }
            });
        }); 
    </script>
    <script type="text/javascript">

        /*전체 체크박스 클릭시 전체선택, 전체취소*/
        function allCheckNCancel(){
            var allchk = document.getElementById("allCheck");//전체체크하기 객체변수
            var allCheckBox = document.getElementsByClassName("checkbox");//체크박스들의 개수 객체변수
            
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
            var allCheckBox = document.getElementsByName("notSno");//하위체크박스들의 개수 객체변수
            
            for(var i=0; i<allCheckBox.length; i++){
                if(allCheckBox[0].checked == true && allCheckBox[1].checked == true && allCheckBox[i].checked == true){
                    allchk.checked = true; //전체체크박스 클릭
                }
                else{
                    allchk.checked = false;//전체체크박스 클릭안함
                }
            }
            
        }
    </script>
</head>
<body>
    <!--전체 wrap-->
    <div id="wrapper">
        <!--#########################################헤더 시작###############################################-->
        <!--################################################################################################-->
        <header id="header">
            <!--pc헤더-->
            <div class="device_pc">
                <div id="header_row_1">
                    <!--sns바로가기-->
                    <div id="header_row_left">
                        <ul class="sns_icons">
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="instagram">
                                    <span><i class="fab fa-instagram"></i></span>
                                </a>
                            </li>
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="facebook">
                                    <span><i class="fab fa-facebook-square"></i></span>
                                </a>
                            </li>
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="youtube">
                                    <span><i class="fab fa-youtube"></i></span>
                                </a>
                            </li>
                            <li class="sns_icon">
                                <a href="#" target="_blank" title="twitter">
                                    <span><i class="fab fa-twitter"></i></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!--gnb1-->
                    <nav id="header_row_right">
                        <ul class="menu">
                            <li class="menu_item">
                                <a  href="#" title="로그아웃" >
                                    <span class="menu_text">로그아웃</span>
                                </a>
                            </li>
                            <li class="menu_item">
                                <a  href="/pay_process/shopping_cart.html" title="장바구니로 이동">
                                    <span class="menu_text">장바구니</span>
                                </a>
                            </li>
                            <li class="menu_item">
                                <a  href="/service_center/service_center_home.html" title="고객센터로 이동">
                                    <span class="menu_text">고객센터</span>
                                </a>
                            </li>
                            <li class="menu_item search_box device_pc">
                                <input type="text" placeholder="검색어를 입력하세요." />
                                <button><i class="fas fa-search"></i></button>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!--logo-->
                <div id="main_logo">
                    <a href="/main.html"> 
                        <h1><img src="/images/h1_logo.png" alt="보그 코리아 (Vogue Korea) Logo"  class="logo" /></h1>
                    </a>
                </div>
                <!--gnb2:카테고리-->
                <nav id="header_row_middle">
                    <ul class="main_menu">
                        <li class="menu_item">
                            <a  href="/article/article_fashion.html" >
                                <span class="menu_text">FASHION</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/article/article_beauty.html" >
                                <span class="menu_text">BEAUTY</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/article/article_living.html" >
                                <span class="menu_text">LIVING</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/article/article_video.html" >
                                <span class="menu_text">VIDEO</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/store.html" >
                                <span class="menu_text menu_text_store">STORE</span>
                            </a>
                        </li>
                        
                    </ul>
                </nav>
            </div>
            <!--고정헤더-->
            <div class="sticky_header" id="sticky_head">
                <div id="main_logo">
                    <a href="/main.html"> 
                        <img src="/images/h1_logo.png" alt="보그 코리아 (Vogue Korea) Logo"  class="logo" />
                    </a>
                </div>
                <nav id="header_row_middle">
                    <ul class="main_menu">
                        <li class="menu_item">
                            <a  href="/article/article_fashion.html" >
                                <span class="menu_text">FASHION</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/article/article_beauty.html" >
                                <span class="menu_text">BUEATY</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/article/article_living.html" >
                                <span class="menu_text">LIVING</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/article/article_video.html" >
                                <span class="menu_text">VIDEO</span>
                            </a>
                        </li>
                        <li class="menu_item">
                            <a  href="/store.html" >
                                <span class="menu_text">STORE</span>
                            </a>
                        </li>
                        <li class="menu_item search_box device_pc">
                            <input type="text" placeholder="검색어를 입력하세요." />
                            <button><i class="fas fa-search"></i></button>
                        </li>
                    </ul>
                </nav>
            </div>
            
            
             <!--모바일 헤더-->
            <div class="device_mobile">
                <div id="main_logo">
                    <a href="/main.html"> 
                        <h1><img src="/images/h1_logo.png" alt="보그 코리아 (Vogue Korea) Logo"  class="logo" /></h1>
                    </a>
                </div>
                <!--장바구니 바로가기 아이콘-->
                <div class="shopping_cart">
                    <a href="/pay_process/shopping_cart.html">
                        <i class="fas fa-shopping-cart"></i>
                    </a>
                </div>
                <!--모바일 메뉴 카테고리:메뉴전체 판넬 -->
                <div class="panel left">
                <!-- 눌렀을경우 메뉴가 나타나고, 사라지는 부분 -->
                    <a class="ninja-btn" title="menu"><span></span></a>
                    <!-- 메뉴의 내용부분 -->
                    <span class="mo-menu-title"></span>
                    <ul>
                        <li class="menu-label"><a  href="#" title="로그아웃" >로그아웃</a></li>
                        <li class="menu-label"><a  href="/pay_process/shopping_cart.html" title="장바구니로 이동">장바구니</a></li>
                        <li class="menu-label"><a  href="/service_center/service_center_home.html" title="고객센터로 이동">고객센터</a></li>
                        <li class="sub-menu"><a  href="/service_center/notic.html" title="공지사항으로 이동">공지사항</a></li>
                        <li class="menu-label"><a href="#">VOGUE</a></li>
                        <li class="sub-menu"><a href="/article/article_fashion.html">FASHION</a></li>
                        <li class="sub-menu"><a href="/article/article_beauty.html">BEAUTY</a></li>
                        <li class="sub-menu"><a href="/article/article_living.html">LIVING</a></li>
                        <li class="sub-menu"><a href="/article/article_video.html">VIDEO</a></li>
                        <li class="sub-menu"><a href="/store.html">STORE</a></li>
                    </ul>
                </div><!--메뉴전체 판넬 -->

                <!--메뉴 밖에 어두워지는 부분-->
                <div class="panel-overlay"></div>
            </div>
        </header>
            
        <!--################################################################################################-->
        <!--#############################공지사항시작###################################################################-->
        <main >
            <section class="content_box">
                <!-- 본문 시작 -->
                <div class="content">
                    
                    <div class="board_zone_tit">
                        <h2>공지사항</h2>
                    </div>
                    <div class="board_zone_cont">
                        <div class="board_zone_list notic_back">
                            <a href="notice.html" style="float: right;"><button>사용자버전</button></a>
                            <table class="board_list_table" style="width:100%">
                                <colgroup>
                                    <col style="width:5%">
                                    <col style="width:10%">
                                    <col style="width:40%;">
                                    <col style="width:15%">
                                    <col style="width:15%">
                                    <col style="width:15%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="allCheck" class="checkbox" onclick="allCheckNCancel()">
                                            <label for="allCheck" ></label>
                                        </th>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>날짜</th>
                                        <th>작성자</th>
                                        <th>조회</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr >
                                        <td class="td_chk">
                                                <input type="checkbox" name="notSno" id="notic_no1"value=""class="checkbox"onclick="memberAllClick()" >
                                                <label for="notic_no1"></label>
                                        </td>
                                        <td>
                                            3
                                        </td>
                                        <td class="board_tit">
                                            <a href="#" >
                                                <strong>시스템 리뉴얼로 인한 비밀번호 초기화 안내입니다.</strong>
                                            </a>
                                        </td>
                                        <td> 2020-07-17 </td>
                                        <td> 관리자 </td>
                                        <td> 43 </td>
                                    </tr>
                                    <tr >
                                        <td class="td_chk">
                                                <input type="checkbox" name="notSno" id="notic_no1"value=""class="checkbox"onclick="memberAllClick()" >
                                                <label for="notic_no1"></label>
                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td class="board_tit">
                                            <a href="#" >
                                                <strong>교환/환불 정책 안내 입니다.</strong>
                                            </a>
                                        </td>
                                        <td> 2020-07-16 </td>
                                        <td> 관리자 </td>
                                        <td> 123 </td>
                                    </tr>
                                    <tr >
                                        <td class="td_chk">
                                                <input type="checkbox" name="notSno" id="notic_no1"value=""class="checkbox"onclick="memberAllClick()" >
                                                <label for="notic_no1"></label>
                                        </td>
                                        <td>
                                            1
                                        </td>
                                        <td class="board_tit">
                                            <a href="#" >
                                                <strong>배송 정책 안내 입니다.</strong>
                                            </a>
                                        </td>
                                        <td> 2020-07-16 </td>
                                        <td> 관리자 </td>
                                        <td> 22 </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="wrap_button">
                                <button type="button" class="del_botton">삭제</button>
                                <button type="button" class="modify_botton">수정</button>
                                <button type="button" class="writer_botton">글쓰기</button>
                            </div>
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
                <!-- //board_zone_sec -->
                
            </section>
        </main>
        
        <!--################################################################################################-->
        <!--###############################푸터시작#################################################################-->
        <footer id="footer">
            <div id="footer_info">
                <a href="/error.html" title="회사소개"><span>회사소개</span></a>
                <a href="/error.html" title="이용약관"><span>이용약관</span></a>
                <a href="/error.html" title="이용안내"><span>이용안내</span></a>
                <a href="/error.html" title="개인정보처리방침"><span>개인정보처리방침</span></a>
            </div>
            <div class="footer">
                <div class="footer_logo">
                    <img width="150px" height="72px"src="/images/footer_logo.png">
                </div>
                <div class="call_center device_pc">
                    <h3>고객센터</h3>
                    <strong><a href="tel:080-3398-0600">080-3398-0600</a></strong>
                    <p>평일 월~금<br />오전9시~오후5시 (점심시간 오후12시~1시)</p>
                </div>
                <p class="copyright">WWW.VOGUE.COM Ⓒ CONDÉNAST ASIA PACIFIC. INC. ALL RIGHTS RESERVED.VOGUE.COM KOREA IS OPERATED BY DOOSAN MAGAZINE.</p>
            </div>
        </footer>
        <!--to Top, to Bottom 고정 버튼-->
        <div  class="top_bottom_fixed_btn" >
            <div id="to_top">
                <a href="#"><i class="fas fa-angle-up"></i></a>
            </div>
            <div id="to_bottom">
                <a href="#"><i class="fas fa-angle-down"></i></a>
            </div>
        </div>
        <!--//to Top, to Bottom 고정 버튼-->   
    </div>
    <!--//전체 wrap-->
</body>
</html>