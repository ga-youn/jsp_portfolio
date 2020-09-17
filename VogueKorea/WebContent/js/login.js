/*************************************************************
    로그인
*************************************************************/
/*아이디 비밀번호 저장을 위한 쿠키 만들기*/
window.onload = function(){
	if (getCookie("id")&&getCookie("pw")) { 
        document.login_form.loginId.value = getCookie("id"); 
        document.login_form.loginPw.value = getCookie("pw");//쿠키에 값 넣기
        document.login_form.maintain_icon.checked = true; //체크 박스 체크된 상태
    }
}
/*쿠키 저장함수*/
function setCookie(name, value, expiredays){
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires="+todayDate.toGMTString() + ";";
}
/*쿠키 불러오기*/
function getCookie(Name){
    var search = Name + "=";
    if (document.cookie.length > 0){//만약 페이지에 쿠키가 존재한다면
        offset = document.cookie.indexOf(search);
        if (offset != -1){//쿠키에서 나간다면
            offset += search.length;//인덱스 시작값
            end = document.cookie.indexOf(";", offset);//마지막 쿠키 끝에 인덱스 설정
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
}
/*아이디/비밀번호를 쿠키에저장*/
function sendit() {
    if(document.login_form.maintain_icon.checked == true){ // 로그인저장을 체크 하였을때
        setCookie("id", document.login_form.loginId.value, 1); //쿠키이름을 id로 값을 1일동안 저장
        setCookie("pw", document.login_form.loginPw.value, 1);
    } 
    else{ // 체크 하지 않았을때
        setCookie("id", document.login_form.loginId.value, 0); //날짜를 0으로 저장하여 쿠키삭제
        setCookie("pw", document.login_form.loginPw.value, 0);
    }
}
/*loginChk(): 로그인 함수*/
var failedCount=1; //실패횟수 변수

function loginChk(){
    var userID = document.getElementById("loginId");//아이디 객체
    var userPwd = document.getElementById("loginPw");//비밀번호 객체

    console.log(userID.value);
    console.log(userPwd.value);

   if((userID.value =="") || (userPwd.value == "")){//아이디와 비밀번호 중 하나라도 빈칸인 상태면
        alert("정보를 모두 기입해주세요");
        userID.focus();
 		
	return event.preventDefault();  
    }
  
   
} 

/*************************************************************
    로그인 아이디 찾기
*************************************************************/
/*findChk_ID(): 아이디 찾기 확인 함수*/
 function findChk_ID(){
    var findMail = document.getElementsByName("mail");//메일로찾기
    var findPhone = document.getElementsByName("phone");//휴대폰 번호로찾기
    var infor = ["scott123","scott123@gmail.com","01012341234","tiger123"];//가입된 회원 정보(아이디/이메일/휴대폰번호/비밀번호)
    /*
    var strLength = infor[1].toString().split('@')[0].length - 3;//이메일 문자열 가리기,뒤에서 3자리까지만 가리기
    var idRe = infor[0].replace(new RegExp('.(?=.{0,' + strLength + '}@)', 'g'), '*').replace(/.{8}$/, "******");
    */
    var idRe =infor[0].replace(/(?<=.{3})./gi, "*");//아이디 문자열 가리기,문자열 3개까지만 노출
    if(findMail[0].value==infor[1] || findPhone[0].value==infor[2]){//scott의 정보라면 아이디(이메일)노출
        alert("찾으시는 아이디는"+idRe+"입니다.");
        return;
    }
    else if(findMail[0].value==""&& findPhone[0].value==""){//빈칸이라면
        alert("정보를 기입해주세요.");
    }
    else{
        alert("등록된 정보가 아닙니다. 가입하신 정보를 입력해 주세요.")
    
    }
    return event.preventDefault();
}

/*del(): 다른 탭 누르면 기입한 내용 삭제*/
function del(){
    var findMail = document.getElementsByName("mail");//메일로찾기
    var findPhone = document.getElementsByName("phone");//휴대폰 번호로찾기
    findMail[0].value="";
    findPhone[0].value="";  
}


/*************************************************************
    로그인 비밀번호 찾기
*************************************************************/

/*findChk_pw(): 비밀번호 찾기 확인 함수*/
function findChk_pw(){
    var infor = ["scott123","scott123@gmail.com","01012341234","tiger123"];//가입된 회원 정보(아이디/이메일/휴대폰번호/비밀번호)
    var gNum =  Math.floor(Math.random() * 10000) + 1;//인증번호를 위한 랜덤 함수
    var pwRe =infor[3].replace(/(?<=.{3})./gi, "*");//비밀번호 문자열 가리기,문자열 3개까지만 노출
    var findPW = document.getElementsByName("loginId");//아이디 입력 객체

    /*아이디(이메일)입력시 인증번호 생성 함수*/
    this.sendMail=function(){
        console.log(gNum);//인증번호 랜덤
        complete = window.prompt("띵동!메일이 도착했습니다."+infor[0]+"님이 맞으신가요?\n인증번호를 입력하면 인증됩니다.");//DB가 없기 때문에 prompt로 이메일 대체
        if(Number(complete) == gNum){
            alert(infor[0]+"님의 비밀번호는"+pwRe+"입니다.");//랜덤 함수에 적힌 숫자와 일치하다면 비밀번호 노출
        }
        else{
            alert("인증번호가 틀렸습니다. 처음부터 다시 진행해주세요.");
        }         
    }

    if(findPW[0].value == infor[0]){//scott의 정보라면 비밀번호 알려주기
        this.sendMail();
        return;    
    }
    else if(findPW[0].value==""){//빈칸이라면
        alert("정보를 입력해 주세요.");  
    }
    else{
        alert("등록된 정보가 아닙니다. 가입하신 정보를 입력해 주세요.")  
    }
    return event.preventDefault();  
}