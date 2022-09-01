<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="/resources/report.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

<!-- 신고 기능 모달 창 -->
<button class="modal_btn_report">신고</button>
<div class="modal_report">
	<div class="modal_report_content">
		<table>
			<tr class="modal-header">
				<td>신고종류</td>
				<td>
					<select id="re_title">
						<option value="">유형선택</option>
						<option value="1">허위매물</option>
						<option value="2">삼자거래사기</option>
						<option value="3">또 추가할 항목</option>
					</select>
				</td>
			</tr>
			<tr class="modal-body">
				<td>상세내용</td>
				<td><textarea rows="10" cols="50" id="re_content"></textarea></td>
			</tr>
			<!-- 버튼 중앙 정렬 혹은 우측 정렬 해야함 -->
			<tr>
				<td>
					<button id="report_submit">확인</button>
					<button id="report_cancel">취소</button>
				</td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="comment.jsp" %>

<script>
$(".modal_btn_report").click(function(){
	$(".modal_report").fadeIn();
});
$("#report_cancel").click(function(){
	$(".modal_report").fadeOut();
});
</script>
</body>
</html>