<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
#modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

#modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px;
}

#modal_content2{
  width:600px; height:400px;
  background:#fff; border-radius:10px;
  position:relative; top:30%; left:30%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px;
}

#span{
	display: inline-block;
	margin-left: 30px;
}
</style>
</head>
<body>
	<h3>댓글</h3>
	<hr>
	<div id="comment_add">
		<table class="comment_table">
			<tr>
				<td class="title">작성자</td>
				<td class="input"><input type="text" id="writer" readonly value="${vo.user_id }"/></td>
			</tr>
			<tr>
				<td class="title">댓글내용</td>
				<td class="input"><textarea rows="3" cols="50" id="com_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
				<button type="button" id="add_btn">댓글등록</button>
				<input type="button" id="more_comment" value="댓글 보기"></td>
			</tr>
		</table>
		<div id="add_message">&nbsp;</div>
	</div>
	
	<span id="comment_list"></span>
	
	<div id='modal'>
		<div id='modal_content'>
			<table class="modal_comment_table">
				<tr>
					<td class="modal_title">댓글</td>
				</tr>
				<tr>
					<td class="modal_input"><textarea rows="3" cols="40" id="modal_com_content"></textarea></td>
				</tr>
				<tr>
					<td class="modal_btn">
					<button type="button" id="modal_modify_btn">입력</button>
					<button type="button" id="modal_modify_cancel_btn">수정취소</button></td>
				</tr>
			</table>
		</div>
	</div>
	
<script type="text/javascript">
$("#add_btn").click(function(){
	const product_id = ${vo.product_id};
	const user_id = ${vo.user_id};
	const comment_content = $("#com_content").val();
	
	if(user_id == ''){
			alert('로그인 후 이용해주세요');
			return;
	}else if(com_content == '') {
		alert('내용을 입력하세요');
	}
	
	if(comment_content == ''){
		alert('내용을 입력하세요');
		return;
	}
	
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
					console.log('댓글 등록 완료')
					$('#user_id').val(${vo.user_id});
  					$('#com_content').val('');
  					let user_id = ${vo.user_id};
  	              	if(user_id  == 1){
  	              		getAllList();
  	              	}
  	             	 else{
  	              		getList();
  	              	}
				}else{
					console.log('댓글 등록 실패');
				};
			},
			error:function(){
				alert('통신실패');
			}
		});
});


function getAllList() {
	const product_id= ${vo.product_id};
	const user_id_1= ${vo.user_id};
	console.log(product_id);
	$.getJSON("<c:url value='/replies/get/'/>"+product_id,
		function(data) {
			var list = data.list;
			
			var comment_html = "<div>";
			if(list.length < 1){
				comment_html += "등록된 댓글이 없습니다";
				
			}else{
			
				for(i = 0;i < list.length;i++){
					console.log(list[i]);
					let content = list[i].comment_content;
					let user_id_check = list[i].user_id;
					let time = list[i].comment_write_time;
					let comment_no = list[i].comment_no;
					let comment_no_level = list[i].comment_no_level;
					let group_no = list[i].group_no;
					
					if(group_no >= 2){
						comment_html += "<span style='display:inline-block; margin-left:20px;'>&nbsp;</span></div><div style='display:inline-block;>";
					}
					
					comment_html += "<span id='com_writer' value="+user_id_check+"><strong>" + user_id_check + "</strong></span><br/>";
					comment_html += "<span id='span_content'>" + content + "</span><br>";
					comment_html += "<span id='span_write_time'>" + time + "</span><br>";
					if(user_id_1 == user_id_check){
						 comment_html += "<button id='update' data-id =" + comment_no + ">수정</button>";
						 comment_html += "&nbsp;";
						 comment_html += "<button id='delete' data-id ="+ comment_no +">삭제</button><br></div><hr>";
					}
					else{
						comment_html += "<button id='answer' data-id ="+ comment_no_level +">답글</button><br></div><hr>";
					}
				}
			}
			
			$("#comment_list").html(comment_html);
		})};
		
		
