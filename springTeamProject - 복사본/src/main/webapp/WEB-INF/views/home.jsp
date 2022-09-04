<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>
<a href="/board/list">게시판</a><br />
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="mypage/logout";
		})
			$("#UpdateBtn").on("click", function(){
			location.href="mypage/updateView?user_id=${user_id}";
		})
		
	})

</script>
<body>
	<form name='homeForm' method="post" action="/mypage/login">
		<c:if test="${user == null}">
			<div>
				<label for="user_id"></label>
				<input type="text" id="user_id" name="user_id">
			</div>
			<div>
				<label for="password"></label>
				<input type="password" id="password" name="password">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${user != null }">
			<div>
				<p>${user.user_id}님 환영 합니다.</p>
				<button id="UpdateBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
<a href="/mypage/myInfo">myinfo</a>
<a href="/mypage/delete_info_mypageView">delete_info</a>
<a href="/mypage/myBoard?user_id=${user.user_id}">myboard</a>
<a href="/mypage/myComment?user_id=${user.user_id}">mycomment</a>
<a href="/mypage/myLike?user_id=${user.user_id}">mylike</a>
<a href="/mypage/myReport?user_id=${user.user_id}">myreport</a>
<a href="/mypage/myTrade?user_id=${user.user_id}">mytrade</a>

</body>
</html>
