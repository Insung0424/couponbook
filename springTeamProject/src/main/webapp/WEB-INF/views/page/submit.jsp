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
			<div class="panel-heading">게시판 등록</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="/page/submit" method="post">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="board_title">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="5" cols="30" name="board_content" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<label>글쓴이</label>
						<input class="form-control" name="user_id">
					</div>
					<button type="submit" class="btn btn-default">등록</button>
                    <button type="reset" class="btn btn-default">취소</button>

				</form>
				</div>
				</div>
				</div>
				</div>
				
				
				
				