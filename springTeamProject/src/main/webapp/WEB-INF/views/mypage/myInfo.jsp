
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/home.css">
</head>


<script type="text/javascript">	
	$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}
				if($("#nickname").val().length < 2 || $("#nickname").val().length > 10 ){
					alert("닉네임은 2~10자 사이로 입력하세요.");
					$("#nickname").focus();
					return false;
				}
				if($("#user_name").val()==""){
					alert("이름을 입력해주세요");
					$("#user_name").focus();
					return false;
				}
				if($("#user_name").val().length <2 || $("#user_name").val().length > 25 ){
					alert("이름은 2글자 이상~25자 이하로 입력하세요.");
					$("#user_name").focus();
					return false;
				}
				if($("#phone").val()==""){
					alert("연락처를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
				if($("#zip_no").val()==""){
					alert("우편번호를 입력해주세요.");
					$("#zip_no").focus();
					return false;
				}
				if($("#zip_no").val().length>10){
					alert("우편번호는 10글자를 초과할 수 없습니다.");
					$("#zip_no").focus();
					return false;
				}
				if($("#addr").val()==""){
					alert("주소를 입력해주세요.");
					$("#addr").focus();
					return false;
				}
				if($("#addr2").val()==""){
					alert("상세주소를 입력해주세요.");
					$("#addr2").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("새 비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if ($("#password").val()==${mem.password}) {
					alert("현재 비밀번호와 다른 비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if ($("#password").val().search(/\s/)!=-1) {
					alert("비밀번호는 띄어쓰기 없이 입력해주세요.");
					return false;
				}
				if ($("#password").val().length<4 ||$("#password").val().length>25 ) {
					alert("비밀번호는 4글자 이상~25글자 이하로 입력해주세요.");
					return false;
				}
				if($("#password2").val()==""){
					alert("새 비밀번호 확인을 입력해주세요.");
					$("#password2").focus();
					return false
				}
				if ($("#password").val() != $("#password2").val()) {
					alert("새 비밀번호 확인이 일치하지 않습니다.");
					$("#password").focus();				 
					return false;
					}
			});
		})
		
	</script>
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
						<h1 class="h3 mb-0 text-gray-800">내정보</h1>
					</div>
					<div class="row ">
						<div class="col-xl-12 col-lg-7" style="grid-area: main2;">
							<div class="card shadow mb-4">
								<div class="container"
									style="background-color: white; margin-bottom: 30px; border-radius: 10px; justify-content: center;">
							
										<div style="text-align: center;">
											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
												<label for="floatingInput">이메일</label> <input type="email"
													class="form-control" id="email" name="email"
													value="${mem.email}" readonly="readonly">
											</div>

											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
													<label for="floatingInput">새 비밀번호</label> <input type="password"
													class="form-control" id="password" name="password"
													>
											</div>

										</div>
										<div style="text-align: center;">
											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
												<label for="floatingInput">새 비밀번호 확인</label> <input type="password"
													class="form-control" id="password2" name="password2"
													>
											</div>

											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
												<label for="floatingInput">닉네임</label> <input type="text"
													class="form-control" id="nickname" name="nickname"
													value="${mem.nickname}"/>
											</div>

										</div>
										<div style="text-align: center;">
											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
												<label for="floatingInput">이름</label> <input type="text"
													class="form-control" id="user_name" name="user_name"
													value="${mem.user_name}"/>
											</div>

											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
												<label for="floatingInput">전화번호</label> <input type="text"
													class="form-control" id="phone" name="phone"
													value="${mem.phone}"/>
											</div>
											</div>
												<div style="text-align: center;">
											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
												<label for="floatingInput">우편번호</label> <input type="text"
													class="form-control" id="zip_no" name="zip_no"
													value="${mem.zip_no}"/>
											</div>

											<div class="form-floating mb-3"
												style="width: 300px; margin: 50px; display: inline-block;">
												<label for="floatingInput">주소</label> <input type="text"
													class="form-control" id="addr" name="addr"
													value="${mem.addr}"/>
											</div>
											</div>

										</div>
								</div>
								<button type="submit" class="btn btn-primary btn-lg" id="submit">정보수정</button>

							
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




</body>

</html>