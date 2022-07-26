<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>

<!-- Custom fonts for this template-->
<link href="../resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/home.css">
<link
   href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
   rel='stylesheet' type='text/css'>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="../resources/report.css"><!-- 신고기능모달창을 위한 css 삭제하면 모달창이 아니라 페이지에 추가되는 방식으로 작동함 -->

</head>
<body>

<!-- 거래완료 -->
<input type="button" id="modal_TradingEnd" class="btn btn-primary"
style="display: block;" value="거래완료하기"/>
<div id="modal_trade">
	<div id="modal_trade_content"></div>
</div>

<!-- 신고 기능 모달 창 -->
<button id="modal_btn_report" class="btn btn-primary">신고</button>

<div id="modal_report">
	<div id="modal_report_content">
		<div class="modal-header">
			<div class="modal-title">
				불량사용자신고
			</div>
		</div>
		<div class="modal-body">
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">신고종류</label>
			  <select id="re_title" class="form-select form-select-sm">
					<option value="">유형선택</option>
					<option value="1">허위매물</option>
					<option value="2">삼자거래사기</option>
					<option value="3">또 추가할 항목</option>
			  </select>
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">상세내용</label>
			  <textarea class="form-control" id="editor4" name="editor4" rows="5"></textarea>
				<script type="text/javascript">
				    CKEDITOR.replace( 'editor4' );
				</script>
			</div>
		</div>
		<div class="modal-footer">
			<button id="report_submit" class="btn btn-primary">확인</button>
			<button id="report_cancel" class="btn btn-primary">취소</button>
		</div>
	</div>
</div>

<%@ include file="comment.jsp" %>

<script>
$(document).ready(function (){
	$("#modal_report").hide();
});
$("#modal_btn_report").click(function(){
	$("#modal_report").fadeIn();
});
$("#report_cancel").click(function(){
	$("#modal_report").fadeOut();
});

$("#modal_TradingEnd").click(function(){
	//버튼 숨기기,보이기
	$("#modal_TradingEnd").toggle(); 
	// 거래 완료 유형선택자 페이지 제공	
	$("#modal_trade_content").load("buyerTradeEnd");
	// 한번 로드 후 취소누르면 hide로 내용을 숨김처리하므로 show로 보여줌
	if($("#modal_trade_content").load("buyerTradeEnd")){
		$("#modal_trade_content").show("buyerTradeEnd");
	}
});
</script>
</body>
</html>