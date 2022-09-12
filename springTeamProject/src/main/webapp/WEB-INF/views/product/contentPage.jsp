<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="ko">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>

<style type="text/css">
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/home.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/slide.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/map.css">






</head>

<body style="background-color: #f2f2f2">
	<header>
		<%@include file="/WEB-INF/views/includes/main_header2.jsp"%>
	</header>
	
	<hr style="border: solid 1px black;">

	<div class="container text-center"
		style="margin-top: 30px; margin-bottom: 30px; background-color: white; border-radius: 10px; padding: 30px;">


		<div class=content
			style="margin-top: 30px; margin-bottom: 30px; height: 500px; width: 90%; background-color: white; margin: 0 auto;">


			<p style="text-align: left;">글 내용</p>
			<!-- 받아온 쿠폰 정보를 출력 -->
			<p>상품 ID	:	<c:out value="${onePdt.product_id }" /></p>
			<p>카테고리	:	<c:out value="${onePdt.category_id }" /></p>
			<p>회사이름	:	<c:out value="${onePdt.company_name }" /></p>
			<p>쿠폰이름	:	<c:out value="${onePdt.pd_name }" /></p>
			<p>쿠폰가격	:	<c:out value="${onePdt.pd_price }" /></p>
			<p>거래상태	:	<c:out value="${onePdt.pd_status }" /></p>
				<c:set var="img" value="${fn:split(onePdt.pd_img, ',')[0]}"></c:set>
				<c:set var="simg1" value="${fn:replace(img, '%5C', '/')}"></c:set>
				<c:set var="simg2" value="${fn:replace(simg1, '%3A', ':')}"></c:set>
			<p>쿠폰이미지	: 	<img src="/getImg?fileNameNPath=${simg2}" class="card-img-top" alt="Not Found Image"> </p>
			<p>사용처	: 	 ${onePdt.pd_desc } </p>
			<!-- ckeditor 로 db로 값을 삽입하면 html 태그 전체가 삽입되므로 값자체를 화면에 띄우거나 다른 방법을 사용해야한다 -->
			<p>쿠폰할인율	:	<c:out value="${onePdt.pd_discount }" /></p>
			<p>등록일	:	<c:out value="${onePdt.pd_date }" /></p>
			
   <form name="form1" method="post" 
            action="${path}/product/contentPage/insertL.do">
       <input type="hidden" id="product_id" name="product_id"
                value=1>        
           <input type="hidden" id="user_id" name="user_id"
                value=2>          
                            
                <input type="submit" value="관심상품에 담기">
      </form>




		</div>
		
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		
		<hr style="border: solid 1px black;">

		<div style="background-color: white;">
			<%@ include file="comment.jsp"%>
		</div>

	</div>



	<a id="top_btn">TOP</a>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e243b14fc7e2d54b66eb97ad3a69c95&libraries=services"></script>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 100) {
					$('#top_btn').fadeIn();
				} else {
					$('#top_btn').fadeOut();
				}
			});
			$('#top_btn').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slide.js/"></script>
	<script src="${pageContext.request.contextPath}/resources/map.js/"></script>
</body>
</html>
