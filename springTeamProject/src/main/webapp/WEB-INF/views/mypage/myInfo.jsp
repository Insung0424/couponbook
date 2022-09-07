<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">마이페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">마이페이지</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>이메일</th>
							<th>닉네임</th>
							<th>회원등급</th>
							<th>이름</th>
							<th>연락처</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${info }" var="user">
							<tr>
								
								<td><c:out value="${user.email}" /></td>
								<td><c:out value="${user.nickname}"/></td>
								<td><c:out value="${user.user_grade}"/></td>
								<td><c:out value="${user.user_name}"/></td>
								<td><c:out value="${user.phone}"/></td>
								<td><c:out value="${user.addr}"/></td>
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
				</div>
				</div>
				</div>
				</div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">마이페이지</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">마이페이지</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>이메일</th>
							<th>닉네임</th>
							<th>회원등급</th>
							<th>이름</th>
							<th>연락처</th>
							<th>주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${info }" var="user">
							<tr>
								
								<td><c:out value="${user.email}" /></td>
								<td><c:out value="${user.nickname}"/></td>
								<td><c:out value="${user.user_grade}"/></td>
								<td><c:out value="${user.user_name}"/></td>
								<td><c:out value="${user.phone}"/></td>
								<td><c:out value="${user.addr}"/></td>
								
							</tr>
						</c:forEach>
					</tbody>

				</table>
				</div>
				</div>
				</div>
				</div>
>>>>>>> 871bf1e703a49dad5376954c719c7662725e19f9
				