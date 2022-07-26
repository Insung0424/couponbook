
<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<head>
<link rel="shortcut icon"
	href='<c:url value="/resources/favicon.png" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/favicon.png" />'
	type="image/x-icon">

<meta name="google-site-verification"
	content="W2SP-3NSepUh9GRqINVyqPzBUn54Jb_MQaqgDfllql4" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>CouponBook</title>

<!-- Custom fonts for this template-->
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





<style type="text/css">
.card_title {
	display: block;
	font-weight: 600;
	color: #212529;
	font-size: 16px;
	line-height: 18px;
	margin-top: 10px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.card_poto {
	height: 160px;
	overflow: hidden;
	background-color: #f8f9fa;
	border-radius: 8px;
}

.card_adr {
	font-size: 14px;
	line-height: 18px;
	margin-top: 6px;
	color: #868e96;
	text-align: left;
}

.card_option {
	font-weight: 600;
	color: #ff8a3d;
	font-size: 15px;
	line-height: 18px;
	margin-top: 6px;
	text-align: left;
}

.card_like {
	font-weight: 600;
	color: black;
	font-size: 15px;
	line-height: 18px;
	margin-top: 6px;
	text-align: left;
}

.title_name {
	font-weight: 900;
	color: #212529;
	font-size: 25px;
	margin: 30px 70px;;
	text-align: left;
}

.more_btn, .more_btn2 {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 50px;
	cursor: pointer;
	width: 100%;
	color: #868e96;
	font-size: 16px;
	border-top: 1px solid #e9ecef;
	font-size: 25px;
}

.card_dis, .card_dis2 {
	display: none;
}

#card_content:hover {
	text-decoration: none;
}
/* 슬라이더 css */
section, ul, dl, dd {
	margin: 0;
	padding: 0;
}

.slider {
	list-style: none;
	height: 500px;
	overflow: hidden;
}

.slider:after {
	content: '';
	display: block;
	clear: both;
}

.slider li {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 500px;
	opacity: 0;
}

.slider li div {
	width: 100%;
	height: 100%;
	background-size: cover;
	position: relative;
}

.slider li dl {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	left: 20px;
}

.slider li .right {
	left: auto;
	right: 20px;
	text-align: right;
}

.slider li dt {
	color: #fff;
	font-size: 3rem;
	text-shadow: 1px 1px 10px #444;
}

.slider li dd {
	color: #fff;
	text-shadow: 1px 1px 10px #444;
}

.btn {
	text-align: center;
}

.btn button {
	margin-top: 10px;
	border: 1px solid #ccc;
	background-color: #fff;
	color: #666;
	font-size: 1.5rem;
	cursor: pointer;
}
.howtouse:hover{
	cursor: pointer;
}
</style>
</head>



<!------------------------------------------------------------------------------------  -->

