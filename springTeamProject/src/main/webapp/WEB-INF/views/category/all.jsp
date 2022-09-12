
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
<<<<<<< Updated upstream



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
                  <p class="title_name">인기쿠폰</p>
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
                                
                                    <a class="card-link" href='/category/detail?product_id=<c:out value="${list_all.product_id }"/>'>${list_all.pd_name }</a>
                                 </div>
                                 <p class="card_adr">${list_all.pd_price }</p>
                                 <p class="card_option">
                                    <c:set var="category_id" value="${list_all.category_id }" />
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

         <!--  -->
         <div class="col-xl-12 col-lg-7"
            style="width: 80%; margin: 0 auto; marborder-radius: 10px;">
            <div class="card shadow mb-4">
               <div class="container"
                  style="background-color: white; margin-bottom: 30px; border-radius: 10px; text-align: center;">
                  <p class="title_name">기한임박 쿠폰</p>
                  <ul style="width: 100%; display: flex; flex-wrap: wrap;">

                     <%
                        for (int i = 0; i < 20; i++) {
                     %>
                     <li style="list-style: none; margin: 5px; width: 30%;"
                        class="card_dis2"><a>
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
                     </a></li>
                     <%
                        }
                     %>
                  </ul>
                  <div class="more_btn" id="load2">
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



=======
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
							aria-current="page" href="/main">홈</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle"  role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/category/all">전체</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=1">편의점</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=2">커피/음료</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=3">외식</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=4">상품권</a></li>
								<li><a class="dropdown-item" href="/category/category?category_id=5">기타</a></li>
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

					<c:set var="userID" value="${mem.email}" />
				<c:choose>
					<c:when test="${empty userID}">
						<form method="get" class="l-flex" role="signin">
							<input type="submit" class="btn btn-warning" formaction="/member/login" style="margin-right: 5px;" value="로그인">
							<a id="custom-login-btn" class="btn btn-lg" 
								href="https://kauth.kakao.com/oauth/authorize?client_id=e90605fb64b5ed5eeffcf586eb651d12&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code">
								<img src="/resources/kakao_login_small.png"
								  height="38px" alt="카카오 로그인 버튼" />
							</a>
						</form>
						<form class="re-flex" role="signup">
							<a class="btn btn-secondary" href="/member/join" style="margin-right: 5px;">회원가입</a>
						</form>
					</c:when>
				
					<c:when test="${!empty userID}">
						<!-- 마이페이지 경로 수정 필요 -->
						<form method="post" class="re-flex" role="sign">
						<input type="hidden" id="session_user_id" name="session_user_id" value="${mem.user_id }">					
						<input type="submit" formaction="/mypage/myInfo" class="btn  btn-outline-warning me-3" value="마이페이지" style="border: none; background: transparent;"><br><br>
						</form>
						<a href="/member/logout" class="btn btn-danger">로그아웃</a><br><br>

					</c:when>
				</c:choose>
				
				
				</div>
			</div>
		</nav>
	</header>
	<div class="container text-center" style="margin-top: 30px;">
		<div class="row">
			<div class="col">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="https://image10.coupangcdn.com/image/ccm/banner/8a80aeb91c702f39b87d93386e0c4168.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://static.coupangcdn.com/fa/cmg_paperboy/image/1661232568819/C1_PC1.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img
								src="https://static.coupangcdn.com/aa/cmg_paperboy/image/1661418271864/%5B%EC%88%98%EC%A0%951%5D220826_%EC%99%80%EC%9A%B0%EC%9C%84%ED%81%AC_A_SMD-20383_PC.jpg"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<h1 style="margin-left: 250px; margin-top: 50px;">전체 쿠폰</h1>
	<div class="container text-center" style="margin-top: 30px;">
		전체 게시물 <c:out value="${count_all }"/>개
		<c:forEach items="${list_all }" var="list_all">
	
		<div class="row">
			<div class="col">
			<form method="get">

				<a class="card-link" href="#"
					style="text-decoration: none; color: black; text-align: left;">
					<div class="card" style="width: 18rem;">
						<img 
							src="data:image/png;base64,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"
							class="card-img-top" alt="..." OnClick="location.href ='/category/detail?product_id=${list_all.product_id }'">
						<div class="card-body">
							<p class="card-title">
							<input type="submit" value="${list_all.pd_name}" formaction="/category/detail?product_id=${list_all.product_id }"></p>
							<div class="card-price" OnClick="location.href ='/category/detail?product_id=${list_all.product_id }'">가격<c:out value="${list_all.pd_price }" /></div>
							<div class="card-variety"OnClick="location.href ='/category/detail?product_id=${list_all.product_id }'" > 종류<c:set var="category_id" value="${list_all.category_id }"/>
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
</div>
						</div>
					</div>
				</a>
				</form>

			</div>
		</div>
		</c:forEach>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
>>>>>>> Stashed changes
</body>

</html>