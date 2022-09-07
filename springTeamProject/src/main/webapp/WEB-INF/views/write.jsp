<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>상품 등록</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body>
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
							aria-current="page" href="#">홈</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">전체</a></li>
								<li><a class="dropdown-item" href="#">편의점</a></li>
								<li><a class="dropdown-item" href="#">커피/음료</a></li>
								<li><a class="dropdown-item" href="#">외식</a></li>
								<li><a class="dropdown-item" href="#">상품권</a></li>
								<li><a class="dropdown-item" href="#">기타</a></li>
							</ul></li>
					</ul>
					<div style="margin-right: 50px;">
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="검색어 입력" aria-label="Search" style="width: 300px;">
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
</svg> 마이페이지</a></li>

								<li><a class="dropdown-item" href="main.jsp"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-box-arrow-right"
											viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
												d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg> 로그아웃</a></li>
							</ul> <!-- /.dropdown-user --></li>
						<!-- /.dropdown -->
					</ul>
					<form class="r-flex" role="regist">
						<a class="btn btn-primary disabled" href="#" style="margin-right: 5px;">상품
							등록</a>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<form action="" method="post" name = "frm">
	<div class="container" style="margin-top: 30px;">
		<div class="row">
			<div class="col">
			<h2 style="margin-bottom: 30px;">상품 등록</h2>
			<hr>
			<p><b>제목</b></p>
			<input type = "text" name = "title" placeholder="제목을 입력하세요" style="width: 500px; margin-bottom: 10px;">
			
			<p><b>카테고리</b></p>
			<select name = "select" style="margin-bottom: 10px; width: 100px;">
				<option value="none">-------</option>
				<option value="cs">편의점</option>
				<option value="beverage">커피/음료</option>
				<option value="dining">외식</option>
				<option value="giftCard">상품권</option>
				<option value="etc">기타</option>
			</select>
			<p><b>가격</b></p>
			<input type = "text" id = "price" placeholder= "가격을 입력하세요" style="margin-bottom: 10px;"> 원
			<p><b>기한</b></p>
			<input type="date" name="lastday" style="margin-bottom: 10px;">
			<p><b>내용</b></p>
			<textarea rows="10" cols="150" name = "content" placeholder="내용을 입력하세요"></textarea>
			<p style="margin-top: 30px;"><button class="btn btn-primary" type="submit" onclick="return ch()">등록</button> <button class="btn btn-secondary" type="reset">취소</button></p>
  </div>
  </div>
  </div>
  </form>
  
  <script type="text/javascript">
  function ch() {
	  if(frm.title.value == "") {
		  frm.title.focus();
		  alert('제목을 입력해 주십시오');
		  
		  return false;
	  }
	  
	  if(frm.select.value == "none") {
		  frm.select.focus();
		  alert('카테고리를 선택해 주세요');
		  
		  return false;
	  }
	  
	  if(frm.price.value == "") {
		  frm.price.focus();
		  alert('가격을 입력해 주십시오');
		  
		  return false;
	  }
	  
	  if(frm.lastday.value == "") {
		  frm.lastday.focus();
		  alert('쿠폰의 유효기간을 입력해 주십시오');
		  
		  return false;
	  }
	  
	  if(frm.content.value == "") {
		  frm.content.focus();
		  alert('내용을 입력해 주십시오');
		  
		  return false;
	  }
  }
  </script>
  <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>