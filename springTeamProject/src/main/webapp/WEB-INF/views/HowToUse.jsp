<%@ page language="java" pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="ko">
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CouponBook</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/home.css">

<style type="text/css">
header {
	position: sticky;
	top: 0;
	z-index: 10;
}

.card-link {
	display: inline-block;
	margin: 0 auto;
	padding: 10px;
}

#top_btn {
	position: fixed;
	right: 20px;
	bottom: 15px;
	z-index: 9;
	display: inline;
	width: 48px;
	padding: 10px 0px;
	border-radius: 5px;
	background-color: rgba(50, 50, 50, 0.8);
	text-align: center;
	line-height: 1;
	font-size: 14px;
	color: #ffffff;
	cursor: pointer;
}
img{
	margin: 20px 0;
}
.index {
	margin-left: 30px;
}
a{
	margin-left: 30px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body style="background-color: #f2f2f2">

<div id="content" style="width: 100; min-height: 100%; position: relative; margin: 0;">

	<header>
		<%@include file="/WEB-INF/views/includes/main_header.jsp"%>
	</header>
				
	<div class="card shadow mb-4" style="width: 90%; margin: 0 auto;">

				
				<!-- 헤더를 제외하고 제일 위, 첫번째로 나와야함 -->
				<img src="../resources/img/001.png">
				<hr style="height: 30px; background:black;">
				
				<!-- 아래 목차 div 와 img 002가 같은 라인에 있어야함 -->
				<div class="index"><h1>목차</h1>
					<div><h2><a href="#s-1">1. 메인페이지</a></h2></div>
					<div><h2><a href="#s-2">2. 상품등록</a></h2></div>
					<div><h2><a href="#s-3">3. 상세페이지1</a></h2></div>
					<div><h2><a href="#s-4">4. 상세페이지2</a></h2></div>
					<div><h2><a href="#s-5">5. 부록</a></h2></div>
				</div>
				<img src="../resources/img/002.png">
				
				<!-- 메인페이지 -->
				<h2><a id="s-1">1. 메인페이지</a></h2>
				<hr> 
				<img src="../resources/img/003.png">
				<hr style="height: 20px; background:black;">
				<!-- 상품등록 -->
				<h2><a id="s-2">2. 상품등록</a></h2>
				<hr>
				<img src="../resources/img/004.png">
				<hr style="height: 20px; background:black;">
				<!-- 상세페이지1 -->
				<h2><a id="s-3">3. 상세페이지1</a></h2>
				<hr>
				<img src="../resources/img/005.png">
				<hr style="height: 20px; background:black;">
				<!-- 상세페이지2 -->
				<h2><a id="s-4">4. 상세페이지2</a></h2>
				<hr>
				<img src="../resources/img/006.png">
				<hr style="height: 20px; background:black;">
				<!-- 부록 -->
				<h2><a id="s-5">5. 부록</a></h2>
				<hr>
				<img src="../resources/img/007.png">
				<img src="../resources/img/008.png">
				<hr style="height: 20px; background:black;">
				<!-- thank you -->
				<hr>
				<img src="../resources/img/009.png">
	
	</div>
</div>
	<%@include file="/WEB-INF/views/includes/main_footer.jsp"%>
	
	<a id="top_btn">TOP</a>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 100) {
					$('#top_btn').fadeIn();
				} else {
					$('#top_btn').fadeOut();
				}
			});
			$('#top_btn').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>