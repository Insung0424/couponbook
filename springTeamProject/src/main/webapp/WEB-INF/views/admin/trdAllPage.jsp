<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@include file="/WEB-INF/views/includes/admin_header.jsp"%>

<!-- 관리자  : 메뉴2: 거래내역 전체목록 부분  -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mt-5">
    
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
        
        <!-- 검색기능 추가  -->
        <form id='searchTrdForm' action="/admin/trdAllPage" method='get'>
        <div class="bd-search  d-flex justify-content-end" id="trdSearch" >
        	<div class="input-group mb-3 w-50">
         
		  		<input type="text" class="datepicker_input form-control" placeholder="검색  시작일" id="sdate" name="sdate" value='<c:out value="${pageMaker.cri.sdate}"/>' required aria-label="Date input 3 (using aria-label)">
		  		<input type="text" class="datepicker_input form-control" placeholder="검색  종료일" id="edate" name='edate' value='<c:out value="${pageMaker.cri.edate}"/>' required aria-label="Date input 3 (using aria-label)">
         
	        	<!-- 검색 조건 설정  pageMaker.cri.type 은 input hidden 으로 넘겨줌 : 날짜만 검색  -->
				<input type='hidden' name='type' value='<c:out value="T"/>' />  
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
				<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
			</div>
        </div>
        </form>
        
        <!-- 페이징 추가 -->
        <div  aria-label="Page navigation example" class='pull-right'>
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
	              <li class="page-item">
	              	<a class="page-link" href="${pageMaker.startPage -1}" aria-label="Previous">
	              		<span aria-hidden="true">&laquo;</span>
					</a>
	              </li>
	            </c:if>
	
	            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	              <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""} ">
	              	<a class="page-link" href="${num}">${num}</a>
	              </li>
	            </c:forEach>
	
	            <c:if test="${pageMaker.next}">
	              <li class="page-item">
	              	<a class="page-link" href="${pageMaker.endPage +1 }" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			        </a>
	              </li>
	            </c:if> 
			</ul>
		</div>
		<!--  end Pagination -->
      </div>
      
		<form id='actionForm' action="/admin/trdAllPage" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
			<input type='hidden' name='sdate' value='<c:out value="${ pageMaker.cri.sdate }"/>'>
			<input type='hidden' name='edate' value='<c:out value="${ pageMaker.cri.edate }"/>'>
		</form>
      
    </main>
  </div>
</div>


<script type="text/javascript">
	$(document).ready( function() {
	
		var actionForm = $("#actionForm");
		$(".page-item a").on( "click", function(e) {
			e.preventDefault();
			console.log('click');
		
			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
		});
		
		var sdate = $("#sdate");
		$('.datepicker_input').datepicker({
		    format: 'yyyy-mm-dd',
		    autoclose: true,
		    language: 'ko'
		})
		.on('changeDate', function (e) {
	         console.log(e.date +" / "+ sdate.val() );
	      })
		
		
		var searchTrdForm = $("#searchTrdForm");
		$("#searchTrdForm button").on( "click", function(e) {
			if (!searchTrdForm.find( "input[name='sdate']").val()) {
				alert("날짜를 입력하세요");
				return false;
			}
			searchTrdForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchTrdForm.submit();
		});
		
	});
</script>


<%@include file="/WEB-INF/views/includes/admin_footer.jsp"%>