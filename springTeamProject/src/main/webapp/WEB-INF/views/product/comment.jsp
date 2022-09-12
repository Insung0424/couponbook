<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">

<style>

#modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

#modal_content{
  width: 50%; height:600px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left: -25%;
  text-align:center;
  box-sizing:border-box; padding:50px 0;
  line-height:23px;
}

#span{
	display: inline-block;
	margin-left: 30px;
}

h1 {
  position: relative;
  text-align: center;
}
h1 span {
  position: relative;
  z-index: 2;
  display: inline-block;
  margin: 0 4em;
  padding: 0 1em;
  background-color: #fff;
  text-align: left;
}
h1::before {
  position: absolute;
  top: 50%;
  z-index: 1;
  content: '';
  display: block;
  width: 100%;
  height: 1px;
  background: #ccc;
  background: -webkit-linear-gradient(-45deg, transparent, #ccc 10%, #ccc 90%, transparent);
  background: linear-gradient(-45deg, transparent, #ccc 10%, #ccc 90%, transparent);
}


h2 {
  position: relative;
  text-align: left;
}
h2 span {
  position: relative;
  z-index: 2;
  display: inline-block;
  margin: 0 4em;
  padding: 0 1em;
  background-color: #fff;
  text-align: left;
}
h2::before {
  position: absolute;
  top: 50%;
  z-index: 1;
  content: '';
  display: block;
  width: 100%;
  height: 1px;
  background: #ccc;
  background: -webkit-linear-gradient(-45deg, transparent, #ccc 10%, #ccc 90%, transparent);
  background: linear-gradient(-45deg, transparent, #ccc 10%, #ccc 90%, transparent);
}

#add_btn {
background-color: #dbdbdb;
box-shadow: 5px 5px 0px 0px rgba(0, 0, 0, 0.1);
}
#add_btn:hover {
transform: translate(5px, 10px);
}


#more_comment {
background-color: #e8e8e8;
box-shadow: 5px 5px 0px 0px rgba(0, 0, 0, 0.1);
}
#more_comment:hover {
transform: translate(5px, 10px);
}   


</style>
</head>
<body>
	<div class="modal-header">
		<div class="modal-title">
			댓글
		</div>
	</div>
	<div class="modal-body">
		<div class="mb-3">
		<div style="background: #2f6ddc; border: 1px solid #2f6ddc; padding-left: 20px;"> <span style="color: white;">
			작성자
			<input type="text" id="writer" readonly value="${mem.email}" class="form-control"/>
		</span></div>
		
	<div style="display:inline-block; border-radius:10px; background: #2f6ddc; margin-bottom: 0px; font-size: 100%; padding: 20px;">		
			<textarea class="form-control" id="editor1" name="editor1" class="com_comment" rows="4" cols="50" placeholder="내용을 입력하세요"></textarea>
			<script type="text/javascript">
			    CKEDITOR.replace( 'editor1' );
			</script></div>
		<div style="width: 0px; height: 0px; border-style: solid; border-width: 15px 15px 0 15px; border-color: #2f6ddc transparent transparent transparent; margin-left: 30px; margin-bottom: 20px;"></div>		<div></div><div></div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" id="add_btn" class="btn btn-primary" style="font-size: 1.3em;">댓글등록</button>
		<input type="button" id="more_comment" value="댓글 보기" class="btn btn-primary" style="font-size: 1.3em;">
	</div>
	
	<span id="comment_list"></span>
	
	<div id='modal'>
		<div id='modal_content'>
			<div class="modal-header">
				<div class="modal-title">
					내용
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
 					<span aria-hidden="true" style="font-size: 1em;">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
				<div  style="position: relative;  margin: 2em 0 2em 40px; background: #fdeff2; border-radius: 20px; font-size: 100%; padding: 20px;"><span  style="  position: absolute; left: -38px; width: 13px; height: 12px; bottom: 0; background: #fdeff2; border-radius: 50%; "></span>
				
				  <textarea class="form-control" id="editor2" name="editor2" class="modal_com_content" rows="5"></textarea>
					<script type="text/javascript">
					    CKEDITOR.replace( 'editor2' );
					</script>
					
					<span style=" position: absolute; left: -24px; width: 20px; height: 18px;  bottom: 3px; background: #fdeff2; border-radius: 50%;  margin: 0;  padding: 0;"></span></div>
					
					
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="modal_modify_btn" class="btn btn-primary">등록</button>
				<button type="button" id="modal_modify_cancel_btn" class="btn btn-primary">취소</button></td>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
$("#add_btn").click(function(){
	const product_id = ${onePdt.product_id };
	const user_id = ${mem.email};
	const comment_content = CKEDITOR.instances.editor1.getData();

	if(user_id == ''){
			alert('로그인 후 이용해주세요');
			return;
	}else if(comment_content == '') {
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
					$('#user_id').val(${mem.email});
					CKEDITOR.instances.editor1.setData() = '';
  					let user_id = ${mem.email};
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
						 comment_html += "<button id='update' data-id =" + comment_no + " class='btn btn-primary'>수정</button>";
						 comment_html += "&nbsp;";
						 comment_html += "<button id='delete' data-id ="+ comment_no +" class='btn btn-primary'>삭제</button><br></div><hr>";
					}
					else{
						comment_html += "<button id='answer' data-id ="+ comment_no_level +" class='btn btn-primary'>답글</button><br></div><hr>";
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
						 comment_html += "<button id='update' data-id =" + comment_no + " class='btn btn-primary'>수정</button>";
						 comment_html += "&nbsp;";
						 comment_html += "<button id='delete' data-id ="+ comment_no +" class='btn btn-primary'>삭제</button><br></div><hr>";
					}
					else{
						comment_html += "<button id='answer' data-id ="+ comment_no_level +" class='btn btn-primary'>답글</button><br></div><hr>";
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
	$(".close").click(function(){
		$("#modal").fadeOut();
	});
	
	$("#modal_modify_btn").click(function(){
		const modal_com_content = CKEDITOR.instances.editor2.getData();
		console.log('댓글수정');
		if(modal_com_content == ''){
			alert("내용을 입력해주세요");
		}
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
	  					$('.modal_com_content').val('');
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
	const comment_no_level = $(this).data("id");
	$("#modal").fadeIn();
	$("#modal_modify_cancel_btn").click(function(){
		$("#modal").fadeOut();
	});
	$(".close").click(function(){
		$("#modal").fadeOut();
	});
	$("#modal_modify_btn").click(function(){
		const modal_com_content = CKEDITOR.instances.editor2.getData();
		const product_id = ${vo.product_id};
		const user_id = ${vo.user_id};
		
		if(modal_com_content == ''){
			alert("내용을 입력해주세요");
		}
		
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
	            		$('.modal_com_content').val('');
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
