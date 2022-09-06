<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>내 신고</title>
	</head>
	<body>
		<div id="root">
			<header>
				<h1> 내 신고</h1>
			</header>
			<hr />
			 
			<nav>
			 내 신고
			</nav>
			<hr />
			
			<section id="container">	
				<form>
				<input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
					<table>
						<tr>
							<th>유저아이디</th>
							<th>신고제목</th>
							<th>신고내용</th>
							<th>신고시간</th>				
						</tr>
						<c:forEach items="${report}" var = "report">					
							<tr>
								<td><c:out value="${report.user_id}" /></td>
								<td><c:out value="${report.re_title}"/></td>
								<td><c:out value="${report.re_content}"/></td>
								<td><c:out value="${report.re_time}"/></td>
							</tr>
						</c:forEach>	
					</table>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>