<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="ko">
<head>
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
								<li><a class="dropdown-item" href="/category/all">전체</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=1">편의점</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=2">커피/음료</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=3">외식</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=4">상품권</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=5">기타</a></li>
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
						<a href="/member/myPage" class="btn  btn-outline-warning me-3">마이페이지</a><br><br>
						<a href="/member/logout" class="btn btn-danger">로그아웃</a><br><br>
					</c:when>
				</c:choose>
				
				
				</div>
			</div>
		</nav>
	</header>
	<div class="container text-center" style="margin-top: 30px;">
		<div class="row">
			<div class="col">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="https://image10.coupangcdn.com/image/ccm/banner/8a80aeb91c702f39b87d93386e0c4168.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://static.coupangcdn.com/fa/cmg_paperboy/image/1661232568819/C1_PC1.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://static.coupangcdn.com/aa/cmg_paperboy/image/1661418271864/%5B%EC%88%98%EC%A0%951%5D220826_%EC%99%80%EC%9A%B0%EC%9C%84%ED%81%AC_A_SMD-20383_PC.jpg"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<h1 style="margin-left: 250px; margin-top: 50px;">
	<c:set var="category_id" value="${param.category_id }"/>
								<c:if test="${category_id eq 1}">
								편의점
								</c:if>
								<c:if test="${category_id eq 2}">
								커피/음료
								</c:if>
								<c:if test="${category_id eq 3}">
								외식
								</c:if>
								<c:if test="${category_id eq 4}">
								상품권
								</c:if>
								<c:if test="${category_id eq 5}">
								기타
								</c:if>
									
								</h1>
							
	<div class="container text-center" style="margin-top: 30px;">
	
		<c:forEach items="${list_cat }" var="list_cat">
	
		<div class="row">
			<div class="col">

				<a class="card-link" href="#"
					style="text-decoration: none; color: black; text-align: left;">
					<div class="card" style="width: 18rem;">
						<img
							src="data:image/png;base64,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"
							class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-title"><c:out value="${list_cat.pd_name }" /></p>
							<div class="card-price">가격<c:out value="${list_cat.pd_price }" /></div>
							<div class="card-variety">종류<c:set var="category_id" value="${list_cat.category_id }"/>
								<c:if test="${category_id eq 1}">
								편의점
								</c:if>
								<c:if test="${category_id eq 2}">
								커피/음료
								</c:if>
								<c:if test="${category_id eq 3}">
								외식
								</c:if>
								<c:if test="${category_id eq 4}">
								상품권
								</c:if>
								<c:if test="${category_id eq 5}">
								기타
								</c:if>
</div>
						</div>
					</div>
				</a>

			</div>
		</div>
		</c:forEach>
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