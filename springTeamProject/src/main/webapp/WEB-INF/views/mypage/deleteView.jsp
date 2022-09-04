<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title>
	</head>
<script type="text/javascript">
		$(document).ready(function(){
		
			$("#deletee").on("click", function(){
				
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#password").focus();
					return false
				}
				
				if($("#password2").val()==""){
					alert("비밀번호 확인을 입력해주세요");
					$("#password2").focus();
					return false
				}
				
				if ($("#password").val() != $("#password2").val()) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#password").focus();
					 
					return false;
					}
				
				$.ajax({
					url : "/mypage/check_password_mypage",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
								alert("회원 탈퇴 성공하였습니다.")
							}
							
						}
					}
				})
			});
		})
	</script>
	<body>
		 <form action="/mypage/delete_info_mypage" method="post" id="deleteForm" name="deleteForm">
                       <input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">회원탈퇴를 하려면 비밀번호를 입력해주세요.</p>
                <div class="form-group">
                    <input type="password" id = "password" name="password" class="form-control form-control-inline text-center" placeholder="비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" id="password2" name="password2"  class="form-control form-control-inline text-center" placeholder="비밀번호 확인" />
                </div>
                <button type="button" id="deletee" name="delete" class="btn btn-primary">회원탈퇴</button> <a href="/mypage/home" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
    </form>
		
	</body>
	
</html>