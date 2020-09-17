/*************************************************************
    주문 프로세스
*************************************************************/
/*주문자 정보와 동일 버튼을 눌렀을 때 복사*/
function Copy(){
    //체크된 상태면
    if (document.getElementById("shippingSameCheck").checked){
            //받는사람- 주문하는 사람 이름으로부터 복사
            document.getElementById("receiverName").value=document.getElementById("orderName").value;
            //받는사람 연락처- 주문하는 사람 연락처로부터 복사
            document.getElementById("receiverCellPhone").value=document.getElementById("mobileNum").value;
    }
}

$(function(){
    /*휴대폰 번호 입력시 자동 대시 (-) 입력하기*/
    $(document).on("keyup", ".phoneNumber", function() { 
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-")); 
    });
    //keyUp 했을 때 휴대폰번호 입력란안의 입력된 숫자가 처음부터 3/4/4 사이에 - 만들기
    //만일 사용자가 -를 입력했다면 --로 중복되지않고 -로 교체

    
});

 /*pay_complete() : 결제하기 유효성검사*/
 function pay_complete(){
    var orderName = document.getElementById("orderName");//주문자 
    var mobileNum = document.getElementById("mobileNum");//휴대폰번호
    var orderEmail = document.getElementById("orderEmail");//주문자 이메일
    var receiverName = document.getElementById("receiverName");// 받는사람이름
    var postcode = document.getElementById("sample4_postcode");// 주소1
    var roadAddress = document.getElementById("sample4_roadAddress");// 주소2
    var receiverCellPhone = document.getElementById("receiverCellPhone");// 수신자 휴대폰 번호
    var chkAgree = document.getElementById("chkAgree").checked;//필수 동의 체크박스의 체크여부 변수
    var chkPay1 = document.getElementById("settleKind_gb").checked;//무통장입금
    var chkPay2 = document.getElementById("settleKind_pc").checked;//신용카드
    var chkPay3 = document.getElementById("settleKind_pb").checked;//계좌이체
    var chkPay4 = document.getElementById("settleKind_pv").checked;//가상계좌
    var chkPay5 = document.getElementById("settleKind_ec").checked;//에스크로-신용카드
    var chkPay6 = document.getElementById("settleKind_eb").checked;//에스크로-계좌이체
    var chkPay7 = document.getElementById("settleKind_ev").checked;//에스크로-가상계좌
    
    
    /*빈칸일경우*/
    if((orderName.value) == ""){
        alert("주문자 이름을 작성하지 않았습니다.");
        orderName.focus();     
    }else if((mobileNum.value) == ""){
        alert("주문자 연락처를 작성하지 않았습니다.");
        mobileNum.focus();     
    }else if((orderEmail.value) == ""){
        alert("주문자 이메일을 작성하지 않았습니다.");
        orderEmail.focus();     
    }else if(( receiverName.value) == ""){
        alert("수신자 이름을 작성하지 않았습니다.");
        receiverName.focus();     
    }else if(( postcode.value) == "" ||( roadAddress.value) == "" ){
        alert("정확한 주소를 입력해 주세요.");
        roadAddress.focus();     
    }else if(( receiverCellPhone.value) == ""){
        alert("수신자 번호를 입력해주세요.");
        receiverCellPhone.focus();     
    }else if(!chkAgree){
        alert("구매 동의에 반드시 체크해주세요!");
        chkAgree.focus();   
    }else if(!(chkPay1 || chkPay2 || chkPay3 || chkPay4 || chkPay5 || chkPay6 || chkPay7)){
        alert("결제수단을 선택해 주세요");
        chkPay1.focus();   
    }else{ 
        document.form_order.action = "vogueKorea.vk?type=add_orderList";
	   	document.form_order.submit();
 		alert("결제가 완료되었습니다.");
    }               
    event.preventDefault();
}
