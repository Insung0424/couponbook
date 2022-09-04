<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="${pageContext.request.contextPath}/mypage/sendEmail" method="post">
	<input type="hidden" id="email" name="email" value="${user.email}">
		<div class="input_1">
			<laber>신고 제목</laber>
			<input type="text" name="title" placeholder="신고 제목" required="">
		</div>	
		<div class="input_2">
			<laber>신고 내용</laber>
			<input type="text" name="content" placeholder="신고 내용" required="">
		</div>	
		
		<div>
			<div class="click">
				<input type="submit" value="신고하기">			
			</div>
		</div>
	
	</form>
</div>
</body>
</html>