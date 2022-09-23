<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<style type="text/css">
html {
	height: 100%;
}

#box {
	height: 100%;
	margin: 0 auto;
	text-align: center;
	margin-top: 30%;
}
</style>
</head>
<body>
	<div id="box">

		회원님의 ID는 ${result} 입니다
		<div style="margin-top: 5px;">
			<a href="/" class="btn btn-primary">확인</a>
		</div>
	</div>

</body>
</html>