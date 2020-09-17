/*************************************************************
    회원가입::약관동의
*************************************************************/    
 
 /*window.onload = function() {
    console.log(document.getElementById("allAgree_icon").checked);
}
let trigger = false;*/
/*allCheckNCancel() :전체 동의 버튼 클릭 시 모든 체크박스 선택 함수*/
function allCheckNCancel(){
    //trigger = !trigger ? true : false;
    
    var allchk = document.getElementById("allAgree_icon");//전체체크하기 객체변수
    var allCheckBox = document.getElementsByClassName("checkbox_icon");//전체체크박스들의 개수 객체변수
    
    for(var i = 0; i < allCheckBox.length; i++){       
        if(allchk.checked == true){
            allCheckBox[i].checked = true;//전체체크박스 체크
        }
        else{
            allCheckBox[i].checked = false;//전체체크박스 체크해제
        }
        //allCheckBox[i].checked = trigger;
        //console.log('순서 : ' + i + ', 값 : ' + allCheckBox[i].checked);
    }
    console.log(allchk.checked);
    
}
/*memberAllClick() : 하위 체크박스 모두 동의시 전체동의 버튼 체크*/
function memberAllClick() {
    var allchk = document.getElementById("allAgree_icon");//전체체크박스 객체변수
    var memberCheckBox1 = document.getElementById("agree_icon1");//하위체크박스 객체변수1
    var memberCheckBox2 = document.getElementById("agree_icon2");//하위체크박스 객체변수2
    var memberCheckBox3 = document.getElementById("agree_icon3");//하위체크박스 객체변수3
    

    if(memberCheckBox1.checked == true&& memberCheckBox2.checked == true&& memberCheckBox3.checked== true ){
        allchk.checked = true; //전체체크박스 클릭
    }
    else {
        allchk.checked = false;//전체체크박스 클릭안함
    }
}
/*goNextPage(): 필수 동의 체크되어야만 정보입력 페이지로 이동*/     
function goNextPage(){
    var chkAgree1 = document.getElementsByName("check")[1].checked;//필수 동의 체크박스의 체크여부 변수
    var chkAgree2 = document.getElementsByName("check")[2].checked;
    console.log(chkAgree1);
    console.log(chkAgree2);
    if(!chkAgree1 || !chkAgree2){
        alert('동의 항목에(필수)는 반드시 체크하셔야 다음 단계로 넘어갑니다.');
 		event.preventDefault();
    }
    
}
/*goPrevPAge(): 이전페이지를 누르면 경고창*/ 
function goPrevPage(){
	var theForm = document.my_form;
    var delConfirm=confirm("페이지를 벗어나시겠습니까?\n홈으로 이동합니다.");
    if (delConfirm == true){//확인을 누를시 홈
		theForm.method = "post";
        theForm.action = "vogueKorea.vk?type=index";
		theForm.submit();
	}
    else//취소
        return "#";
}
/*************************************************************
    회원가입::정보입력
*************************************************************/
/*joinWelcom(): 가입 환영 함수 및 유효성 검사*/
function joinWelcome(){
    var memId = document.getElementById("memId");//아이디 input 값 
    var pwd1 = document.getElementById("newPassword");//비밀번호 input 값
    var pwd2 = document.getElementById("newPassword2");//비밀번호확인 input 값
    var name = document.getElementById("memName");// input 값
    var chkId =/^[a-z0-9]{4,20}$/;//아이디 유효성 아이디는 영문, 숫자 조합으로, 4~20자 이내로 작성(대소문자 구별, 한글, 특수문자 사용불가.)
    var chkPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;//비밀번호 유효성 최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자
    
    console.log(memId.value);
    console.log(pwd1.value);
    console.log(pwd2.value);
    console.log(name.value);


    if((memId.value) == ""){//아이디 입력 하지 않았을 경우
        alert("아이디를 입력하지 않았습니다.");
        memId.focus();     
    }
    else if((memId.value) == "scott"){//아이디 중복 확인을 하지 않았을 경우
        alert("중복된 아이디가 있습니다.");
        memId.focus();             
    }
    else if((pwd1.value) == ""){//비밀번호 입력 하지 않았을 경우
        alert("비밀번호를 입력해 주세요");
        pwd1.focus();       
    }
    else if((pwd2.value=="")){//비밀번호 확인
        alert("비밀번호를 확인해 주세요");
        pwd2.focus();    
    } 
    else if((pwd1.value)!=(pwd2.value)){//비밀번호와 비밀번호 확인이 일치 하지 않을 경우
        alert("비밀번호가 일치 하지 않습니다.");
        pwd1.focus();     
    }
    else if(!chkPw.test(pwd1.value)){//비밀번호 유효성 검사
        alert("비밀번호는 최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 입력해야합니다.");
        pwd1.value = ""; //value 빈칸으로 변환
        pwd2.value = "";
        pwd1.focus();
    } 
    else if ((name.value)==""){//이름입력 안 한 경우
        alert("이름을 입력해 주세요");
        name.focus();    
    }
    else{//회원가입 성공
        alert( name.value +"님 회원 가입을 축하합니다.");    
        return true;         
    }               
    return false;
}
/*goAgreePage(): 이전페이지를 누르면 경고창*/ 
function goAgreePage(){
   var theForm = document.formJoin;
    var delConfirm=confirm("페이지를 벗어나시겠습니까?\n작성하신 정보가 초기화 됩니다.");
    if (delConfirm == true){//확인을 누를시 홈
		theForm.method = "post";
        theForm.action = "vogueKorea.vk?type=join_agree";
		theForm.submit();
	}
    else//취소
        return "#";
}
/*id 중복체크 */
function idCheck(){ //새창 만들기 
	window.open("./id_check_form.jsp", "idwin", "width=400, height=350");//파일 만들지 아니함. 
}

