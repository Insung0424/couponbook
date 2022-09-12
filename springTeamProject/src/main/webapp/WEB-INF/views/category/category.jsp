
<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>마이페이지</title>

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

.title_name {
	font-weight: 900;
	color: #212529;
	font-size: 25px;
	margin: 30px 70px;;
	text-align: left;
}

.more_btn {
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
</style>
</head>



<!------------------------------------------------------------------------------------  -->

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="/WEB-INF/views/includes/main_sidebar.jsp"%>

		<!-- Sidebar end -->

		<!-- Main Content -->
		<div id="content"
			style="width: 100%; min-height: 100%; position: relative; margin: 0;">

			<%@include file="/WEB-INF/views/includes/main_header.jsp"%>

			<!------------------------------------------------------------------------------------------  -->



			<div class="col-xl-12 col-lg-7"
				style="width: 80%; margin: 0 auto; marborder-radius: 10px;">
				<div class="card shadow mb-4">
					<div class="container"
						style="background-color: white; margin-bottom: 30px; border-radius: 10px;">
						 <p class="title_name">
							<c:forEach items="${list_cat }" var="list_cat">
								<c:set var="category_id" value="${list_cat.category_id }" />
								<c:if test="${category_id eq 1}">
                        편의점 쿠폰
                        </c:if>
								<c:if test="${category_id eq 2}">
                        커피/음료 쿠폰
                        </c:if>
								<c:if test="${category_id eq 3}">
                        외식 쿠폰
                        </c:if>
								<c:if test="${category_id eq 4}">
                        상품권 쿠폰
                        </c:if>
								<c:if test="${category_id eq 5}">
                        기타 쿠폰
                        </c:if>
							</c:forEach>
						</p>

						<!--  -->

						<ul style="width: 100%; display: flex; flex-wrap: wrap;">

							<c:forEach items="${list_all }" var="list_all">
								<li style="list-style: none; margin: 5px; width: 30%;"
									class="card_dis"><a>
										<div class="card_poto">
											<img alt="noimg"
												src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/24b57f306f80c1ebbc2b9dbbd4c9f0792752820e9b41f924f0993db0e906bc0b.webp?q=82&s=300x300&t=crop">

										</div>
										<div class="card_info">
											<div class="card_title_content">
												<span class="card_title">${list_cat.pd_name }</span>
											</div>
											<p class="card_adr">${list_cat.pd_price }</p>
											<p class="card_option">
												<c:set var="category_id" value="${list_cat.category_id }" />
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
										</div>
								</a></li>
							</c:forEach>

						</ul>

						<div class="more_btn" id="load">
							<span class="more_text">더보기</span>
						</div>
					</div>
				</div>
			</div>

				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/includes/main_footer.jsp"%>



	<!--------------------------------------------------------------------------------------------------------------------------  -->



	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<script>
		$(function() {

			$(".card_dis").slice(0, 6).show(); // 초기갯수
			$("#load").click(function(e) { // 클릭시 more
				e.preventDefault();
				$(".card_dis:hidden").slice(0, 8).show(); // 클릭시 more 갯수 지저정
				if ($(".card_dis:hidden").length == 0) { // 컨텐츠 남아있는지 확인
					alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
				}
			});
		});
	</script>
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