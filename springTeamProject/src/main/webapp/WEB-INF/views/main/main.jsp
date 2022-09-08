
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
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/home.css">

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
						style="background-color: white; margin-bottom: 30px; border-radius: 10px; text-align: center;">
						<p class="title_name">인기쿠폰</p>

						<%
							for (int i = 0; i < 9; i++) {
						%>
						<article style="display: inline-block;; width: 300; margin: 20px;">
							<a>
								<div class="card_poto">
									<img alt="noimg"
										src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/24b57f306f80c1ebbc2b9dbbd4c9f0792752820e9b41f924f0993db0e906bc0b.webp?q=82&s=300x300&t=crop">

								</div>
								<div class="card_info">
									<div class="card_title_content">
										<span class="card_title">제목</span>
									</div>
									<p class="card_adr">서울시 강북구</p>
									<p class="card_option">추천</p>
								</div>
							</a>
						</article>
						<%
							}
						%>
						<div class="more_btn" id="load" onclick="moreList()">
							<span class="more_text">더보기</span>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="col-xl-12 col-lg-7"
				style="width: 80%; margin: 0 auto; marborder-radius: 10px;">
				<div class="card shadow mb-4">
					<div class="container"
						style="background-color: white; margin-bottom: 30px; border-radius: 10px; text-align: center;">
						<p class="title_name">기한임박 쿠폰</p>

						<%
							for (int i = 0; i < 9; i++) {
						%>
						<article style="display: inline-block;; width: 300; margin: 20px;" id="card">
							<a>
								<div class="card_poto">
									<img alt="noimg"
										src="https://dnvefa72aowie.cloudfront.net/origin/article/202208/24b57f306f80c1ebbc2b9dbbd4c9f0792752820e9b41f924f0993db0e906bc0b.webp?q=82&s=300x300&t=crop">

								</div>
								<div class="card_info">
									<div class="card_title_content">
										<span class="card_title">제목</span>
									</div>
									<p class="card_adr">서울시 강북구</p>
									<p class="card_option">추천</p>
								</div>
							</a>
						</article>
						<%
							}
						%>
						<div class="more_btn" id="load" onclick="moreList()">
							<span class="more_text">더보기</span>
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
		moreList(); //함수 호출

		function moreList() {

			var startNum = $("#listBody tr").length; //마지막 리스트 번호를 알아내기 위해서 tr태그의 length를 구함.
			var addListHtml = "";
			console.log("startNum", startNum); //콘솔로그로 startNum에 값이 들어오는지 확인

			$
					.ajax({
						url : "/study/getfilmList",
						type : "post",
						dataType : "json",
						data : {
							"startNum" : startNum
						},

						success : function(data) {
							if (data.length < 10) {
								$("#addBtn").remove(); // 더보기 버튼을 div 클래스로 줘야 할 수도 있음
							} else {
								var addListHtml = "";
								if (data.length > 0) {

									for (var i = 0; i < data.length; i++) {
										var idx = Number(startNum) + Number(i)
												+ 1;
										// 글번호 : startNum 이  10단위로 증가되기 때문에 startNum +i (+1은 i는 0부터 시작하므로 )
										addListHtml += "<tr>";
										addListHtml += "<td>" + idx + "</td>";
										addListHtml += "<td>" + data[i].title
												+ "</td>";
										addListHtml += "<td>"
												+ data[i].description + "</td>";
										addListHtml += "</tr>";
									}
									$("#listBody").append(addListHtml);
								}
							}
						}
					});

		}
	</script>

	<script>
		$(function() {
			$("article").slice(0, 1).show(); // 초기갯수
			$("#load").click(function(e) { // 클릭시 more
				e.preventDefault();
				$("article:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
				if ($("article:hidden").length == 0) { // 컨텐츠 남아있는지 확인
					alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
				}
			});
		});
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>




</body>

</html>