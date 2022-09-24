<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdatePassword</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
html {
	height: 100%;
}

#box {
	height: 100%;
	margin: 0 auto;
	text-align: center;
	margin-top: 20%;
}
</style>
</head>
<body>
	<div id="box">
		<h3 style="font-weight: bold;">비밀번호 입력</h3>
		<p>비밀번호가 초기화됬습니다</p>
		<p>새로운 비밀번호를 입력해주세요</p>
		<form action="/find/changepw" method="post" id=form
			onsubmit="return pwCheck()">
			<div>
				새로운 비밀번호  <input class="form-control" type="password" id="password"
					name="password" placeholder="새로운 비밀번호를 입력해주세요"
					style="width: 300px; margin: 0 auto; margin-bottom: 5px; margin-top: 5px;">
				비밀번호 확인  <input class="form-control" type="password"
					id="password-chk" placeholder="비밀번호 확인"
					style="width: 300px; margin: 0 auto; margin-top: 5px;"> <input
					type="hidden" name="email" value="${mem.email}" /> <input
					type="hidden" name="nickname" value="${mem.nickname}" /> <input
					type="hidden" name="phone" value="${mem.phone}" />

				<div style="margin-top: 5px;">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="reset" class="btn btn-primary">초기화</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		function pwCheck() {
			let pw1 = $("#password").val();
			let pw2 = $("#password-chk").val();
			let pwChkisTrue;

			if (pw1 == '') {
				alert('비밀번호를 입력해주세요');
				$("#password").focus();
				return false;
			}
			if (pw2 == '') {
				alert('확인용 비밀번호를 입력해주세요');
				$("#password-chk").focus();
				return false;
			}

			if (pw1.length < 4) {
				alert("비밀번호는 4자 이상이어야 합니다");
				pwChkisTrue = false;
				return false;
			}

			if (pw1 != pw2) {
				alert("입력한 비밀번호가 같지 않습니다");
				pwChkisTrue = false;
				return false;
			}
			
			pwChkisTrue = true;
			return true;
			
		}
	</script>
</body>
</html>