<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CouponBook</title>

<style type="text/css">
header {
	position: sticky;
	top: 0;
	z-index: 10;
}

.card-link {
	display: inline-block;
	margin: 0 auto;
	padding: 10px;
}

#top_btn {
	position: fixed;
	right: 20px;
	bottom: 15px;
	z-index: 9;
	display: inline;
	width: 48px;
	padding: 10px 0px;
	border-radius: 5px;
	background-color: rgba(50, 50, 50, 0.8);
	text-align: center;
	line-height: 1;
	font-size: 14px;
	color: #ffffff;
	cursor: pointer;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<link href="resources/css/slide.css" rel="stylesheet">
</head>
<body style="background-color: #f2f2f2">

	<header>
		<nav class="navbar navbar-expand-lg" style="background-color: #ddd">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">CouponBook</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Ȩ</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> ī�װ� </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">��ü</a></li>
								<li><a class="dropdown-item" href="#">������</a></li>
								<li><a class="dropdown-item" href="#">Ŀ��/����</a></li>
								<li><a class="dropdown-item" href="#">�ܽ�</a></li>
								<li><a class="dropdown-item" href="#">��ǰ��</a></li>
								<li><a class="dropdown-item" href="#">��Ÿ</a></li>
							</ul></li>
					</ul>
					<div style="margin-right: 50px;">
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="�˻��� �Է�" aria-label="Search" style="width: 300px;">
							<button class="btn btn-light" type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg>
							</button>
						</form>
					</div>
					<ul class="nav navbar-top-links navbar-right"
						style="padding-right: 50px;">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" data-bs-toggle="dropdown" href="#"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
</svg></a>
							<ul class="dropdown-menu dropdown-user">
								<li><a class="dropdown-item" href="#"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-person-fill"
											viewBox="0 0 16 16">
  <path
												d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg> ����������</a></li>

								<li><a class="dropdown-item" href="main.jsp"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-box-arrow-right"
											viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
												d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg> �α׾ƿ�</a></li>
							</ul> <!-- /.dropdown-user --></li>
						<!-- /.dropdown -->
					</ul>
					<form class="r-flex" role="regist">
						<a class="btn btn-primary" href="write"
							style="margin-right: 5px;">��ǰ ���</a>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<div class="container text-center" style="margin-top: 30px;">
		<div class="row">
			<div class="col">


				<div class="slide slide_wrap">

					<div class="slide_item">

						<div class="card" style="width: 18rem; margin: 5px;">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<a href="#" class="card-link">Card link</a> <a href="#"
									class="card-link">Another link</a>
							</div>
						</div>


					</div>

					<div class="slide_item">2</div>
					<div class="slide_item">3</div>
					<div class="slide_item">4</div>
					<div class="slide_item">5</div>
					<div class="slide_prev_button slide_button">��</div>
					<div class="slide_next_button slide_button">��</div>
					<ul class="slide_pagination"></ul>
				</div>





			</div>
		</div>
	</div>
	<h1 style="margin-left: 250px; margin-top: 50px;">���� �ӹ� ����</h1>
	<div class="container text-center" style="margin-top: 30px;">
		<div class="row">
			<div class="col">
				<%
					for (int i = 0; i < 8; i++) {
				%>
				<a class="card-link" href="#"
					style="text-decoration: none; color: black; text-align: left;">
					<div class="card" style="width: 18rem;">
						<img
							src="data:image/png;base64,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"
							class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-title">����</p>
							<div class="card-price">����</div>
							<div class="card-variety">����</div>
						</div>
					</div>
				</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<h1 style="margin-left: 250px; margin-top: 50px;">�α� ����</h1>
	<div class="container text-center" style="margin-top: 30px;">
		<div class="row">
			<div class="col">
				<%
					for (int i = 0; i < 8; i++) {
				%>
				<a class="card-link" href="#"
					style="text-decoration: none; color: black; text-align: left;">
					<div class="card" style="width: 18rem;">
						<img
							src="data:image/png;base64,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"
							class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-title">����</p>
							<div class="card-price">����</div>
							<div class="card-variety">����</div>
						</div>
					</div>
				</a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div class="container text-center"
		style="margin-top: 30px; margin-bottom: 30px;">
		<div class="row">
			<div class="col">
				<a class="total" href="#"
					style="font-weight: bold; text-decoration: none; color: black;">��ü
					���� ����</a>
			</div>
		</div>
	</div>
	<a id="top_btn">TOP</a>
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
	<script type="text/javascript" src="resources/css/slide.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>