<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">내 댓글 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">내 댓글</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>제품번호</th>
							<th>유저아이디</th>
							<th>댓글내용</th>
							<th>게시시간</th>
						
							
						</tr>
					</thead>
					<tbody>
					
							<tr>
								
								<td><c:out value="${comment.product_id}" /></td>
								<td><c:out value="${comment.user_id}"/></td>
								<td><c:out value="${comment.comment_content}"/></td>
								<td><c:out value="${comment.comment_write_time}"/></td>
						
							</tr>
					
					</tbody>

				</table>
				</div>
				</div>
				</div>
				</div>