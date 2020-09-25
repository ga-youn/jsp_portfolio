/*************************************************************
   마이페이지 - 정보수정
*************************************************************/
/*change_info(): 정보수정완료*/
function change_info(){
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

 	if((pwd1.value) == ""){//비밀번호 입력 하지 않았을 경우
        alert("비밀번호를 입력해 주세요");
        pwd1.focus();   
		return false;    
    }
    if((pwd2.value=="")){//비밀번호 확인
        alert("비밀번호를 확인해 주세요");
        pwd2.focus(); 
		return false;     
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
        alert( "정보를 변경했습니다.");    
        return true;         
    }               
    return false;
}


$(function(){
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

