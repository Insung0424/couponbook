
<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/home.css">
<style type="text/css">
</style>

</head>



<!------------------------------------------------------------------------------------  -->

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@include file="/WEB-INF/views/includes/main_sidebar.jsp"%>

		<!-- Sidebar end -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content"
				style="height: 100vh; min-height: 100%; position: relative; padding-bottom: 100px;">

				<%@include file="/WEB-INF/views/includes/main_header.jsp"%>

				<!------------------------------------------------------------------------------------------  -->



				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">내가 올린 쿠폰</h1>
					</div>
					<div class="row ">
						<div class="col-xl-12 col-lg-7" style="grid-area: main2;">
							<div class="card shadow mb-4">
								<div class="container"
									style="background-color: white; margin-bottom: 30px; border-radius: 10px;">

									<div class="row">
										<div class="col">
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
										</div>
									</div>




								</div>

								<!-- Card Body -->



							</div>
						</div>
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


	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>




</body>

</html>