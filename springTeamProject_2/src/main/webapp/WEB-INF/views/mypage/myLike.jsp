<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">내 관심상품</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">관심상품</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>유저아이디</th>
							<th>제품번호</th>
							<th>관심상품 등록</th>
						

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${like }" var="like">
							<tr>
								
								<td><c:out value="${like.user_id}" /></td>
								<td><c:out value="${like.product_id}"/></td>
								<td><c:out value="${like.like_created}"/></td>
								
								
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
				</div>
				</div>
				</div>
				</div>
				