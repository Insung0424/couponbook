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

#card {
   display: none;
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
   
	.slide {
   /* layout */
   display: flex;
   flex-wrap: nowrap;
   /* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
   overflow: hidden;
   /* position */
   /* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
   position: relative;
   /* size */
   width: 100%;
}

.slide_item {
   /* layout */
   display: flex;
   align-items: center;
   justify-content: center;
   /* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
   position: relative;
   left: 0px;
   /* size */
   width: 100%;
   height: 400px;
   /* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
   flex-shrink: 0;
   border-radius: 15px;
   /* transition */
   transition: left 0.15s;
}

.slide_button {
   /* layout */
   display: flex;
   justify-content: center;
   align-items: center;
   /* position */
   position: absolute;
   /* 버튼이 중앙에 위치하게 하기위해 계산 */
   top: calc(50% - 16px);
   /* size */
   width: 32px;
   height: 32px;
   /* style */
   border-radius: 100%;
   background-color: #cccc;
   cursor: pointer;
}

.slide_prev_button {
   left: 10px;
}

.slide_next_button {
   right: 10px;
}

/* 각 슬라이드가 변경되는 것을 시각적으로 확인하기 쉽도록 각 슬라이드별 색상 적용 */
.slide_item:nth-child(1) {
   background-color: white;
}

.slide_item:nth-child(2) {
   background-color: white;
}

.slide_item:nth-child(3) {
   background-color: white;
}

}
/* 페이지네이션 스타일 */
#slide_pagination {
   list-style-type: none;
   padding: 0;
   margin: 0;
}

#slide_pagination li {
   margin-left: 20px;
}

.slide_pagination {
   /* layout */
   display: flex;
   gap: 5px;
   /* position */
   position: absolute;
   bottom: 0;
   /* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
   left: 50%;
   transform: translateX(-50%);
}

.slide_pagination>li {
   /* 현재 슬라이드가 아닌 것은 투명도 부여 */
   color: #7fb5ff88;
   cursor: pointer;
   font-size: 25px;
}

.slide_pagination>li.active {
   /* 현재 슬라이드 색상은 투명도 없이 */
   color: #7fb5ff;
}
}
</style>
<link href="resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/home.css">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
   crossorigin="anonymous"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
   crossorigin="anonymous">
<link href="resources/css/slide.css" rel="stylesheet">

</head>
<body style="background-color: #f2f2f2">

   <header>


      <nav
         class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">


         <!-- Topbar Search -->
         <label>CouponBook</label>
         <form
            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
               <input type="text" class="form-control bg-light border-0 small"
                  placeholder="검색어 입력" aria-label="Search"
                  aria-describedby="basic-addon2">
               <div class="input-group-append">
                  <button class="btn btn-primary" type="button">
                     <i class="fas fa-search fa-sm"></i>
                  </button>
               </div>
            </div>
         </form>


         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" href="#" role="button"
                  data-bs-toggle="dropdown" aria-expanded="false" style=""> 카테고리
               </a>
                  <ul class="dropdown-menu">
                     <li><a class="dropdown-item" href="#">전체</a></li>
                     <li><a class="dropdown-item" href="#">편의점</a></li>
                     <li><a class="dropdown-item" href="#">커피/음료</a></li>
                     <li><a class="dropdown-item" href="#">외식</a></li>
                     <li><a class="dropdown-item" href="#">상품권</a></li>
                     <li><a class="dropdown-item" href="#">기타</a></li>
                  </ul></li>
            </ul>
         </div>




         <!-- Topbar Navbar -->
         <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none"><a
               class="nav-link dropdown-toggle" href="#" id="searchDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
            </a> <!-- Dropdown - Messages -->
               <div
                  class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                  aria-labelledby="searchDropdown">
                  <form class="form-inline mr-auto w-100 navbar-search">
                     <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                           placeholder="Search for..." aria-label="Search"
                           aria-describedby="basic-addon2">
                        <div class="input-group-append">
                           <button class="btn btn-primary" type="button">
                              <i class="fas fa-search fa-sm"></i>
                           </button>
                        </div>
                     </div>
                  </form>
               </div></li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1"><a
               class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
                  <span class="badge badge-danger badge-counter">3+</span>
            </a> <!-- Dropdown - Alerts -->
               <div
                  class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="alertsDropdown">
                  <h6 class="dropdown-header">알람</h6>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                     <div class="mr-3">
                        <div class="icon-circle bg-primary">
                           <i class="fas fa-file-alt text-white"></i>
                        </div>
                     </div>
                     <div>
                        <div class="small text-gray-500">날짜</div>
                        <span class="font-weight-bold">알람 내용</span>
                     </div>
                  </a>
               </div></li>

            <!-- Nav Item - Messages -->


            <div class="topbar-divider d-none d-sm-block"></div>

            <form class="r-flex" role="regist">
               <a class="btn btn-primary" href="write.jsp" style="margin: 15px;">상품
                  등록</a>
            </form>

            <!-- Nav Item - User Information -->

            <li class="nav-item dropdown no-arrow"><a
               class="nav-link dropdown-toggle" href="#" id="userDropdown"
               role="button" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false"> <span
                  class="mr-2 d-none d-lg-inline text-gray-600 small">사용자 이름
               </span> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                     fill="currentColor" class="bi bi-person-circle"
                     viewBox="0 0 16 16">
