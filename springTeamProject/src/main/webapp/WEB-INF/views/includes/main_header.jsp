<!DOCTYPE html><%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>마이페이지</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/home.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/resources/css/style.css">


<style type="text/css">
.category_box li {
	float: left;
	margin-left: 50px;
	font-weight: bold;
	font-size: 20px;
}

.category_box li a {
	color: black;
}


</style>
</head>

<script type="text/javascript">
	function service() {

		var check = "${mem}";
		if (check == "") {
			alert("로그인 후 이용하세요");
			event.preventDefault();
			location.href = "/member/login";
		} else {
			return true;
		}

	}
</script>


<!------------------------------------------------------------------------------------  -->
<!-- Page Wrapper -->
<header
	class="navbar navbar-expand navbar-light bg-white topbar  static-top shadow"
	id="">
	<script async src="https://cse.google.com/cse.js?cx=80cd685c6894246e8">
		
	</script>

<a href="/category/all" class="logo" style="font-size: 40px; font-family:Bahnschrift; margin-top: 50px; margin-left: 150px; z-index: 1;" >CouponBook</a>

	<form method="get">
		<div class="input-group">
			<div class="form-outline">
				<input id="search" type="text" name="search" class="form-control"
					placeholder="상품 검색" style="width: 700px; margin-left: 180px;" />

			</div>
			<button id="search-button" type="submit" class="btn btn-primary"
				formaction="/category/all_search">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</form>


	<ul class="navbar-nav ml-auto" style="text-align: center;">
		<a href="/write" class="btn w-100 h-50 mt-3 btn-primary"
			style="color: white;">상품등록</a>
		<div class="topbar-divider d-none d-sm-block"></div>




		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" id="userDropdown" role="button"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small"> <c:if
						test="${mem==null}">로그인을 해주세요</c:if> <c:if test="${mem!=null}">${mem.nickname }</c:if>
			</span> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path
						d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
</svg>
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<form method="get">
					<input type="hidden" id="session_user_id" name="session_user_id"
						value="${mem.user_id}"> <a class="dropdown-item"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i><input
						type="submit" value="내 정보" formaction="/mypage/checkPassword"
						style="border: none; background: transparent;" onclick="service()">

					</a>
				</form>
				<form method="post">
					<input type="hidden" id="session_user_id" name="session_user_id"
						value="${mem.user_id}"> <a class="dropdown-item"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> <input
						type="submit" value="관심상품" formaction="/mypage/myLike"
						style="border: none; background: transparent;" onclick="service()">
					</a> <a class="dropdown-item"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i><input
						type="submit" value="거래내역" formaction="/mypage/myTrade"
						style="border: none; background: transparent;" onclick="service()">
					</a> <a class="dropdown-item"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> <input
						type="submit" value="내가 올린 쿠폰" formaction="/mypage/myBoard"
						style="border: none; background: transparent;" onclick="service()">
					</a> <a class="dropdown-item"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> <input
						type="submit" value="내 댓글" formaction="/mypage/myComment"
						style="border: none; background: transparent;" onclick="service()">
					</a>
				</form>
				<div class="dropdown-divider"></div>
				<c:if test="${mem==null}">
					<a class="dropdown-item" href="/member/login"
						data-target="#loginModal"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그인

					</a>
				</c:if>
				<c:if test="${mem!=null}">
					<a class="dropdown-item" href="/logout" data-target="#logoutModal"><i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>로그아웃
					</a>
				</c:if>
			</div></li>


	</ul>
</header>
<nav class="navbar  bg-white shadow mb-5">

	<ul style="list-style: none; margin: 0 auto;" class="category_box">
		<li><a href="/category/all">전체</a></li>
		<li><a href="/category/category?category_id=1">편의점</a></li>
		<li><a href="/category/category?category_id=2">커피/음료</a></li>
		<li><a href="/category/category?category_id=3">외식</a></li>
		<li><a href="/category/category?category_id=4">상품권</a></li>
		<li><a href="/category/category?category_id=5">기타</a></li>

	</ul>


</nav>
