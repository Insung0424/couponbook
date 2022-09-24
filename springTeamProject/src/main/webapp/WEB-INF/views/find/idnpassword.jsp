<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
html {
	height: 100%;
}

#find{
	text-align: center;
	margin: 0 auto;
	margin-top: 10%;
}

#findIdnNickPhone, #findPasswordnChage {
	height: 100%;
	margin: 0 auto;
	text-align: center;
	margin-top: 30%;
}

.panel-title {
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="container" style="height: 100%">
		
		<div id="find">
			<input class="btn btn-link" id="findId" type="button" value="아이디 찾기" />
			&nbsp; 
			<input class="btn btn-link" id="findPassword" type="button" value="비밀번호 찾기" />
		</div>
			
		<div id="findIdnNickPhone">
		
			
			<div class="form-group">
				<input class="btn btn-link" id="findIdNickname" type="button" value="닉네임으로 아이디 찾기" />
				&nbsp;
				<input class="btn btn-link" id="findIdPhone" type="button" value="전화번호로 아이디 찾기" />
			</div>
			
			<div class="panel-heading">
				<h3 class="panel-title">아이디 찾기</h3>
			</div>
			
			<div id="findNickname">
				<p>회원가입시 입력한 닉네임을 입력해주세요</p>
				<div class="form-group">
					<form action="/find/findIdNickname" method="post"
						onsubmit="return checkNickname()" id="form1">
						<input class="form-control" type="text" name="nickname"
							id="nickname" style="width: 300px; margin: 0 auto;"
							placeholder="닉네임  입력">
						<div style="margin-top: 5px;">
							<button class="btn btn-primary">확인</button>
							<input type="button" value="돌아가기" id="back1"
								class="btn btn-primary" />
						</div>
					</form>
				</div>
			</div>

			<div id="findphone" style="display: none;">
				<p>회원가입시 입력한 전화번호를 입력해주세요</p>
				<form action="/find/findIdPhone" method="post"
					onsubmit="return checkPhone()" id="form2">
					<input type="text" class="form-control" id="phone"
						placeholder="전화번호 입력" style="width: 300px; margin: 0 auto;">
					<div style="margin-top: 5px;">
						<button class="btn btn-primary">확인</button>
						<input type="button" value="돌아가기" id="back2"
							class="btn btn-primary" />
					</div>
				</form>
			</div>

		</div>

	
	
		<div id="findPasswordnChage" style="display: none;">
		
			<div class="form-group">
				<input class="btn btn-link" id="findemailNickname" type="button" value="이메일과 닉네임으로 비밀번호 찾기" />
				&nbsp;
				<input class="btn btn-link" id="findemailPhone" type="button" value="이메일과 전화번호로 비밀번호 찾기" />
			</div>
			
			<div class="panel-heading">
				<h3 class="panel-title">비밀번호 찾기</h3>
			</div>
			
			<div id="findpasswordnick">
				<p>회원가입시 입력한 이메일과 닉네임을 입력해주세요</p>
				<form action="/find/checknicknamenemail" method="post" onsubmit="return checkPass()" id="form3">
					<input class="form-control" type="email" name="email" id="passemail" style="width: 300px; margin: 0 auto;" placeholder="이메일 입력"><br>
					<input class="form-control" type="text" name="nickname" id="passnickname" style="width: 300px; margin: 0 auto;" placeholder="닉네임 입력">
					<br>
					<button class="btn btn-primary">확인</button>
					<input type="button" value="돌아가기" id="back3" class="btn btn-primary"/>
				</form>
			</div>
			
			<div id="findpasswordphone" style="display: none;">
				<p>회원가입시 입력한 이메일과 전화번호를 입력해주세요</p>
				<form action="/find/checkphonenemail" method="post" onsubmit="return checkPass2()" id="form4">
					<input class="form-control" type="email" name="email" id="passemail2" style="width: 300px; margin: 0 auto;" placeholder="이메일 입력"><br>
					<input class="form-control" type="text" id="passphone" style="width: 300px; margin: 0 auto;" placeholder="전화번호 입력">
					<br>
					<button class="btn btn-primary">확인</button>
					<input type="button" value="돌아가기" id="back4" class="btn btn-primary"/>
				</form>
			</div>
			
		</div>
		
	</div>
<script src="/../resources/find.js" ></script>
</body>
</html>