<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">내 신고</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">신고</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>유저아이디</th>
							<th>신고종류</th>
							<th>신고내용</th>
						

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${report }" var="re">
							<tr>
								
								<td><c:out value="${re.user_id}" /></td>
								<td><c:out value="${re.re_title}"/></td>
								<td><c:out value="${re.re_content}"/></td>
								<td><c:out value="${re.re_time}"/></td>
								
								
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
				</div>
				</div>
				</div>
				</div>