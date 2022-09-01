<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@include file="/WEB-INF/views/includes/admin_header.jsp"%>

<!-- 관리자  : 메뉴2: 거래내역 전체목록 부분  -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

      <h2>거래 목록</h2>
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
          
          <c:forEach items="${tradeAll }" var="tAllList">
            <tr>
              <td> <c:out value="${tAllList.product_id }" /> </td>
              <td> <c:out value="${tAllList.sell_user_id }" /></td>
              <td> <c:out value="${tAllList.buyer_user_id }" /></td>
              <td> <c:out value="${tAllList.pd_status }" /></td>
              <td> <c:out value="${fn:substring(tAllList.trade_time,0,10) }" /></td>
            </tr>
           </c:forEach>



          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>


<%@include file="/WEB-INF/views/includes/admin_footer.jsp"%>