$(function(){
    /*아이디 중복확인 메소드 + 정규식*/
    /*$("#alert-id").hide();//아이디는 영문, 숫자 조합으로, 6~20자 이내로 작성해주세요.
    $("#alert-usedId").hide();//이미사용중인아이디
    $("#alert-successId").hide();//사용가능한아이디
    $("input").keyup(function(){
        var chkId =/^[a-z0-9]{4,20}$/.test($("#memId").val());//아이디는 영문, 숫자 조합으로, 4~20자 이내로 작성(대소문자 구별, 한글, 특수문자 사용불가.)
        var id=$("#memId").val(); 
        if(id != ""){ //빈칸이아니면
            if(id == "scott123"){ //중복된아이디 테스트1
                $("#alert-usedId").show();
                $("#alert-successId").hide();
                $("#alert-id").hide();
            }else if(!chkId){//정규식위배
                $("#alert-id").show(); 
                $("#alert-usedId").hide();
                $("#alert-successId").hide();
            }
            else{
                $("#alert-successId").show();
                $("#alert-usedId").hide();
                $("#alert-id").hide();
                
               
            } 
        }else{//빈칸인 경우 아무것도 보이지 않음
            $("#alert-usedId").hide();
            $("#alert-id").hide();
            $("#alert-successId").hide();
        }
    }); */
    /*비밀번호 정규식 메소드*/
    
    $("#alert-pw").hide(); 
    $("input").keyup(function(){ 
        var chkPw=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/.test($("#newPassword").val());//최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자
        var id=$("#newPassword").val(); 
        if(id != ""){ 
            if(!chkPw){ 
                $("#alert-pw").show();
                $("#newPassword2").attr('disabled','disalbled');
               
            }else{ 
                $("#alert-pw").hide();
                $("#newPassword2").removeAttr('disabled','disalbled');
               
            } 
        }else{
            $("#alert-pw").hide(); 
        }
    }); 


    /*비밀번호 확인 메소드*/
    $("#alert-success").hide(); 
    $("#alert-danger").hide(); 
    $("input").keyup(function(){ 
        var pwd1=$("#newPassword").val(); 
        var pwd2=$("#newPassword2").val(); 
        if(pwd1 != "" && pwd2 != ""){ 
            if(pwd1 == pwd2){ 
                $("#alert-success").show(); 
                $("#alert-danger").hide(); 
               
            }else{ 
                $("#alert-success").hide(); 
                $("#alert-danger").show(); 
               
            } 
        }else{
            $("#alert-success").hide(); 
            $("#alert-danger").hide(); 
        }
    });

	/*비밀번호 보이기
	$('.member_warning i').onclick(function(){
        $('.member_warning #newPassword').toggleClass('active');
        if($('.member_warning input').hasClass('active')){
            $('.member_warning i').attr('class',"fas fa-eye-slash")
            .prev('input').attr('type',"text");
        }else{
            $('.member_warning i').attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });*/
    /*휴대폰 번호 입력시 자동 대시 (-) 입력하기*/
    $(document).on("keyup", ".phoneNumber", function() { 
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-")); 
    });
    //keyUp 했을 때 휴대폰번호 입력란안의 입력된 숫자가 처음부터 3/4/4 사이에 - 만들기
    //만일 사용자가 -를 입력했다면 --로 중복되지않고 -로 교체

});

