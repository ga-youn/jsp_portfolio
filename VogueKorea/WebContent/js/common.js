$(function () {
    /*기사 이미지 호버 효과*/ 
    img_hover();
    /*맨 위로 가기 고정버튼*/
    go_to_top();
    
    /*사용자가 스크롤 내릴 때, 고정 헤더 메소드*/
    var jbOffset = $( 'main' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.sticky_header' ).addClass( 'sticky' );
          }
          else {
            $( '.sticky_header' ).removeClass( 'sticky' );
          }
        });
    /*모바일 메뉴버튼*/
    $(window).load( function() {
        /* 메뉴버튼을 눌렀을때, 오버레이부분을 클릭했을때*/
            $(".ninja-btn, .panel-overlay").click( function() {
            $(".ninja-btn, .panel-overlay, .panel").toggleClass("active"); //해당 영역에 toggleClass를 넣어줍니다
            /* panel overlay가 활성화 되어있는지를 체크합니다. */
            if ($(".panel-overlay").hasClass("active")) {
                $(".panel-overlay").fadeIn();
            } else {
                $(".panel-overlay").fadeOut();
            }
        });
        
    });
    /*카테고리 클릭시 글씨 색 변경*/
    $("#header  li.menu_item").each(function () {
        $(this).click(function () {
            $(this).addClass("sub_menu_on");                    
            $(this).siblings().removeClass("sub_menu_on");
        });
    });
    

});
/*기사 이미지 호버 효과*/ 
function img_hover(){
    $(".container").hover(function(){
        $(this).find(".button").css({"opacity":1});//더보기버튼 보여주기
        $(this).find(".article").css({"opacity":1});//상세내용 보여주기
        $(this).find(".background").css({"opacity":1});//배경 효과
        $(this).find(".txt").hide();//제목숨기기
    },function(){
        $(this).find(".button").css({"opacity":0});//더보기버튼 숨기기
        $(this).find(".article").css({"opacity":0});//상세내용 숨기기
        $(this).find(".background").css({"opacity":0});//배경효과
        $(this).find(".txt").show();//제목 보여주기
    });
    
};

/*맨 위로 가기 고정버튼-천천히*/
function go_to_top(){
    //스크롤 시 고정버튼 보이기
    $(window).scroll(function(){
        if ($(this).scrollTop() > 100) {
            $('.top_bottom_fixed_btn').fadeIn();
        } else {
            $('.top_bottom_fixed_btn').fadeOut();
        }
    });

    //클릭시 페이지 맨 위로 
    $('#to_top').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });
    //클릭시 페이지 맨 아래로 
    $('#to_bottom').click(function(){
        $('html, body').animate({scrollTop : $(document).height()},800);
        return false;
    });
};

    

