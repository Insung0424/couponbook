<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="${pageContext.request.contextPath}/mypage/sendEmail" method="post">
	
	<input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
	<input type="hidden" id="email" name="email" value="${user.email}">
		<div class="input_1">
			<laber>신고 제목</laber>
			<input type="text" name="re_title" placeholder="신고 제목" required="">
		</div>	
		<div class="input_2">
			<laber>신고 내용</laber>
			<input type="text" name="re_content" placeholder="신고 내용" required="">
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