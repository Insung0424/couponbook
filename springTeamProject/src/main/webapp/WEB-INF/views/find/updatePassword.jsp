<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdatePassword</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<h3>비밀번호 입력</h3>
<p>새로운 비밀번호를 입력해주세요</p>
<form action="/find/changepw" method="post" id=form onsubmit="return pwCheck()">
	<div>
		새로운 비밀번호 : <input type="password" id="password" name="password">
		비밀번호 확인 : <input type="password" id="password-chk">
		<input type="hidden" name="email" value="${mem.email}"/>
		<input type="hidden" name="nickname" value="${mem.nickname}"/>
		<button type="submit" class="btn btn-primary">확인</button>
		<button type="reset" class="btn btn-primary">초기화</button>
	</div>
</form>

<script type="text/javascript">
function pwCheck(){
	let pw1 = $("#password").val();
	let pw2 = $("#password-chk").val();
	let pwChkisTrue;
	
	if(pw1 == ''){
		alert('비밀번호를 입력해주세요');
		$("#password").focus();
		return false;
	}
	if(pw2 == ''){
		alert('확인용 비밀번호를 입력해주세요');
		$("#password-chk").focus();
		return false;
	}
	
	if(pw1.length < 4){
		alert("비밀번호는 4자 이상이어야 합니다");
		pwChkisTrue = false;
		return false;
	}
	
	if( pw1 != pw2){
		alert("입력한 비밀번호가 같지 않습니다");
		pwChkisTrue = false;
		return false;
	} 
	else {
		pwChkisTrue = true;
		return true;
	}
}
</script>
</body>
</html>