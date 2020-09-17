/*************************************************************
    콘텐츠 페이지
*************************************************************/
$(function () {
    /*카테고리 클릭시 글씨 색 변경*/
    $(".sub_menu > ul > li").each(function () {
        $(this).click(function () {
            $(this).addClass("sub_menu_on");                    
            $(this).siblings().removeClass("sub_menu_on");
        });
    });
    $(".sub_menu > ul > li").eq(0).trigger("click");//전체 카테고리 클릭된채로
});