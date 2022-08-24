<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>



<script type="text/javascript">
$('#Comment_regist').click(function() {
	
		//Json으로 전달할 파라미터 변수선언
		const com_bno = ${board_no};
		const com_writer = $('#com_writer').val();
		const com_content = $('#com_content').val();
	
		if(com_writer == ''){
			alert('로그인 후 이용해주세요');
			return;
		}else if(com_content == '') {
			alert('내용을 입력하세요');
		}
		
		$.ajax({
			type:'post',
			url:'<c:url value="/replies/new"/>',
			data: JSON.stringify(
				{
					"com_bno":com_bno,
					"com_writer":com_writer,
					"com_content":com_content
				}		
			),
			contentType: 'application/json',
			success:function(data){
				console.log('통신성공' + data);
				if(data === 'InsertSuccess') {
					alert('댓글 등록이 완료되었습니다.');
					console.log('댓글 등록 완료');
					$('#com_writer').val(com_writer);
  					$('#com_content').val('');
  					getList();
				} else {
					alert('로그인 이후 이용해주시기 바랍니다.');
					console.log('댓글 등록 실패');
				}
			},
			error:function(){
				alert('통신실패');
			}
		});
		
});
</script>
</body>
</html>