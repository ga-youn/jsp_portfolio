/*옵션 필수 사항*/
function optionCheck_toPayment(pseq){ //바로구매로 이동
    var myform = document.frmView;
    if(myform.optionSnoInput.value ==''){//빈칸일시 알림창
        alert("옵션을 선택해 주세요.");
        myform.optionSnoInput.focus();//선택창에 포커스
    }
    myform.action="vogueKorea.vk?type=add_paymentList&pseq="+pseq;

	myform.submit();
}
function optionCheck_toShoppingCart(pseq){//장바구니로 이동
    var myform = document.frmView;
   
    if(myform.optionSnoInput.value ==''){//빈칸일시 알림창
        alert("옵션을 선택해 주세요.");
        myform.optionSnoInput.focus();//선택창에 포커스
    }else{
        var goConfirm = confirm("상품을 장바구니페이지에 이동시키겠습니까?\n취소를 누르시면 현재페이지에 머뭅니다.");
        if (goConfirm == false) {
            event.preventDefault();  
        }else{
            myform.action="vogueKorea.vk?type=add_cart&pseq="+pseq;
			myform.submit();
        }
        
    } 
}

$(function(){
    /*옵션 선택 시 상품 정보 보이기*/
    $(".chosen-select option").eq(1).click(function(){
        $(".item_tatal_box").show();
    });
});