<body id="page-top">

	<!-- Page Wrapper -->

	<!-- Main Content -->
	<div id="content"
		style="width: 100; min-height: 100%; position: relative; margin: 0;">

		<%@include file="/WEB-INF/views/includes/main_header.jsp"%>

		<!------------------------------------------------------------------------------------------  -->




		<div class="card shadow mb-4" style="width: 1200px; margin: 0 auto;">
			<div class="container"
				style="background-color: white; margin-bottom: 30px; border-radius: 10px;">


				<section>
					<ul class="slider">
						<li>
							<div
								style="background-image: url(../resources/img/couponbook.jpg)">
								<dl class="right">
									<dt>사용하지 않는 쿠폰</dt>
									<dd>간단하게 판매해보자</dd>
								</dl>
							</div>
						</li>
						<li>
							<div
								style="background-image: url(../resources/img/couponbook.jpg);">
								<dl class="right">
									<dt>팔면 돈되고 안팔면 똥된다</dt>
									<dd>안쓰는 쿠폰으로 용돈 만들기</dd>
								</dl>
							</div>
						</li>
						<li>
							<div style="background-image: url(../resources/img/HowToUse.jpg);" class="howtouse" onclick="link_use()">
								<dl class="right">
									<dt></dt>
									<dd></dd>
								</dl>
							</div>
						</li>
						<li>
							<div
								style="background-image: url(../resources/img/How.png); width:100%;">
								<dl class="right">
									<dt></dt>
									<dd></dd>
								</dl>
							</div>
						</li>
					</ul>
					<div class="btn" style="display: none;">
						<button type="button" id="prev"></button>
						<button type="button" id="next"></button>
					</div>
				</section>


				<p class="title_name">전체쿠폰</p>
				<!--  -->

				<ul style="width: 100%; display: flex; flex-wrap: wrap;">
					<c:forEach items="${list_all }" var="list_all">

						<li
							style="list-style: none; margin-left: 25px; margin-bottom: 25px; width: 30%; border-radius: 15px; box-shadow: 5px 5px 5px grey;"
							class="card_dis"><a id="card_content"
							href='/category/detail?product_id=<c:out value="${list_all.product_id }"/>'>
								<div class="card_poto">
									<c:set var="img" value="${fn:split(list_all.pd_img, ',')[1]}"></c:set>
									<c:set var="simg2" value="${fn:replace(img, '%2F', '/')}"></c:set>

									<img style="width: 100%; height: 100%;"
										src="/getImg?fileNameNPath=${simg2}" alt="Not Found Image">

								</div>
								<div class="card_info">

									<div class="card_title_content">

										<p class="card_title">${list_all.pd_name }</p>
									</div>
									<c:set var="price1" value="${list_all.pd_price0 }"></c:set>
									<c:set var="price2" value="${list_all.pd_price }"></c:set>
									<p class="card_adr" style="text-decoration: line-through;">${price1 }원</p>

									<p class="card_adr" style="">${price2 }원</p>
									<p class="card_adr" id="p_discount"
										style="color: red; font-size: 2em; font-weight: bold; text-align: right;">${list_all.pd_discount }%</p>
									<!-- 원래 할인율 출력을 위해 짜려던 동적태그생성방식 깜빡하고 그냥 태그에 바로 값을 넣어서 오류가 생긴거였음 
                             
                                 <script>
                                 	let pd_discount = Math.round(eval(100-((${price2 }/${price1 })*100)));
									let discount_html = "<span>"+pd_discount+"%</span>";                                 	
                                 	$("#p_discount").html(discount_html);
                                 </script> -->
									<div>
										<p class="card_option" style="display: inline-block;">
											<c:set var="category_id" value="${list_all.category_id }" />
											<c:if test="${category_id eq 1}">
                        편의점
                        </c:if>
											<c:if test="${category_id eq 2}">
                        커피/음료
                        </c:if>
											<c:if test="${category_id eq 3}">
                        외식
                        </c:if>
											<c:if test="${category_id eq 4}">
                        상품권
                        </c:if>
											<c:if test="${category_id eq 5}">
                        기타
                        </c:if>
										</p>

										<p class="card_like"
											style="display: inline-block; float: right; margin-right: 1rem;">
											<c:set var="like" value="${list_all.pd_like}" />
											<c:if test="${like eq 0 }">

												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor"
													class="bi bi-chat-square-heart" viewBox="0 0 16 16">
  <path
														d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12ZM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Z" />
  <path
														d="M8 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
</svg>
											</c:if>
											<c:if test="${like ne 0 }">
												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor"
													class="bi bi-chat-square-heart" viewBox="0 0 16 16">
  <path
														d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12ZM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Z" />
  <path
														d="M8 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
</svg>${like}
											</c:if>

										</p>
									</div>
								</div>
						</a></li>
					</c:forEach>

				</ul>

				<div class="more_btn" id="load">
					<span class="more_text">더보기</span>
				</div>
			</div>




		</div>
		<div class="card shadow mb-4" style="width: 1200px; margin: 0 auto;">
			<div class="container"
				style="background-color: white; margin-bottom: 30px; border-radius: 10px;">

				<p class="title_name">인기쿠폰</p>

				<ul style="width: 100%; display: flex; flex-wrap: wrap;">
					<c:forEach items="${popular}" var="popular">
						<c:if test="${popular.pd_like >= 3 }">
							<li
								style="list-style: none; margin-left: 25px; margin-bottom: 25px; width: 30%; border-radius: 15px; box-shadow: 5px 5px 5px grey;"
								class="card_dis2"><a id="card_content"
								href='/category/detail?product_id=<c:out value="${popular.product_id }"/>'>
									<div class="card_poto">
										<c:set var="img" value="${fn:split(popular.pd_img, ',')[1]}"></c:set>
										<c:set var="simg2" value="${fn:replace(img, '%2F', '/')}"></c:set>

										<img style="width: 100%; height: 100%;"
											src="/getImg?fileNameNPath=${simg2}" alt="Not Found Image">

									</div>
									<div class="card_info">

										<div class="card_title_content">

											<p class="card_title">${popular.pd_name }</p>
										</div>
										<c:set var="price1" value="${popular.pd_price0 }"></c:set>
										<c:set var="price2" value="${popular.pd_price }"></c:set>
										<p class="card_adr" style="text-decoration: line-through;">${price1 }원</p>

										<p class="card_adr" style="">${price2 }원</p>
										<p class="card_adr" id="p_discount"
											style="color: red; font-size: 2em; font-weight: bold; text-align: right;">${popular.pd_discount }%</p>
										<!-- 원래 할인율 출력을 위해 짜려던 동적태그생성방식 깜빡하고 그냥 태그에 바로 값을 넣어서 오류가 생긴거였음 
                             
                                 <script>
                                 	let pd_discount = Math.round(eval(100-((${price2 }/${price1 })*100)));
									let discount_html = "<span>"+pd_discount+"%</span>";                                 	
                                 	$("#p_discount").html(discount_html);
                                 </script> -->

										<div>

											<p class="card_option">
												<c:set var="category_id" value="${popular.category_id }" />
												<c:if test="${category_id eq 1}">
                        편의점
                        </c:if>
												<c:if test="${category_id eq 2}">
                        커피/음료
                        </c:if>
												<c:if test="${category_id eq 3}">
                        외식
                        </c:if>
												<c:if test="${category_id eq 4}">
                        상품권
                        </c:if>
												<c:if test="${category_id eq 5}">
                        기타
                        </c:if>
											</p>

											<p class="card_like"
												style="display: inline-block; float: right; margin-right: 1rem;">
												<c:set var="like" value="${popular.pd_like}" />
												<c:if test="${like eq 0 }">

													<svg xmlns="http://www.w3.org/2000/svg" width="16"
														height="16" fill="currentColor"
														class="bi bi-chat-square-heart" viewBox="0 0 16 16">
  <path
															d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12ZM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Z" />
  <path
															d="M8 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
