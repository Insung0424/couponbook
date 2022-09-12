<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
	<meta charset="UTF-8">
	<title>로그인 임시 메인</title>
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
</head>
<body class="text-center mt-5">
	<main class="form-signin w-50 m-auto ">
		<h1>임시 메인 화면</h1>
		
		<c:set var="userID" value="${mem.user_id}" />
		<c:choose>
			<c:when test="${empty userID}">
				<p>로그인 전</p>
				<a href="join" class="w-75 btn btn-lg btn-outline-warning">회원가입</a><br><br>
				<a href="login" class="w-75 btn btn-lg btn-warning">로그인</a><br><br>
			</c:when>
			
			<c:when test="${!empty userID}">
				${mem.user_name } 로그인 성공
				<p>${mem.user_id } // ${mem.nickname } // ${mem.email }</p>
				<a href="myPage" class="w-75 btn btn-lg btn-outline-warning">마이페이지</a><br><br>
				<a href="logout" class="w-75 btn btn-lg btn-danger">로그아웃</a><br><br>
			</c:when>
		</c:choose>
		
		
	</main>
</body>
</html>