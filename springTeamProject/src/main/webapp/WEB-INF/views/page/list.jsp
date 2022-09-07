<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">DataTables Advanced Tables</div>
			<button id="btn" type="button">등록</button>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>상품 번호</th>
							<th>판매자 아이디</th>
							<th>제목</th>
							<th>기한</th>
							<th>할인율</th>
							<th>작성 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="pv">
							<tr class="odd gradeX">
								<td><c:out value="${pv.board_no}" /></td>
								<td><c:out value="${pv.product_id}" /></td>
								<td>${pv.user_id}</td>
								<td><a class="m" href='<c:out value="${pv.board_no}"/>'>
							<c:out value="${pv.board_title }"/></a></td>
								<td><c:out value="${pv.pd_date}" /></td>
								<td><c:out value="${pv.pd_discount}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${pv.board_write_time}" /></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				
				<form id="search" action="/page/list" method="get">
					<select name="type">
						<option value="" ${pp.p.type==null?"selected":""}>-----</option>
						<option value="T" ${pp.p.type eq 'T'?" selected":""} >제목</option>
						<option value="C" ${pp.p.type eq 'C'?" selected":""} >내용</option>
						<option value="W" ${pp.p.type eq 'W'?" selected":""} >작성자 아이디</option>
						<option value="TC" ${pp.p.type eq 'TC'?" selected":""} >제목+내용</option>
					</select>
					<input type="text" name="keyword" value='${pp.p.keyword }'>
					<input type="hidden" name="pNum" value='${pp.p.pNum }'>
					<input type="hidden" name="amount" value='${pp.p.amount }'>
				
					<button class="btn btn-default">검색</button>
				
				</form>
				
				
			
				<div>
					<ul class="pagination">
						<c:if test="${pp.prev}">
							<li class="paginate_button previous"><a href="${pp.start-1 }">이전</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pp.start}"
							end="${pp.end}">
							<li class="paginate_button ${pp.p.pNum == num?"active":""} ">
								<a href="${num }">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pp.next}">
							<li class="paginate_button next"><a href="${pp.end+1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
				
				<!--  end Pagination -->
				<form id='act' action="/page/list" method='get'>
					<input type='hidden' name='pNum'
						value='${pp.p.pNum}'>
						 <input type='hidden'
						name='amount' value='${pp.p.amount}'>
						<input type='hidden'
						name='type' value='${pp.p.type}'>
						<input type='hidden'
						name='keyword' value='${pp.p.keyword}'>
				</form>
			</div>
		</div>
	</div>


	<div class="modal fade" id="my" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">성공!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">저장</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	�
	<script type="text/javascript">
		$(document).ready(function() {

			var r = '<c:out value="${result}"/>';

			check(r);
			function check(r) {

				if (r=== '') {
					return;
				}
				if (parseInt(r) > 0) {
					$(".modal-body").html("글" + parseInt(r) + "번이 등록됐습니다.")
				}
				$("#my").modal("show");

			}

			$("#btn").on("click", function() {
				self.location = "/page/submit";
			});
			
			var act = $("#act");
		    
		    $(".paginate_button a").on("click", function(e) {
		          
		      e.preventDefault();       
		      
		      var tar= $(this).attr("href");
		      act.find("input[name='pNum']").val(tar);
		    
		      act.submit();
		});
		    
		    $(".m").on("click", function(e){
	            
		        e.preventDefault();
		        
		        var targetBno=$(this).attr("href");
		        
		        act.append("<input type='hidden' name='board_no' value='"+targetBno+"'>'");
		        act.attr("action","/page/get");
		        act.submit();

			
			 
		 });
		    
		    var search = $("#search");
		    $("#search button").on("click",function(e){
		    	e.preventDefault();
		    	console.log("....click");
		    	
		    	search.find("input[name='pNum']").val(1);
		    	
		    	search.submit();
		    })

		});
	</script>











