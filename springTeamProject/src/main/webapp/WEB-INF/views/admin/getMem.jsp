<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@include file="/WEB-INF/views/includes/admin_header.jsp"%>

<!-- 관리자  : 메뉴3: 회원 전체목록 부분  -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mt-5">

	<div class="row g-5">
      <div class="col-md-7 col-lg-8 m-auto">
      <form action="/mypage/delete_admin" method="post">
        <h4 class="mb-3 mt-5">회원 정보</h4>
          <div class="row g-3">
            
            
            <div class="col-8 mb-3">
              <label class="form-label">회원등급 </label>
              <label class="form-control"> <c:out value="${oneMem.user_grade}" /> </label>
            </div>
            
            <div class="col-8 mb-3">
              <label class="form-label">이메일 </label>
              <span class="form-control"> <c:out value="${oneMem.email }" /> </span>
            </div>
          
            <div class="col-8 mb-3">
              <label class="form-label">닉네임 </label>
              <span class="form-control"> <c:out value="${oneMem.nickname }" /> </span>
            </div>
          
            <div class="col-8 mb-3">
              <label class="form-label">ID </label>
              <span class="form-control"> <c:out value="${oneMem.user_id}" /> </span>
            </div>

            <div class="col-8 mb-3">
              <label class="form-label">이름 </label>
              <span class="form-control"> <c:out value="${oneMem.user_name}" /> </span>
            </div>

            <div class="col-8 mb-3">
              <label class="form-label">전화번호 </label>
              <span class="form-control"> <c:out value="${oneMem.phone}" /> </span>
            </div>
            
            <div class="col-6  mb-3">
              <label class="form-label">우편번호 <span class="text-muted">(Optional)</span></label>
			  <span class="form-control" > <c:out value="${oneMem.zip_no}" /> </span>
            </div>
            <div class="col-12 ">
              <label class="form-label">주소 <span class="text-muted">(Optional)</span></label>
				<span class="form-control" ><c:out value="${oneMem.addr}" /> </span><br>
            </div>
            <div class="col-6  mb-3">
              <label class="form-label">상세주소 <span class="text-muted">(Optional)</span></label>
				<span class="form-control" ><c:out value="${oneMem.addr2}" /> </span><br>
            </div>

          </div>
          <input type="hidden" value="${oneMem.email }" id="email" name="email" >
          <input type="hidden" value="${oneMem.user_id }" id="user_id" name="user_id">
			<input type="submit" class="btn btn-warning btn-lg mb-3" value="회원제재">

          <button class="btn btn-warning btn-lg mb-3" onclick="history.back();">뒤로가기</button>
        </form>
      </div>
    </div>      
      
      
    </main>
  </div>
</div>


<%@include file="/WEB-INF/views/includes/admin_footer.jsp"%>