<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
${serverTime}
	<h3>댓글</h3>
	<hr>
	<div id="comment_add">
		<table class="comment_table">
			<tr>
				<td class="title">작성자</td>
				<td class="input"><input type="text" id="writer"/></td>
			</tr>
			<tr>
				<td class="title">댓글내용</td>
				<td class="input"><textarea rows="3" cols="50" id="com_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
				<button type="button" id="add_btn">댓글등록</button></td>
			</tr>
		</table>
		<div id="add_message">&nbsp;</div>
	</div>
	
	<div id="comment_list"></div>
	
	<div id="comment_modify">
		<table class="comment_table">
			<tr>
				<td class="title">작성자</td>
				<td class="input"><input type="text" id="modify_writer"/></td>
			</tr>
			<tr>
				<td class="title">댓글내용</td>
				<td class="input"><textarea rows="3" cols="50" id="modify_com_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
				<button type="button" id="modify_btn">댓글수정</button>&nbsp;
				<button type="button" id="modify_cancel_btn">취소</button>&nbsp;				
				</td>
			</tr>
		</table>
		<div id="modify_message">&nbsp;</div>
	</div>
	
	<div id="comment_remove">
		<div id="remove_message">
			<b>댓글을 삭제하시겠습니까</b>
			<button type="button" id="remove_btn">댓글삭제</button>
			<button type="button" id="remove_cancel_btn">취소</button>
		</div>
		<div id="remove_message">&nbsp;</div>
	</div>
	
	
<script type="text/javascript">
$("#add_btn").click(function(){
	const product_id = ${vo.product_id};
	const user_id = ${vo.user_id};
	const comment_content = $("#com_content").val();
	
	console.log(product_id);
	console.log(user_id);
	console.log(com_content);
	
	if(user_id == ''){
			alert('로그인 후 이용해주세요');
			return;
		}else if(com_content == '') {
			alert('내용을 입력하세요');
		};
		
		$.ajax({
			type:'post',
			url:'<c:url value="/replies/new"/>',
			data: JSON.stringify(
				{
					"product_id":product_id,
					"user_id":user_id,
					"comment_content":comment_content
				}		
			),
			contentType: 'application/json',
			success:function(data){
				console.log('통신성공' + data);
				if(data == "InsertSuccess") {
					alert('댓글 등록이 완료되었습니다.');
					console.log('댓글 등록 완료');
					$('#user_id').val(user_id);
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

getList();	

function getList() {
	const user_id_1 = ${vo.user_id};
	$.getJSON("<c:url value='/replies/get/'/>"+user_id_1,
		function(data) {
			var list = data.list;
			
			var comment_html = "<div>";
			if(list.length < 1){
				comment_html += "등록된 댓글이 없습니다";
				
			}else{
			
				for(i = 0;i < list.length;i++){
					console.log(list[i]);
					var content = list[i].comment_content;
					var user_id_2 = list[i].user_id;
					let time = list[i].comment_write_time;
					
					comment_html += "<div><span id='com_writer'><strong>" + user_id_2 + "</strong></span><br/>";
					comment_html += "<span id='com-content'>" + content + "</span><br>";
					comment_html += "<span id='write_time'>" + time + "</span><br>";
					if(user_id_1 == user_id_2){
						 comment_html += "<span id='update' style='cursor:pointer;' data-id ="+content+">[수정]</span>";
						 comment_html += "<span id='delete' style='cursor:pointer;' data-id ="+content+">[삭제]</span><br></div><hr>";
					}
					else{
						comment_html += "</div><hr>";
					}
				}
			}
			
			$("#comment_list").html(comment_html);
		})};
		

</script>
</body>
</html>
