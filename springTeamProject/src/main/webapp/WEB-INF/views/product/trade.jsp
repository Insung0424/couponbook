<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trading End</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$("select[name=pd_status]").change(function(){
	console.log($(this).val());
});

	/*if($("#pd_status").val() == ""){
		form.ps_status.focus();
		alert("유형을 선택해주세요");
		return false;
	}else if($("#pd_status").val() == 2){
		$(".modal_report").fadeIn();
		return true;
	}else{
		$("거래가 완료되었습니다")
		return true;
	}*/
</script>
</head>
<body>
<form name="form" class="trade_form" action="putTrade" method="post">
	<select id="pd_status">
			<option value="">유형선택</option>
			<option value="1">정상거래완료</option>
			<option value="2">사기거래신고</option>
	</select>
	<button type="submit">확인</button>
	<button class="cancel">취소</button>
</form>
</body>
</html>