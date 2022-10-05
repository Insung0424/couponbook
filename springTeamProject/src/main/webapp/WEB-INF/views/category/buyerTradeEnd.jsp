<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trading End</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<select name="pd_status" id="pd_status" class="form-select form-select-sm">
			<option value="">거래유형선택</option>
			<option value="2">정상거래완료</option>
			<option value="3">사기거래신고</option>
	</select>
	<input id="Trade" type="button" class="btn btn-primary" value="확인">
	<input type="button" id="cancel" class="btn btn-primary" value="취소">
<script type="text/javascript">
$("#Trade").click(function (){
	
	if($("#pd_status").val() == ""){
		return alert('거래유형을 선택하세요');
	}
	else if($("#pd_status").val() == 3){
		$("#modal_report").fadeIn();
		$("#modal_trade_content").hide("trade");
		$("#modal_TradingEnd").toggle();
	}
	else{
		let pd_status = $("#pd_status").val();
		let product_id = $("#product_id").val();
		let sell_user_id = $("#user_id").val();
		let buyer_user_id = $("#mem_id").val();
		
		$.ajax({
			type:'post',
			url : '/category/postTrade',
			data : JSON.stringify({
				"pd_status" : pd_status,
                "product_id" : product_id,
                "sell_user_id" : sell_user_id,
                "buyer_user_id" : buyer_user_id
			}),
			contentType : 'application/json',
			success : function(data){
				if(data.good == 'good'){
					alert('거래가 완료되었습니다');
					$("#modal_trade_content").hide("trade");
					$("#modal_TradingEnd").toggle();
				}
			},
			error : function(){
				alert("네트워크 상태가 불안정합니다");
			}
		});
		
	}
});

$("#cancel").click(function cancel(){
	$("#modal_trade_content").hide("trade");
	$("#modal_TradingEnd").toggle();
});

</script>
</body>
</html>