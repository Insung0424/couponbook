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
							<th>제품아이디</th>
							<th>구매자</th>
							<th>판매자</th>
							<th>거래상태</th>
							<th>거래시간</th>					
						</tr>
						<c:forEach items="${trade}" var = "trade">					
							<tr>
								<td><c:out value="${trade.product_id}" /></td>
								<td><c:out value="${trade.buyer_user_id}"/></td>
								<td><c:out value="${trade.sell_user_id}"/></td>
								<td><c:out value="${trade.pd_status}"/></td>
								<td><c:out value="${trade.trade_time}"/></td>
							</tr>
						</c:forEach>	
					</table>
				</form>
			</section>
			<hr/>
		</div>
	</body>
</html>
				