function getList() {
	const product_id= ${vo.product_id};
	const user_id_1= ${vo.user_id};
	const user_id_2 = 1; //상품페이지에 등록된 유저 아이디
	$.ajax({
		type : "get",
		url:"/replies/get/comment",
        data:{
        	"product_id":product_id,
        	"user_id_1": user_id_1,
        	"user_id_2": user_id_2,
        },
        contentType: 'application/json',
        success:function(data){
            console.log('통신성공');
            var comment_html = "<div>";
            var list = data.list;
            var count = data.count;  
			if(list.length < 1){
				comment_html += "등록된 댓글이 없습니다</div>";
			}else if(count == 0){
				comment_html += "댓글을 등록해주세요</div>";
        	}else if(count == 1){
				comment_html += "아직 판매자가 댓글을 확인하지않았습니다</div>";
			}else{
			
				for(i = 0;i < list.length;i++){
					let content = list[i].comment_content;
					let user_id_check = list[i].user_id;
					let time = list[i].comment_write_time;
					let comment_no = list[i].comment_no;
					let comment_no_level = list[i].comment_no_level;
					let group_no = list[i].group_no;
					
					if(group_no >= 2){
						comment_html += "<span style='display:inline-block; margin-left:20px;'>&nbsp;</span></div><div style='display:inline-block;>";
					}
					
					comment_html += "<span id='com_writer' value="+user_id_check+"><strong>" + user_id_check + "</strong></span><br/>";
					comment_html += "<span id='span_content'>" + content + "</span><br>";
					comment_html += "<span id='span_write_time'>" + time + "</span><br>";
					if(user_id_1 == user_id_check){
						 comment_html += "<button id='update' data-id =" + comment_no + ">수정</button>";
						 comment_html += "&nbsp;";
						 comment_html += "<button id='delete' data-id ="+ comment_no +">삭제</button><br></div><hr>";
					}
					else{
						comment_html += "<button id='answer' data-id ="+ comment_no_level +">답글</button><br></div><hr>";
					}
					
				}
			}
			
			$("#comment_list").html(comment_html);
           
        },
        error:function(){
           alert('통신실패');
        }
	})};
		
$("#more_comment").click(function(){
	let user_id = ${vo.user_id};
	if(user_id  == 1){//판매자일 경우
		getAllList();
	}
	else{//구매자일경우
		getList(); 
	}
	
});

$(document).on("click", "#delete", function(){
	const comment_no = $(this).data("id");
	console.log(comment_no);
	alert('댓글을 삭제하시겠습니까?');
	console.log('댓글삭제');
           $.ajax({
               type:'delete',
               url:'<c:url value="/replies/delete/"/>'+comment_no,
               data:JSON.stringify({"comment_no":comment_no}),
               contentType: 'application/json',
               success:function(data){
                  console.log('통신성공'+data);
                  let user_id = ${vo.user_id};
	              if(user_id  == 1){
	            	  getAllList();
	              }
	              else{
	              	  getList();
	              }
               },
               error:function(){
                  alert('통신실패');
               }
            });
     
});

$(document).on("click", "#update", function(){
	const comment_no = $(this).data("id");
	$("#modal").fadeIn();
	$("#modal_modify_cancel_btn").click(function(){
		$("#modal").fadeOut();
	});
	$("#modal_modify_btn").click(function(){
		const modal_com_content = $("#modal_com_content").val();
		console.log(comment_no);
		console.log(modal_com_content);
		console.log('댓글수정');
	           $.ajax({
	               type:'put',
	               url:'<c:url value="/replies/update"/>',
	               data:JSON.stringify(
	                  {
	                	 "comment_content" : modal_com_content,
	                     "comment_no":comment_no
	                  }      
	               ),
	               contentType: 'application/json',
	               success:function(data){
	            		console.log('통신성공'+data);
	  					$('#modal_com_content').val('');
	 	                $("#modal").fadeOut();
	 	                let user_id = ${vo.user_id};
	 		            if(user_id  == 1){
	 		            	getAllList();
	 		            }
	 		            else{
	 		              	getList();
	 		            }
	            	   
	               },
	               error:function(){
	                  alert('통신실패');
	               }
	            });	
		
	});
	
});

$(document).on("click", "#answer", function(){
	$('#modal_com_content').val('');
	const comment_no_level = $(this).data("id");
	$("#modal").fadeIn();
	$("#modal_modify_cancel_btn").click(function(){
		$("#modal").fadeOut();
	});
	$("#modal_modify_btn").click(function(){
		const modal_com_content = $("#modal_com_content").val();
		const product_id = ${vo.product_id};
		const user_id = ${vo.user_id};
		
		console.log('답글');
	           $.ajax({
	               type:'post',
	               url:'<c:url value="/replies/tabComment"/>',
	               data:JSON.stringify(
	                  {
	                	 "product_id" : product_id,
	                	 "user_id" : user_id,
	                	 "comment_content" : modal_com_content,
	                     "comment_no_level": comment_no_level,
	                     "comment_no" : comment_no_level
	                  }      
	               ),
	               contentType: 'application/json',
	               success:function(data){
	            	   if(data == "insert"){
	            		console.log('통신성공'+data);
	            		$('#modal_com_content').val('');
	 	                $("#modal").fadeOut();
	 	                let user_id = ${vo.user_id};
	 		            if(user_id  == 1){
	 		            	getAllList();
	 		            }
	 		            else{
	 		              	getList();
	 		            }
	            	   }else{
	            		   console.log("실패");
	            	   }
	            	   
	               },
	               error:function(){
	                  alert('통신실패');
	               }
	            });	
		
	});
	
});
</script>
</body>
</html>
