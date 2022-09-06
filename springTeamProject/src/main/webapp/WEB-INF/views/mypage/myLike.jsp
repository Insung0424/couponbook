<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			 내가 작성한 글
			</nav>
			<hr />
			
			<section id="container">
			
				<form>
				<input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
					<table>
						<tr>
							<th>유저아이디</th>
							<th>제품번호</th>
							<th>관심상품 등록</th>				
						</tr>
						<c:forEach items="${like}" var = "like">					
							<tr>
								<td><c:out value="${like.user_id}" /></td>
								<td><c:out value="${like.product_id}"/></td>
								<td><c:out value="${like.like_created}"/></td>			
							</tr>
						</c:forEach>	
					</table>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>
			