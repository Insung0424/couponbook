<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<!-- 댓글,신고,거래완료,ckeditor를 위한 css,js -->
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/report.css">
<!-- 신고기능모달창을 위한 css 삭제하면 모달창이 아니라 페이지에 추가되는 방식으로 작동함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>




</head>

<body style="background-color: #f2f2f2">
	<header>
		<%@include file="/WEB-INF/views/includes/main_header2.jsp"%>
	</header>

	<hr style="border: solid 1px black;">

	<div class="container text-center"
		style="margin-top: 30px; margin-bottom: 30px; background-color: white; border-radius: 10px; padding: 30px;">


		<div class=content
			style="margin-top: 30px; margin-bottom: 30px; width: 90%; background-color: white; margin: 0 auto;">

			<!--  -->



			<c:forEach items="${detail }" var="detail">

				<div class=row style="margin-bottom: 50px;">
					<div class="col" style="text-align: center;">

						<c:set var="img" value="${fn:split(detail.pd_img, ',')[0]}"></c:set>
						<c:set var="simg1" value="${fn:replace(img, '%5C', '/')}"></c:set>
						<c:set var="simg2" value="${fn:replace(simg1, '%3A', ':')}"></c:set>
						<div style="width: 300px; height: 300px; background-color: gray;">
							<img style="width: 300px; height: 300px;"
								src="/getImg?fileNameNPath=${simg2}" alt="Not Found Image">
						</div>
						<p style="text-align: left;">
							등록일 :
							<c:out value="${detail.pd_date }" />
						</p>
					</div>
					<div class=col>

						<h4 style="text-align: left;">
							<c:out value="${detail.pd_name }" />
						</h4>
						<p style="text-align: left;">
							<c:set var="category_id" value="${detail.category_id  }" />
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
						<p style="text-align: left;">
							<c:out value="${detail.company_name }" />
						</p>
						<h3 style="text-align: left;">
							<c:out value="${detail.pd_price }" />
							<span> 원</span>
						</h3>
					</div>
					<hr style="border: solid 1px black;">
			</c:forEach>

			<div class="map_wrap">
				<c:forEach items="${detail }" var="detail">
					<div id="map"
						style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

					<div id="menu_wrap" class="bg_white">
						<div class="option">
							<div>
								<form onsubmit="searchPlaces(); return false;">
									키워드 : <input type="text"
										value="${detail.company_name }&nbsp;${detail.location_id}"
										id="keyword" size="15">
									<button type="submit">검색하기</button>
								</form>
							</div>
						</div>
						<hr>
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div>
				</c:forEach>
			</div>





			<%-- 
         <c:forEach items="${detail }" var="detail">
            <p style="text-align: left;">글 내용</p>
            <!-- 받아온 쿠폰 정보를 출력 -->
            <p>
               게시물번호 :
               <c:out value="${detail.board_no }" />
            </p>
            <p>
               상품 ID :
               <c:out value="${detail.product_id }" />
            </p>
            <p>
               카테고리 :
               <c:out value="${detail.category_id }" />
            </p>
            <p>
               회사이름 :
               <c:out value="${detail.company_name }" />
            </p>
            <p>
               쿠폰이름 :
               <c:out value="${detail.pd_name }" />
            </p>
            <p>
               쿠폰가격 :
               <c:out value="${detail.pd_price }" />
            </p>
            <p>
               거래상태 :
               <c:out value="${detail.pd_status }" />
            </p>
=======
         style="margin-top: 30px; margin-bottom: 30px; height: 500px; width: 90%; background-color: white; margin: 0 auto;">


   <c:forEach items="${detail }" var="detail">
         <p style="text-align: left;">글 내용</p>
         <!-- 받아온 쿠폰 정보를 출력 -->
         <p>게시물번호     :   <c:out value="${detail.board_no }"/></p>
         <p>상품 ID   :   <c:out value="${detail.product_id }"/></p>
         <p>카테고리   :   <c:out value="${detail.category_id }"/></p>
         <p>회사이름   :   <c:out value="${detail.company_name }" /></p>
         <p>쿠폰이름   :   <c:out value="${detail.pd_name }" /></p>
         <p>쿠폰가격   :   <c:out value="${detail.pd_price }" /></p>
         <p>거래상태   :   <c:out value="${detail.pd_status }" /></p>
>>>>>>> main
            <c:set var="img" value="${fn:split(detail.pd_img, ',')[0]}"></c:set>
            <c:set var="simg1" value="${fn:replace(img, '%5C', '/')}"></c:set>
            <c:set var="simg2" value="${fn:replace(simg1, '%3A', ':')}"></c:set>
            <p>
               쿠폰이미지 : <img src="/getImg?fileNameNPath=${simg2}"
                  class="card-img-top" alt="Not Found Image">
            </p>
            <p>사용처 : ${detail.pd_desc }</p>
            <!-- ckeditor 로 db로 값을 삽입하면 html 태그 전체가 삽입되므로 값자체를 화면에 띄우거나 다른 방법을 사용해야한다 -->
            <p>
               쿠폰할인율 :
               <c:out value="${detail.pd_discount }" />
            </p>
            <p>
               등록일 :
               <c:out value="${detail.pd_date }" />
            </p>

         </c:forEach> --%>
			<hr style="border: solid 1px black; margin-top: 10px;">

			<div class=content
				style="margin-top: 50px; margin-bottom: 30px; height: 500px; width: 90%; background-color: white; margin: 0 auto;">


				<p style="text-align: left;">글 내용</p>

			</div>
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
	  <script
      src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- Custom scripts for all pages-->
   <script
      src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
	
</body>
</html>