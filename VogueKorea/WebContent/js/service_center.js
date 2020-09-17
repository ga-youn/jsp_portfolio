$(function(){

    /*자주 묻는 질문 토글*/ 
    $(".board_tit p").hide();
    // $("ul > li:first-child a").next().show();
    $(".board_tit .btnView").click(function(){
      $(this).next().slideToggle(300);
      // $(this).next().slideDown(300);
      $(".board_tit .btnView").not(this).next().slideUp(300);
      return false;
    });
    $(".board_tit .btnView").eq(0).trigger("click");//첫 화면 클릭된채로
  });