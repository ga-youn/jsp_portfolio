/*선택상품구매*/
function optionCheck_toPayment(){ 
    var chkFirList = document.getElementsByName('cartSno');
  	var arrFir = new Array();
  	var cnt = 0;
	for ( var idx = chkFirList.length - 1; 0 <= idx; idx--) {
	   if (chkFirList[idx].checked) {
	    arrFir[cnt] = chkFirList[idx].value;
	    cnt++;
	   }
	  }
	if (arrFir.length != 0) {
		document.frmCart.action = "vogueKorea.vk?type=cart_to_payment";
	   	document.frmCart.submit();
	} else {
	  alert('선택한 상품이 없습니다.');
	  return;
	}
}
/*전체상품구매*/ 
function allCheck_toPayment(){//장바구니로 이동
	var allchk = document.getElementById("allCheck");//전체체크하기 객체변수
    var allCheckBox = document.getElementsByClassName("checkbox");//전체체크박스들의 개수 객체변수
    
    for(var i = 0; i < allCheckBox.length; i++){       
       allchk.checked == true;
       allCheckBox[i].checked = true;//전체체크박스 체크

    }
    var chkFirList = document.getElementsByName('cartSno');
  	var arrFir = new Array();
  	var cnt = 0;
	for ( var idx = chkFirList.length - 1; 0 <= idx; idx--) {
	   if (chkFirList[idx].checked) {
	    arrFir[cnt] = chkFirList[idx].value;
	    cnt++;
	   }
	  }
	if (arrFir.length != 0) {
		document.frmCart.action = "vogueKorea.vk?type=cart_to_payment";
	   	document.frmCart.submit();
	} else {
	  alert('선택한 상품이 없습니다.');
	  return;
	}
}