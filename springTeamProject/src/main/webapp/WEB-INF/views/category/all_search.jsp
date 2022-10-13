
<!DOCTYPE html><%@ page language="java"
   contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<head>
<link rel="shortcut icon" href='<c:url value="/resources/favicon.png" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/favicon.png" />' type="image/x-icon">

<meta name="google-site-verification" content="W2SP-3NSepUh9GRqINVyqPzBUn54Jb_MQaqgDfllql4" />

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>CouponBook</title>

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

#card_content:hover {
   text-decoration: none;
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
                  style="background-color: white; margin-bottom: 30px; border-radius: 10px;">
                  <p class="title_name">"<c:out value="${search_name }"/>" 검색 결과</p>
                  <!--  -->

                  <ul style="width: 100%; display: flex; flex-wrap: wrap;">
                     <c:forEach items="${search }" var="search">

                        <li style="list-style: none; margin-left: 25px;margin-bottom:25px; width: 30%;  border-radius: 15px;  box-shadow: 5px 5px 5px grey ;"
                           class="card_dis"><a id="card_content"
                           href='/category/detail?product_id=<c:out value="${search.product_id }"/>'>
                              <div class="card_poto">
                            <c:set var="img" value="${fn:split(search.pd_img, ',')[1]}"></c:set>
							<c:set var="simg2" value="${fn:replace(img, '%2F', '/')}"></c:set>
							
                                 <img style="width: 100%; height: 100%;"
                           src="/getImg?fileNameNPath=${simg2}" alt="Not Found Image">
                                    
                              </div>
                              <div class="card_info">

                                 <div class="card_title_content">

                                    <p class="card_title">${search.pd_name }</p>
                                 </div>
                                 <c:set var="price1" value="${search.pd_price0 }"></c:set>
                                 <c:set var="price2" value="${search.pd_price }"></c:set>
                                 <p class="card_adr"  style="text-decoration:line-through;">${price1 }원</p>
                                 
                                 <p class="card_adr" style="">${price2 }원</p>
                                 <p class="card_adr" id="p_discount" style="color: red;font-size:2em; font-weight: bold; text-align: right;">${search.pd_discount }%</p>
                                <!-- 원래 할인율 출력을 위해 짜려던 동적태그생성방식 깜빡하고 그냥 태그에 바로 값을 넣어서 오류가 생긴거였음 
                             
                                 <script>
                                 	let pd_discount = Math.round(eval(100-((${price2 }/${price1 })*100)));
									let discount_html = "<span>"+pd_discount+"%</span>";                                 	
                                 	$("#p_discount").html(discount_html);
                                 </script> -->
                                 <p class="card_option">
                                    <c:set var="category_id" value="${search.category_id }" />
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



</body>
</html>