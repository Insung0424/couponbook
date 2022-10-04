
<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<%@include file="/WEB-INF/views/includes/main_sidebar.jsp"%>

		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content"
				style="height: 100vh; min-height: 100%; position: relative; padding-bottom: 100px;">
				<!-------------- nav bar------------->
				<%@include file="/WEB-INF/views/includes/main_header2.jsp"%>

				<!------------------------------------------------------------------------------------------  -->



				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">관심상품 리스트</h1>
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
												<th>상품 이름(클릭시 페이지 이동)</th>											
												<th>상품 가격</th>											
												<th>할인율</th>											
												<th>관심상품 등록날짜</th>		
												<th>거래상태</th>		
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach items="${like}" var = "like">					
							<tr>						
							<td><a href='/category/detail?product_id=${like.product_id }'><c:set var="img" value="${fn:split(like.pd_img, ',')[1]}"></c:set>
							<c:set var="simg2" value="${fn:replace(img, '%2F', '/')}"></c:set>
							
                                 <img style="width: 27%; height: 27%;"
                           src="/getImg?fileNameNPath=${simg2}" alt="Not Found Image"></a></td>		
								<td><a href="<c:url value='/category/detail?product_id=${like.product_id}'/>"><c:out value="${like.pd_name}"/></a>
								</td>
								<td><a href="<c:url value='/category/detail?product_id=${like.product_id}'/>"><c:out value="${like.pd_price}"/>원</a></td>			
								<td><a href="<c:url value='/category/detail?product_id=${like.product_id}'/>"><c:out value="${like.pd_discount}"/>%</a></td>			
								<td><a href="<c:url value='/category/detail?product_id=${like.product_id}'/>"><c:out value="${like.like_time}"/></a></td>			
								<td><a href="<c:url value='/category/detail?product_id=${like.product_id}'/>"><c:set var="pd_status" value="${like.pd_status }"/>
								<c:if test="${pd_status eq 1}">
								판매중
								</c:if>
								<c:if test="${pd_status eq 2}">
								거래완료
								</c:if>
								</a></td>
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




	<!--------------------------footer--------------------------------------------------  -->
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