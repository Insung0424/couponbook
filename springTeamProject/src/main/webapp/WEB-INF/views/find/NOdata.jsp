<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOdata</title>
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
		${result} <br>
		<div style="margin-top: 5px;">
		<a href="/find/idnpassword" class="btn btn-primary">다시 조회하기</a> <a
			href="/" class="btn btn-primary">확인</a></div>
	</div>
</body>
</html>