<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%@include file="/WEB-INF/views/includes/admin_header.jsp"%>

<!-- 관리자 메인 : 메뉴1: Dashboard 부분  -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard  <span class="fs-5"> 거래내역 차트</span></h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <!-- <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div> -->
          
          <div class="dropdown">
	          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            <span data-feather="calendar" class="align-text-bottom"></span>
	            This week
	          </button>
	          
	          <ul class="dropdown-menu">
				  <li><a class="dropdown-item" href="#">Action</a></li>
				  <li><a class="dropdown-item" href="#">Another action</a></li>
				  <li><a class="dropdown-item" href="#">Something else here</a></li>
			  </ul>
          </div>
          
        </div>
      </div>

<!-- 차트 : 데이터 dashboard.js -->
		<input type="hidden" id="cntDate" value="22/08/08">
      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>


      <h2>Section title</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">상품 ID</th>
              <th scope="col">판매자 ID</th>
              <th scope="col">구매자 ID</th>
              <th scope="col">거래상태</th>
              <th scope="col">거래 일시</th>
            </tr>
          </thead>
          <tbody>
          
          <c:forEach items="${tradeList }" var="tList">
            <tr>
              <td> <c:out value="${tList.product_id }" /> </td>
              <td> <c:out value="${tList.sell_user_id }" /></td>
              <td> <c:out value="${tList.buyer_user_id }" /></td>
              <td> <c:out value="${tList.pd_status }" /></td>
              <td> <c:out value="${tList.trade_time }" /></td>
            </tr>
           </c:forEach>



          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>


<%@include file="/WEB-INF/views/includes/admin_footer.jsp"%>
