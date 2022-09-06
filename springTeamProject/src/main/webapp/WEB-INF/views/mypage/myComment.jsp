<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>댓글</title>
	</head>
	<body>
		<div id="root">
			<header>
				<h1> 댓글</h1>
			</header>
			<hr />
			 
			<nav>
			 내가 작성한 댓글
			</nav>
			<hr />			
			<section id="container">
			
				<form>
				<input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
					<table>
						<tr>
							<th>제품번호</th>
							<th>유저아이디</th>
							<th>댓글내용</th>
							<th>게시시간</th>						
						</tr>
						<c:forEach items="${comment}" var = "comment">					
							<tr>
								<td><c:out value="${comment.product_id}" /></td>
								<td><c:out value="${comment.user_id}"/></td>
								<td><c:out value="${comment.comment_content}"/></td>
								<td><c:out value="${comment.comment_write_time}"/></td>
							</tr>
						</c:forEach>						
					</table>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>
				
				