
<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="en">

<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>마이페이지</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="resources/map.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/home.css">
<style type="text/css">
::-webkit-scrollbar {
	display: none;
}
</style>

</head>



<!------------------------------------------------------------------------------------  -->

<body id="page-top" style="-ms-overflow-style: none;">

	<!-- Page Wrapper -->
	<div id="wrapper" style="overflow: n;">

		<!-- Sidebar -->
		<%@include file="/WEB-INF/views/includes/main_sidebar.jsp"%>

		<!-- Sidebar end -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content"
				style="height: 100vh; min-height: 100%; position: relative; padding-bottom: 100px;">

				<%@include file="/WEB-INF/views/includes/main_header.jsp"%>

				<!------------------------------------------------------------------------------------------  -->




				<div style="background-color: white; ">

					<div class=row style="margin-bottom: 50px; margin-top;">
						<div class="col" style="text-align: center;">
							<img  style="width: 300px; height: 300px;"
								src="data:image/jpeg;base64,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">
						</div>
						<div class=col>

							<h4 style="text-align: left;">제목</h4>
							<p style="text-align: left;">카테고리</p>
							<h3 style="text-align: left;">가격</h3>
						</div>

					</div>

					<div class="map_wrap" style="width: 90%; margin: 0 auto;">
						<div id="map"
							style="height: 100%; position: relative; overflow: hidden;"></div>

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

					<div style="background-color: white; width: 90%; margin: 0 auto;">
						<%@ include file="comment.jsp"%>
					</div>

				</div>


			</div>
		</div>
	</div>




	<!--------------------------------------------------------------------------------------------------------------------------  -->
	<%@include file="/WEB-INF/views/includes/main_footer.jsp"%>


	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e243b14fc7e2d54b66eb97ad3a69c95&libraries=services"></script>
	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="resources/map.js"></script>




</body>

</html>