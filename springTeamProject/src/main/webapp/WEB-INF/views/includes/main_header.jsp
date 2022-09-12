<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/home.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="resources/css/style.css">


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

<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


	<!-- Topbar Search -->
	<form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="검색어 입력" aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

	<ul class="navbar-nav ml-auto">

		<li class="nav-item dropdown no-arrow d-sm-none"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- Dropdown - Messages -->
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>


		<a href="/write" class="btn w-100 h-50 mt-3 btn-primary">상품등록</a>
				<div class="topbar-divider d-none d-sm-block"></div>
		<!-- Nav Item - Alerts -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 small">카테고리</span>
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="/category/all"> 전체 </a> <a
					class="dropdown-item" href="/category/category?category_id=1">
					편의점 </a> <a class="dropdown-item"
					href="/category/category?category_id=2"> 커피/음료 </a> <a
					class="dropdown-item" href="/category/category?category_id=3">
					외식 </a> <a class="dropdown-item"
					href="/category/category?category_id=4"> 상품권 </a> <a
					class="dropdown-item" href="/category/category?category_id=5">
					기타 </a>
				<div class="dropdown-divider"></div>

			</div></li>



		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" id="userDropdown" role="button"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small"><c:if
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
				<form method="post">
					<input type="hidden" id="session_user_id" name="session_user_id"
						value="${mem.user_id}"> <a class="dropdown-item"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i><input
						type="submit" value="내 정보" formaction="/mypage/myInfo"
						style="border: none; background: transparent;" onclick="service()">
					</a> <a class="dropdown-item"> <i
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
</nav>