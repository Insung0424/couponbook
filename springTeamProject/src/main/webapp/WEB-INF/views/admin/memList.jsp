<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@include file="/WEB-INF/views/includes/admin_header.jsp"%>

<!-- 관리자  : 메뉴3: 회원 전체목록 부분  -->
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mt-5">

      <h2>회원 목록</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">회원 ID</th>
              <th scope="col">닉네임</th>
              <th scope="col">이메일</th>
              <th scope="col">이름</th>
              <th scope="col">회원 등급</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${memAllList }" var="memList">
            <tr>
              <td> <c:out value="${memList.user_id }" /> </td>
              <td> <c:out value="${memList.nickname }" /></td>
              <td> <c:out value="${memList.email }" /></td>
              <td> <c:out value="${memList.user_name }" /></td>
              <td> <c:out value="${memList.user_grade}" /></td>
            </tr>
           </c:forEach>

          </tbody>
        </table>
        
        <!-- 검색기능 추가 -->
	        <form id='searchMemForm' action="/admin/memList" method='get'>
        <div class="bd-search  d-flex justify-content-end" id="memSearch" >
	        <div class="input-group mb-3 w-25">
	        	<!-- 검색 조건 설정 pageMaker.cri.type 은 input hidden 으로 넘겨줌 -->
				<input type="text" class="form-control" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
				<input type='hidden' name='type' value='<c:out value="TWC"/>' /> 
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
      
		<form id='actionForm' action="/admin/memList" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>
      
    </main>
  </div>
</div>


<script type="text/javascript">
	$(document)
	.ready(
	function() {
	
		var actionForm = $("#actionForm");
		$(".page-item a").on( "click",
			function(e) {
				e.preventDefault();
				console.log('click');
			
				actionForm.find("input[name='pageNum']")
						.val($(this).attr("href"));
				actionForm.submit();
			});
		
		
		var searchMemForm = $("#searchMemForm");
		$("#searchMemForm button").on( "click",
			function(e) {
				/* if (!searchMemForm.find("option:selected") .val()) {
					alert("검색종류를 선택하세요");
					return false;
				} */
				if (!searchMemForm.find( "input[name='keyword']").val()) {
					alert("키워드를 입력하세요");
					return false;
				}
				searchMemForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchMemForm.submit();
			});
	
	});
</script>



<%@include file="/WEB-INF/views/includes/admin_footer.jsp"%>