<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">여긴 상세페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">조회</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>글번호</label> <input class="form-control" name="board_no"
						readonly="readonly" value="${detail.board_no}"/>
				</div>
				
				<div class="form-group">
					<label>상품 번호</label> <input class="form-control" name="product_id"
						readonly="readonly" value='<c:out value="${detail.product_id}"/>'>
				</div>

				<div class="form-group">
					<label>판매자 아이디</label> <input class="form-control" name="user_id"
						readonly="readonly" value='<c:out value="${detail.user_id}"/>'>
				</div>
				
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="board_title"
						readonly="readonly" value='<c:out value="${detail.board_title}"/>'>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="5" cols="50" name="board_content"><c:out
							value="${detail.board_content}" /></textarea>
				</div>

				



				<!--  <form id='act' action="/page/list" method='get'>
					<input type='hidden' name='pNum' value='${p.pNum }'>
					<input type='hidden' name='amount' value='${p.amount }'>
					<input type='hidden' name='board_no' value='${page.board_no }'>
					<input type='hidden' name='type' value='${p.type }'>
					<input type='hidden' name='keyword' value='${p.keyword }'>
				</form>-->

				<button type="button" class="btn btn-default list">
					<a href='/page/list'>목록</a>
				</button>
				<!-- <button type="button" class="btn btn-default mod">
					<a href='/page/modify?board_no=<c:out value="${page.board_no }"/>'>수정</a>
				</button>-->

				<script>
                       			
     var act = $("#act");
                       		
     $(".list").click(function(e){
        e.preventDefault();
        act.find("input[name='board_no']").remove();
        act.submit();
        })
                       		
      $(".mod").click(function(e){
         e.preventDefault();
         act.attr("action","/page/modify");
         act.submit();
        })
                       		
                       		
    </script>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>


<!-- /.row -->
