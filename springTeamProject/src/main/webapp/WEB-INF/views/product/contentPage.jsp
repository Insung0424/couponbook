<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="en">
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




	<div class="container text-center"
		style="margin-top: 30px; margin-bottom: 30px; background-color: white; border-radius: 10px; padding: 30px;">



		<div class=row style="margin-bottom: 50px; margin-top: 50px;">
			<div class="col">
				<div class="slide slide_wrap">

					<div class="slide_item"></div>

					<div class="slide_item"></div>
					<div class="slide_item"></div>
				</div>

				<div class="slide_prev_button slide_button">◀</div>
				<div class="slide_next_button slide_button">▶</div>
				<ul class="slide_pagination" id="slide_pagination"></ul>
			</div>
			<div class=col>

				<h4 style="text-align: left;">제목</h4>
				<p style="text-align: left;">카테고리</p>
				<h3 style="text-align: left;">가격</h3>
			</div>

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


		<div class=content
			style="margin-top: 30px; margin-bottom: 30px; height: 500px; width: 90%; background-color: white; margin: 0 auto;">


			<p style="text-align: left;">글 내용</p>


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
