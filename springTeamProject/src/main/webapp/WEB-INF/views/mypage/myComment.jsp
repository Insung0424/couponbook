
<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
<style type="text/css">
 a:link { color: black; text-decoration: none;}	
 a:visited { color: black; text-decoration: none;}	
 a:hover { color: #006DD7; text-decoration: underline;}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>마이페이지</title>

<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home.css">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">


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

				<%@include file="/WEB-INF/views/includes/main_header2.jsp"%>

				<!------------------------------------------------------------------------------------------  -->



				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">댓글내역</h1>
					</div>
					<div class="row ">
						<div class="col-xl-12 col-lg-7" style="grid-area: main2;">
							<div class="card shadow mb-4">

								<!-- Card Body -->


								<input class="form-control" id="myInput" type="text"
									placeholder="검색">
								<div class="table-wrap"
									style="width: 100%; height: 500px; overflow: auto">

									<table class="table">
										<thead class="thead-primary">
											<tr>
												<th>상품이미지</th>
												<th>상품이름</th>												
												<th>댓글내용</th>
												<th>게시시간</th>	
											</tr>
										</thead>
										<tbody id="myTable">
										<c:forEach items="${comment}" var = "comment">					
											<tr>
										<td><a href='/category/detail?product_id=${comment.product_id }'><c:set var="img" value="${fn:split(comment.pd_img, ',')[1]}"></c:set>
							<c:set var="simg2" value="${fn:replace(img, '%2F', '/')}"></c:set>
							
                                 <img style="width: 25%; height: 25%;"
                           src="/getImg?fileNameNPath=${simg2}" alt="Not Found Image"></a></td>
										<td><a href="<c:url value='/category/detail?product_id=${comment.product_id}'/>"><c:out value="${comment.pd_name}"/></a></td>
										<td><a href="<c:url value='/category/detail?product_id=${comment.product_id}'/>"><c:out value="${comment.comment_content}" escapeXml="false" /></a></td>
										<td><a href="<c:url value='/category/detail?product_id=${comment.product_id}'/>"><c:out value="${comment.comment_write_time}"/></a></td>
											</tr>
										</c:forEach>	
										</tbody>
									</table>
								</div>
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
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- 테이블 js-->
	<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
</body>

</html>