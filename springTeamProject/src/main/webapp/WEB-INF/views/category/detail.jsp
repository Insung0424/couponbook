<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="../resources/report.css"><!-- 신고기능모달창을 위한 css 삭제하면 모달창이 아니라 페이지에 추가되는 방식으로 작동함 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>


</head>

<body style="background-color: #f2f2f2">
	<header>
		<%@include file="/WEB-INF/views/includes/main_header2.jsp"%>
	</header>
	
	<div class="container text-center"
		style="margin-top: 30px; margin-bottom: 30px; background-color: white; border-radius: 10px; padding: 30px;">


		<div class=content
			style="margin-top: 30px; margin-bottom: 30px; height: 500px; width: 90%; background-color: white; margin: 0 auto;">


	<c:forEach items="${detail }" var="detail">
			<p style="text-align: left;">글 내용</p>
			<!-- 받아온 쿠폰 정보를 출력 -->
			<p>게시물번호     :   <c:out value="${detail.board_no }"/></p>
			<p>상품 ID	:	<c:out value="${detail.product_id }"/></p>
			<p>카테고리	:	<c:out value="${detail.category_id }"/></p>
			<p>회사이름	:	<c:out value="${detail.company_name }" /></p>
			<p>쿠폰이름	:	<c:out value="${detail.pd_name }" /></p>
			<p>쿠폰가격	:	<c:out value="${detail.pd_price }" /></p>
			<p>거래상태	:	<c:out value="${detail.pd_status }" /></p>
				<c:set var="img" value="${fn:split(detail.pd_img, ',')[0]}"></c:set>
				<c:set var="simg1" value="${fn:replace(img, '%5C', '/')}"></c:set>
				<c:set var="simg2" value="${fn:replace(simg1, '%3A', ':')}"></c:set>
			<p>쿠폰이미지	: 	<img src="/getImg?fileNameNPath=${simg2}" class="card-img-top" alt="Not Found Image"> </p>
			<p>사용처	: 	 ${detail.pd_desc } </p>
			<!-- ckeditor 로 db로 값을 삽입하면 html 태그 전체가 삽입되므로 값자체를 화면에 띄우거나 다른 방법을 사용해야한다 -->
			<p>쿠폰할인율	:	<c:out value="${detail.pd_discount }" /></p>
			<p>등록일	:	<c:out value="${detail.pd_date }" /></p>

	</c:forEach>
		</div>
		
		<div class="map_wrap">
		<c:forEach items="${detail }" var="detail">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="${detail.company_name }" id="keyword" size="15">
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
		
		<hr style="border: solid 1px black;">

		<div style="background-color: white;">
		
		</div>

	</div>
	
	<div style="width: 90%; height:600px; margin: 0 auto;">
		<!-- comment start -->
		<%@ include file="comment.jsp" %>
	<!-- comment end -->
	</div>


	<a id="top_btn">TOP</a>
	
	
	
<!-- 거래완료 -->
<input type="button" id="modal_TradingEnd" class="btn btn-primary"
style="display: block;" value="거래완료하기"/>
<div id="modal_trade">
	<div id="modal_trade_content"></div>
</div>
<!-- 거래완료 -->



<!-- 신고 기능 모달 창 -->
<button id="modal_btn_report" class="btn btn-primary">신고</button>

<div id="modal_report">
	<div id="modal_report_content">
		<div class="modal-header">
			<div class="modal-title">
				불량사용자신고
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/mypage/sendEmail" method="post">
		<div class="modal-body">
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">신고종류</label>
			  <select id="re_title" class="form-select form-select-sm">
					<option value="">유형선택</option>
					<option value="허위매물">허위매물</option>
					<option value="삼자거래사기">삼자거래사기</option>
					<option value="또 추가할 항목">또 추가할 항목</option>
			  </select>
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">상세내용</label>
			  <textarea class="form-control" id="editor4" name="editor4" rows="5"></textarea>
				<script type="text/javascript">
				    CKEDITOR.replace( 'editor4' );
				</script>
			</div>
			<input type="hidden" value="${detail.user_id }" name="user_id">
			<input type="hidden" value="${detail.email }" name="email">
		</div>
		<div class="modal-footer">
			<button id="report_submit" class="btn btn-primary">확인</button>
			<button id="report_cancel" class="btn btn-primary">취소</button>
		</div>
		</form>
	</div>
</div>
<!-- 신고 기능 모달 창 -->	
	
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
		
		
		$(document).ready(function (){
			$("#modal_report").hide();
		});
		$("#modal_btn_report").click(function(){
			$("#modal_report").fadeIn();
		});
		$("#report_cancel").click(function(){
			$("#modal_report").fadeOut();
		});

		$("#modal_TradingEnd").click(function(){
			//버튼 숨기기,보이기
			$("#modal_TradingEnd").toggle(); 
			// 거래 완료 유형선택자 페이지 제공	
			$("#modal_trade_content").load("buyerTradeEnd");
			// 한번 로드 후 취소누르면 hide로 내용을 숨김처리하므로 show로 보여줌
			if($("#modal_trade_content").load("buyerTradeEnd")){
				$("#modal_trade_content").show("buyerTradeEnd");
			}
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