<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
<path fill-rule="evenodd"
                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
</svg>
            </a> <!-- Dropdown - User Information -->
               <div
                  class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="userDropdown">
                  <a class="dropdown-item" href="#"> <i
                     class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보
                  </a> <a class="dropdown-item" href="#"> <i
                     class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 내가 올린 쿠폰
                  </a> <a class="dropdown-item" href="#"> <i
                     class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 구매한 쿠폰
                  </a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#" data-toggle="modal"
                     data-target="#logoutModal"> <i
                     class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                     로그아웃
                  </a>
               </div></li>

         </ul>

      </nav>






   </header>
   <div class="container text-center" style="margin-top: 30px;">
      <div class="row">
         <div class="col">
            <div class="slide slide_wrap">

               <div class="slide_item">

                  <%
                     for (int i = 0; i < 4; i++) {
                  %>
                  <a class="card-link" href="#"
                     style="text-decoration: none; color: black; text-align: left; margin: 15px;">
                     <div class="card">
                        <img
                           src="data:image/png;base64,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"
                           class="card-img-top" alt="...">
                        <div class="card-body">
                           <p class="card-title">제목</p>
                           <div class="card-price">가격</div>
                           <div class="card-variety">종류</div>
                        </div>
                     </div>
                  </a>
                  <%
                     }
                  %>
               </div>

               <div class="slide_item">
                  <%
                     for (int i = 0; i < 4; i++) {
                  %>
                  <a class="card-link" href="#"
                     style="text-decoration: none; color: black; text-align: left; margin: 15px;">
                     <div class="card">
                        <img
                           src="data:image/png;base64,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"
                           class="card-img-top" alt="...">
                        <div class="card-body">
                           <p class="card-title">제목</p>
                           <div class="card-price">가격</div>
                           <div class="card-variety">종류</div>
                        </div>
                     </div>
                  </a>
                  <%
                     }
                  %>
               </div>
               <div class="slide_item">
                  <%
                     for (int i = 0; i < 4; i++) {
                  %>
                  <a class="card-link" href="#"
                     style="text-decoration: none; color: black; text-align: left; margin: 15px;">
                     <div class="card">
                        <img
                           src="data:image/png;base64,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"
                           class="card-img-top" alt="...">
                        <div class="card-body">
                           <p class="card-title">제목</p>
                           <div class="card-price">가격</div>
                           <div class="card-variety">종류</div>
                        </div>
                     </div>
                  </a>
                  <%
                     }
                  %>
               </div>
            </div>

            <div class="slide_prev_button slide_button">◀</div>
            <div class="slide_next_button slide_button">▶</div>
            <ul class="slide_pagination" id="slide_pagination"></ul>
         </div>
      </div>
   </div>

   <h1 style="margin-left: 250px; margin-top: 50px;">기한 임박 쿠폰</h1>
   <div class="container text-center"
      style="margin-top: 30px; background-color: white; border-radius: 15px;">
      <div class="row">
         <div class="col">
            <%
               for (int i = 0; i < 50; i++) {
            %>
            <div style="display: inline-block;">
               <div class="card" id="card" style="width: 18rem;">
                  <img
                     src="data:image/png;base64,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"
                     class="card-img-top" alt="...">
                  <div class="card-body">
                     <p class="card-title">제목</p>
                     <div class="card-price">가격</div>
                     <div class="card-variety">종류</div>
                  </div>
               </div>
            </div>

            <%
               }
            %>
         </div>
         <a href="#" id="load">Load More</a>
      </div>
   </div>




   <h1 style="margin-left: 250px; margin-top: 50px;">인기 쿠폰</h1>
   <div class="container text-center"
      style="margin-top: 30px; background-color: white; border-radius: 15px;">
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
                     <p class="card-title">제목</p>
                     <div class="card-price">가격</div>
                     <div class="card-variety">종류</div>
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
               style="font-weight: bold; text-decoration: none; color: black;">전체
               쿠폰 보기</a>
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

   <script>
      $(function() {
         $("#card").slice(0, 10).show(); // select the first ten
         $("#load").click(function(e) { // click event for load more
            e.preventDefault();
            $("div:hidden").slice(0, 10).show(); // select next 10 hidden divs and show them
            if ($("div:hidden").length == 0) { // check if any hidden divs still exist
               alert("No more divs"); // alert if there are none left
            }
         });
      });
   // 슬라이크 전체 크기(width 구하기)
      const slide = document.querySelector(".slide");
      let slideWidth = slide.clientWidth;

      // 버튼 엘리먼트 선택하기
      const prevBtn = document.querySelector(".slide_prev_button");
      const nextBtn = document.querySelector(".slide_next_button");

      // 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
      const slideItems = document.querySelectorAll(".slide_item");
      // 현재 슬라이드 위치가 슬라이드 개수를 넘기지 않게 하기 위한 변수
      const maxSlide = slideItems.length;

      // 버튼 클릭할 때 마다 현재 슬라이드가 어디인지 알려주기 위한 변수
      let currSlide = 1;

      // 페이지네이션 생성
      const pagination = document.querySelector(".slide_pagination");

      for (let i = 0; i < maxSlide; i++) {
        if (i === 0) pagination.innerHTML += `<li class="active"></li>`;
        else pagination.innerHTML += `<li></li>`;
      }

      const paginationItems = document.querySelectorAll(".slide_pagination > li");
      console.log(paginationItems);

      // 버튼 엘리먼트에 클릭 이벤트 추가하기
      nextBtn.addEventListener("click", () => {
        // 이후 버튼 누를 경우 현재 슬라이드를 변경
        currSlide++;
        // 마지막 슬라이드 이상으로 넘어가지 않게 하기 위해서
        if (currSlide <= maxSlide) {
          // 슬라이드를 이동시키기 위한 offset 계산
          const offset = slideWidth * (currSlide - 1);
          // 각 슬라이드 아이템의 left에 offset 적용
          slideItems.forEach((i) => {
            i.setAttribute("style", `left: ${-offset}px`);
          });
          // 슬라이드 이동 시 현재 활성화된 pagination 변경
          paginationItems.forEach((i) => i.classList.remove("active"));
          paginationItems[currSlide - 1].classList.add("active");
        } else {
          currSlide--;
        }
      });
      // 버튼 엘리먼트에 클릭 이벤트 추가하기
      prevBtn.addEventListener("click", () => {
        // 이전 버튼 누를 경우 현재 슬라이드를 변경
        currSlide--;
        // 1번째 슬라이드 이하로 넘어가지 않게 하기 위해서
        if (currSlide > 0) {
          // 슬라이드를 이동시키기 위한 offset 계산
          const offset = slideWidth * (currSlide - 1);
          // 각 슬라이드 아이템의 left에 offset 적용
          slideItems.forEach((i) => {
            i.setAttribute("style", `left: ${-offset}px`);
          });
          // 슬라이드 이동 시 현재 활성화된 pagination 변경
          paginationItems.forEach((i) => i.classList.remove("active"));
          paginationItems[currSlide - 1].classList.add("active");
        } else {
          currSlide++;
        }
      });

      // 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
      window.addEventListener("resize", () => {
        slideWidth = slide.clientWidth;
      });

      // 각 페이지네이션 클릭 시 해당 슬라이드로 이동하기
      for (let i = 0; i < maxSlide; i++) {
        // 각 페이지네이션마다 클릭 이벤트 추가하기
        paginationItems[i].addEventListener("click", () => {
          // 클릭한 페이지네이션에 따라 현재 슬라이드 변경해주기(currSlide는 시작 위치가 1이기 때문에 + 1)
          currSlide = i + 1;
          // 슬라이드를 이동시키기 위한 offset 계산
          const offset = slideWidth * (currSlide - 1);
          // 각 슬라이드 아이템의 left에 offset 적용
          slideItems.forEach((i) => {
            i.setAttribute("style", `left: ${-offset}px`);
          });
          // 슬라이드 이동 시 현재 활성화된 pagination 변경
          paginationItems.forEach((i) => i.classList.remove("active"));
          paginationItems[currSlide - 1].classList.add("active");
        });
      }
   </script>


   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
      crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.6.1.min.js"
      integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
      crossorigin="anonymous"></script>

   <script src="resources/vendor/jquery/jquery.min.js"></script>
   <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- Core plugin JavaScript-->
   <script src="resources//vendor/jquery-easing/jquery.easing.min.js"></script>
   <!-- Custom scripts for all pages-->
   <script src="resources//js/sb-admin-2.min.js"></script>
   <!-- Page level plugins -->
   <script src="resources//vendor/chart.js/Chart.min.js"></script>

   <!-- Page level custom scripts -->
   <script src="resources//js/demo/chart-area-demo.js"></script>
   <script src="resources//js/demo/chart-pie-demo.js"></script>
   <script src="resources/js/slide.js/"></script>

</body>
</html>