<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="en">

<head>

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


<!-- Sidebar -->

<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/category/all">

		<div class="sidebar-brand-text mx-3">CouponBook</div>
	</a>
<form method="get" id="form">
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	
		<input type="hidden" id="session_user_id" name="session_user_id"
			value="${mem.user_id}">
		<li class="nav-item active"><a class="nav-link "
			> <span><input type="submit" formaction="/mypage/checkPassword" onclick="service()" value="내 정보조회" style="border: none; background: transparent;"></span></a></li>

		<hr class="sidebar-divider">
		</form>

		<!-- Heading -->

		<div class="sidebar-heading">마이페이지</div>

		<form method="post" id="form">
		<li class="nav-item"><a class="nav-link"
			style="font-weight: bold;"> <i class="fas fa-fw fa-cog"></i> <span><input
					type="submit" id="myLike" value="관심상품" formaction="/mypage/myLike"
					style="border: none; background: transparent;" onclick="service()"></span>
		</a></li>

		<li class="nav-item"><a class="nav-link"
			style="font-weight: bold;"> <i class="fas fa-fw fa-cog"></i> <span><input
					type="submit" id="myTrade" value="거래내역"
					formaction="/mypage/myTrade"
					style="border: none; background: transparent;" onclick="service()"></span>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			style="font-weight: bold;"> <i class="fas fa-fw fa-cog"></i> <span><input
					type="submit" id="myBoard" value="내가 올린 쿠폰"
					formaction="/mypage/myBoard"
					style="border: none; background: transparent;" onclick="service()"></span>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			style="font-weight: bold;"> <i class="fas fa-fw fa-cog"></i> <span><input
					type="submit" id="myComment" value="내가 단 댓글"
					formaction="/mypage/myComment"
					style="border: none; background: transparent;" onclick="service()"></span>
		</a></li>
		<li class="nav-item"><a class="nav-link"
			style="font-weight: bold;"> <i class="fas fa-fw fa-cog"></i> <span><input
					type="submit" id="delete" value="회원탈퇴"
					formaction="/mypage/delete_info_mypageView"
					style="border: none; background: transparent;" onclick="service()"></span>
		</a></li>
	</form>







	<hr class="sidebar-divider d-none d-md-block">
	<!-- 사이드 바 숨기기 버튼 -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>


</ul>




<!-- Sidebar end -->