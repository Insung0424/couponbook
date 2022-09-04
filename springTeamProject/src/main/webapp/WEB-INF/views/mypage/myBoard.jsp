<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">내 게시글</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>글번호</th>
							<th>상품번호</th>
							<th>글제목</th>
							<th>유저아이디</th>
							<th>글내용</th>
							<th>게시시간</th>
							<th>할인율</th>
							<th>유효기간</th>
							
							
						</tr>
					</thead>
					<tbody>
					<input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
						
							<tr>
								
								<td><c:out value="${board.board_no}" /></td>
								<td><c:out value="${board.product_id}"/></td>
								<td><c:out value="${board.board_title}"/></td>
								<td><c:out value="${board.user_id}"/></td>
								<td><c:out value="${board.board_content}"/></td>
								<td><c:out value="${board.board_write_time}"/></td>
								<td><c:out value="${board.pd_discount}"/></td>
								<td><c:out value="${board.pd_date}"/></td>					
							</tr>
					
					</tbody>

				</table>
				</div>
				</div>
				</div>
				</div>