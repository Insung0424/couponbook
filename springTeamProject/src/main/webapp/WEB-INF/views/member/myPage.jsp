<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
	<meta charset="UTF-8">
	<title>마이페이지 임시 화면</title>
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
</head>
<body class="text-center mt-5">
	<main class="w-50 m-auto ">
		<h1>${mem.user_name } 마이페이지</h1>
			
			${userID}
			<p>${mem.user_id } // ${mem.nickname } // ${mem.email }</p>
			<hr class="my-4">
			
			<a href="/" class="w-75 btn btn-lg btn-outline-warning">임시메인</a><br><br>
			<a href="logout" class="w-75 btn btn-lg btn-danger">로그아웃</a><br><br>
		
	</main>
</body>
</html>