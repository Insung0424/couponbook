<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세페이지</title>
	<!-- 부트스트랩 4.6.2 CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
</head>
<body class = "px-5 py-5">

	<h3>상세페이지 확인</h3><hr>
	
	<!-- 받아온 쿠폰 정보를 출력 -->
		<p>상품 ID	:	<c:out value="${onePdt.product_id }" /></p>
		<p>카테고리	:	<c:out value="${onePdt.category_id }" /></p>
		<p>회사이름	:	<c:out value="${onePdt.company_name }" /></p>
		<p>쿠폰이름	:	<c:out value="${onePdt.pd_name }" /></p>
		<p>쿠폰가격	:	<c:out value="${onePdt.pd_price }" /></p>
		<p>거래상태	:	<c:out value="${onePdt.pd_status }" /></p>
		<p>비고	:	<c:out value="${onePdt.pd_desc }" /></p>
		<p>쿠폰할인율	:	<c:out value="${onePdt.pd_discount }" /></p>
		<p>등록일	:	<c:out value="${onePdt.pd_date }" /></p>


</body>
</html>