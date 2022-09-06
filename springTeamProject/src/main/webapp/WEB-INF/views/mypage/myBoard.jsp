<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>내가 작성한 글</title>
	</head>
	<body>
		<div id="root">
			<header>
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
							<th>글번호</th>
							<th>상품번호</th>
							<th>글제목</th>
							<th>유저아이디</th>
							<th>글내용</th>
							<th>게시시간</th>
							<th>할인율</th>
							<th>유효기간</th>						
						</tr>
						<c:forEach items="${board}" var = "board">					
							<tr>
								<td><c:out value="${board.board_no}" /></td>
								<td><c:out value="${board.product_id}"/></td>
								<td><c:out value="${board.board_title}"/></td>
								<td><c:out value="${board.user_id}"/></td>
								<td><c:out value="${board.board_content}"/></td>
								<td><c:out value="${board.board_write_time}"/></td>
								<td><c:out value="${board.pd_discount}"/></td>
								<td><c:out value="${board.pd_date}"/></td>	
							</tr>
						</c:forEach>	
					</table>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>