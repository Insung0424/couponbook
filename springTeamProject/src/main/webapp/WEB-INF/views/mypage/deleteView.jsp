
<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<head>
<link rel="shortcut icon"
	href='<c:url value="/resources/favicon.png" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/favicon.png" />'
	type="image/x-icon">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">


</head>
<script type="text/javascript">
	$(document).ready(function() {

		$("#deletee").on("click", function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#password").focus();
				return false
			}

			if ($("#password2").val() == "") {
				alert("비밀번호 확인을 입력해주세요");
				$("#password2").focus();
				return false
			}

			if ($("#password").val() != $("#password2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#password").focus();

				return false;
			}

			$.ajax({
				url : "/mypage/check_password_mypage",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success : function(data) {
					if (data == 0) {
						alert("비밀번호를 확인해주세요.");
						return;
					} else {
						if (confirm("탈퇴하시겠습니까?")) {
							$("#deleteForm").submit();
							alert("회원 탈퇴 성공하였습니다.")
						}
					}
				}
			})
		});
	})
</script>


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
						<h1 class="h3 mb-0 text-gray-800">회원 탈퇴</h1>
					</div>
					<div class="row ">
						<div class="col-xl-12 col-lg-7" style="grid-area: main2;">
							<div class="card shadow mb-4" style="text-align: center;">

								<!-- Card Body -->


								<div class="table-wrap"
									style="width: 50%; height: 500px; overflow: auto; margin: 0 auto;">

									<form action="/mypage/delete_info_mypage" method="post"
										id="deleteForm" name="deleteForm" style="margin-top: 20%;">
										<input type="hidden" id="user_id" name="user_id"
											value="${mem.user_id}"> <input type="hidden"
											id="session_password" name="session_password"
											value="${mem.password }"> <input type="password"
											id="password" name="password"
											class="form-control form-control-inline text-center"
											placeholder="비밀번호" style="background-color: #f8f9fd;" /> <input
											type="password" id="password2" name="password2"
											class="form-control form-control-inline text-center"
											placeholder="비밀번호 확인" style="background-color: #f8f9fd;" />

										<div style="margin-top: 10px;">
											<button type="button" id="deletee" name="delete"
												class="btn btn-primary">회원탈퇴</button>
											<a href="/" class="btn btn-default">취소</a>
										</div>
									</form>

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
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- 테이블 js-->
	<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
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