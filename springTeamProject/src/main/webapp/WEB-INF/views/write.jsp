<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon"
   href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/favicon.ico" />'
   type="image/x-icon">
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
   crossorigin="anonymous">

<style type="text/css">
#result_card img {
   max-width: 100%;
   height: auto;
   display: block;
   padding: 5px;
   margin-top: 10px;
   margin: auto;
}

#result_card {
   position: relative;
}

#imgDeleteBtn {
   position: absolute;
   top: 0;
   right: 1%;
   background-color: #ef7d7d;
   color: wheat;
   font-weight: 900;
   width: 30px;
   height: 30px;
   border-radius: 50%;
   line-height: 26px;
   text-align: center;
   border: none;
   display: block;
   cursor: pointer;
}
</style>
<style>
input[type='number']::-webkit-outer-spin-button, input[type='number']::-webkit-inner-spin-button
   {
   -webkit-appearance: none;
   margin: 0;
}
</style>
</head>
<body>
   <!-- Page Wrapper -->
   <div id="wrapper">

      <!-- Sidebar -->
      <%@include file="/WEB-INF/views/includes/main_sidebar.jsp"%>

      <!-- Sidebar end -->

      <!-- Main Content -->
      <div id="content"
         style="width: 100%; min-height: 100%; position: relative; margin: 0;">

         <%@include file="/WEB-INF/views/includes/main_header.jsp"%>


         <form action="/product_add" method="post"
            enctype="multipart/form-data" name="form" onsubmit="return su()">
            <div class="container" style="margin-top: 30px;">
               <div class="row"
                  style="background-color: white; border-radius: 15px; padding: 30px;">
                  <div class="row">
                     <div class="col">
                        <h2 style="margin-bottom: 30px;">상품 등록</h2>
                     </div>
                     <div class="col" style="margin-top: 10px;">
                        <button type="submit" class="btn btn-primary"
                           style="float: right; margin-bottom: 10px; margin-right: 5px;">등록</button>
                        <button type="reset" class="btn btn-secondary"
                           style="float: right; margin-bottom: 10px; margin-right: 5px;">취소</button>
                     </div>

                     <hr style="height: 1px; background-color: black;">
                  </div>


                  <div class="col">
                     <hr>
                     <div class="row">
                        <div class="col">
                           <p>
                              <b>글 제목</b>
                           </p>
                           <input type="text" name="pd_name" placeholder="제목을 입력하세요"
                              style="width: 500px; margin-bottom: 10px;">

                        </div>
                        <div class="col">

                           <p>
                              <b>상품권 유형</b>
                           </p>
                           <select name="category_id"
                              style="margin-bottom: 10px; width: 100px;">
                              <option value="">-------</option>
                              <option value="1">편의점</option>
                              <option value="2">커피/음료</option>
                              <option value="3">외식</option>
                              <option value="4">상품권</option>
                              <option value="5">기타</option>
                           </select>

                        </div>

                     </div>
                     <!-- file upload -->

                     <div style="margin-bottom: 30px;">
                        <p>
                           <b>상품권 사진 첨부</b>
                        </p>
                        <input type="file" name="file">
                        <div id="uploadData"></div>
                     </div>



                     <div class="row">
                        <div class="col">
                           <p>
                              <b>정가</b>
                           </p>
                           <input type="text" name="pd_price0" placeholder="가격을 입력해주세요"
                              style="margin-bottom: 10px;"> 원
                        </div>
                        <div class="col">
                           <p>
                              <b>판매하려는 가격</b>
                           </p>
                           <input type="text" name="pd_price" placeholder="가격을 입력해주세요"
                              style="margin-bottom: 10px;"> 원
                        </div>
                        <div class="col">

                           <p>
                              <b>할인율</b><b><input type="button" name="nanu"
                                 value="할인율 계산" onclick="nanugi()" style="margin-left: 10px;"></b>
                           </p>

                           <input type="number" name="pd_discount" placeholder="할인율 계산결과"
                              value="" style="margin-bottom: 10px;"> %
                        </div>


                     </div>

                     <p>
                        <b>사용처</b>
                     </p>
                     <input type="text" name="company_name" placeholder="사용처를 입력해주세요"
                        style="margin-bottom: 10px;">
                     <p>
                        <b>온라인/오프라인 구분</b>
                     </p>
                     <select name="location_id"
                        style="margin-bottom: 10px; width: 100px;">
                        <option value="">-------</option>
                        <option value="1">온라인</option>
                        <option value="2">오프라인</option>
                     </select>
                     <p>
                        <b>사용기한</b>
                     </p>
                     <input type="date" name="pd_date" pattern="yyyy-MM-dd"
                        style="margin-bottom: 10px;"> <input type="hidden"
                        name="pd_img" id="pd_img"> <input type="hidden"
                        name="pd_desc" id="pd_desc"> <input type="hidden"
                        name="user_id" value="${mem.user_id}">




                     <p>
                        <b>상품권 설명</b>
                     </p>
                     <textarea class="form-control" id="write_editor"
                        name="write_editor" rows="5"></textarea>
                     <script type="text/javascript">
                        CKEDITOR.replace('write_editor');
                     </script>


                  </div>
               </div>
            </div>

         </form>
      </div>
   </div>
	
	<script src="/../resources/write.js"></script>
   <script>
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
      crossorigin="anonymous"</script>
         <script
      src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>