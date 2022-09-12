<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CouponBook</title>

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
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body style="background-color: #f2f2f2">

	<header>
		<nav class="navbar navbar-expand-lg" style="background-color: #ddd">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">CouponBook</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">홈</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">전체</a></li>
								<li><a class="dropdown-item" href="#">편의점</a></li>
								<li><a class="dropdown-item" href="#">커피/음료</a></li>
								<li><a class="dropdown-item" href="#">외식</a></li>
								<li><a class="dropdown-item" href="#">상품권</a></li>
								<li><a class="dropdown-item" href="#">기타</a></li>
							</ul></li>
					</ul>
					<div style="margin-right: 50px;">
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="검색어 입력" aria-label="Search" style="width: 300px;">
							<button class="btn btn-light" type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg>
							</button>
						</form>
					</div>

					<c:set var="userID" value="${mem.email}" />
				<c:choose>
					<c:when test="${empty userID}">
						<form class="l-flex" role="signin">
							<a class="btn btn-warning" href="/member/login" style="margin-right: 5px;">로그인</a>
							<a id="custom-login-btn" class="btn btn-lg" 
								href="https://kauth.kakao.com/oauth/authorize?client_id=e90605fb64b5ed5eeffcf586eb651d12&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code">
								<img src="/resources/kakao_login_small.png"
								  height="38px" alt="카카오 로그인 버튼" />
							</a>
						</form>
						<form class="re-flex" role="signup">
							<a class="btn btn-secondary" href="/member/join" style="margin-right: 5px;">회원가입</a>
						</form>
					</c:when>
				
					<c:when test="${!empty userID}">
						<!-- 마이페이지 경로 수정 필요 -->
						<a href="member/myPage" class="btn  btn-outline-warning me-3">마이페이지</a><br><br>
						<a href="member/logout" class="btn btn-danger">로그아웃</a><br><br>
					</c:when>
				</c:choose>
				
				
				</div>
			</div>
		</nav>
	</header>
	<h1 style="margin-left: 250px; margin-top: 50px;">기한 임박 쿠폰</h1>
	<div class="container text-center" style="margin-top: 30px;">
	
		<div class="row">
				<%-- 받아온 전체쿠폰  목록 --%>
				<c:forEach items="${pdtList }" var="pdtList">
			<div class="col">
			
				<%-- 쿠폰상페보기 링크 --%>
				<a class="card-link" href='/product/contentPage?product_id=<c:out value="${pdtList.product_id }"/>'
					style="text-decoration: none; color: black; text-align: left;">
					<div class="card" style="width: 18rem;">
					<c:set var="img" value="${fn:split(pdtList.pd_img, ',')[1]}"></c:set>
					<c:set var="simg1" value="${fn:replace(img, '%5C', '/')}"></c:set>
					<c:set var="simg2" value="${fn:replace(simg1, '%3A', ':')}"></c:set>
						<img src="/getImg?fileNameNPath=${simg2}" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-id"><c:out value="${pdtList.product_id }" /></p>
							<!-- product_id는 없어도 될 듯함  -->
							<p class="card-title"><c:out value="${pdtList.pd_name }" /></p>
							<div class="card-price">가격 <c:out value="${pdtList.pd_price }" />원</div>
							<div class="card-variety">사용처 <c:out value="${pdtList.company_name }" /></div>
							<!-- pd_desc을 사용처말고 company_name 을 사용처로 변경  -->
						</div>
					</div>
				</a>
			</div>
				</c:forEach>
		</div>
	</div>
	<h1 style="margin-left: 250px; margin-top: 50px;">인기 쿠폰</h1>
	<div class="container text-center"
		style="margin-top: 30px; margin-bottom: 30px;">
		<div class="row">
			<div class="col">
				<a class="total" href="#"
					style="font-weight: bold; text-decoration: none; color: black;">전체쿠폰 보기</a>
			</div>
		</div>
	</div>
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