</svg>
												</c:if>
												<c:if test="${like ne 0 }">
													<svg xmlns="http://www.w3.org/2000/svg" width="16"
														height="16" fill="currentColor"
														class="bi bi-chat-square-heart" viewBox="0 0 16 16">
  <path
															d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12ZM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Z" />
  <path
															d="M8 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
</svg>${like}
											</c:if>

											</p>
										</div>

									</div>
							</a></li>
						</c:if>

					</c:forEach>

				</ul>

				<div class="more_btn2" id="load2">
					<span class="more_text">더보기</span>
				</div>

			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/includes/main_footer.jsp"%>



	<!--------------------------------------------------------------------------------------------------------------------------  -->



	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!--슬라이드 js-->
	<script type="text/javascript">
		$(function() {
			var $slider = $('.slider'), $firstSlide = $slider.find('li')
					.first() // 첫번째 슬라이드
					.stop(true).animate({
						'opacity' : 1
					}, 200); // 첫번째 슬라이드만 보이게 하기

			function PrevSlide() { // 이전버튼 함수
				stopSlide();
				startSlide(); //타이머 초기화
				var $lastSlide = $slider.find('li').last() //마지막 슬라이드
				.prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기  
				$secondSlide = $slider.find('li').eq(1)//두 번째 슬라이드 구하기
				.stop(true).animate({
					'opacity' : 0
				}, 400); //밀려난 두 번째 슬라이드는 fadeOut 시키고
				$firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
				.stop(true).animate({
					'opacity' : 1
				}, 400);//새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
			}

			function NextSlide() { // 다음 버튼 함수
				stopSlide();
				startSlide(); //타이머 초기화
				$firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
				.appendTo($slider); // 맨 마지막으로 보내기
				var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
				.stop(true).animate({
					'opacity' : 0
				}, 400); // fadeOut시키기
				$firstSlide = $slider.find('li').first()// 맨 처음 슬라이드
				.stop(true).animate({
					'opacity' : 1
				}, 400);// fadeIn 시키기
			}

			$('#next').on('click', function() { //다음버튼 클릭
				NextSlide();
			});
			$('#prev').on('click', function() { //이전 버튼 클릭
				PrevSlide();
			});

			startSlide(); // 자동 슬라이드 시작

			var theInterval;

			function startSlide() {
				theInterval = setInterval(NextSlide, 4000); //자동 슬라이드 설정
			}

			function stopSlide() { //자동 멈추기
				clearInterval(theInterval);
			}

			$('.slider').hover(function() { //마우스 오버시 슬라이드 멈춤
				stopSlide();
			}, function() {
				startSlide();
			});
		});
	</script>
	<!--더보기-->

	<script>
		$(function() {

			$(".card_dis").slice(0, 6).show(); // 초기갯수
			$("#load").click(function(e) { // 클릭시 more
				e.preventDefault();
				$(".card_dis:hidden").slice(0, 6).show(); // 클릭시 more 갯수 지저정
				if ($(".card_dis:hidden").length == 0) { // 컨텐츠 남아있는지 확인
					alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
				}
			});
		});
	</script>
	<!--인기쿠폰 더보기 버튼-->
	<script>
		$(function() {

			$(".card_dis2").slice(0, 6).show(); // 초기갯수
			$("#load2").click(function(e) { // 클릭시 more
				e.preventDefault();
				$(".card_dis2:hidden").slice(0, 6).show(); // 클릭시 more 갯수 지저정
				if ($(".card_dis2:hidden").length == 0) { // 컨텐츠 남아있는지 확인
					alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
				}
			});
		});
	</script>
	
	<script>
		function link_use(){
			location.href='/HowToUse' 
		}
	</script>



	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<script src="http://code.jquery.com/jquery-latest.js"></script>



</body>
</html>