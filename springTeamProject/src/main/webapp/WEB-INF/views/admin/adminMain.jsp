<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 메인화면</title>
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
	<script  type="text/javascript">alert("관리자 로그인");</script>
</head>
<body class="text-center mt-5">
	<main class="w-50 m-auto ">
	   <%
			if( (String)session.getAttribute("msg") != null){
		%>
			<script>
				alert('${msg}');
			</script>
		<%
			}
		%>
		<h1>${admin.user_name } 관리자</h1>
			
			<p>${admin.user_id } // ${admin.nickname } // ${admin.email }</p>
			<hr class="my-4">
			
			<a href="/" class="w-75 btn btn-lg btn-outline-warning">임시메인</a><br><br>
			<a href="logout" class="w-75 btn btn-lg btn-danger">로그아웃</a><br><br>
		
	</main>
</body>
</html>