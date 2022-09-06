<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원정보수정</title>
</head>
<script type="text/javascript">	
	$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}
				if($("#nickname").val().length < 2 || $("#nickname").val().length > 10 ){
					alert("닉네임은 2~10자 사이로 입력하세요.");
					$("#nickname").focus();
					return false;
				}
				if($("#user_name").val()==""){
					alert("이름을 입력해주세요");
					$("#user_name").focus();
					return false;
				}
				if($("#user_name").val().length <2 || $("#user_name").val().length > 25 ){
					alert("이름은 2글자 이상~25자 이하로 입력하세요.");
					$("#user_name").focus();
					return false;
				}
				if($("#phone").val()==""){
					alert("연락처를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
				if($("#zip_no").val()==""){
					alert("우편번호를 입력해주세요.");
					$("#zip_no").focus();
					return false;
				}
				if($("#zip_no").val().length>10){
					alert("우편번호는 10글자를 초과할 수 없습니다.");
					$("#zip_no").focus();
					return false;
				}
				if($("#addr").val()==""){
					alert("주소를 입력해주세요.");
					$("#addr").focus();
					return false;
				}
				if($("#addr2").val()==""){
					alert("상세주소를 입력해주세요.");
					$("#addr2").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("새 비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if ($("#password").val()==${user.password}) {
					alert("현재 비밀번호와 다른 비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if ($("#password").val().search(/\s/)!=-1) {
					alert("비밀번호는 띄어쓰기 없이 입력해주세요.");
					return false;
				}
				if ($("#password").val().length<4 ||$("#password").val().length>25 ) {
					alert("비밀번호는 4글자 이상~25글자 이하로 입력해주세요.");
					return false;
				}
				if($("#password2").val()==""){
					alert("새 비밀번호 확인을 입력해주세요.");
					$("#password2").focus();
					return false
				}
				if ($("#password").val() != $("#password2").val()) {
					alert("새 비밀번호 확인이 일치하지 않습니다.");
					$("#password").focus();				 
					return false;
					}
			});
		})
		
	</script>

<body>
	<section id="container">
		<form action="/mypage/update" method="post" id="Form">
		 	<input type="hidden" id="user_id" name="user_id" value="${user.user_id}">
			<div class="form-group has-feedback">
				<label class="control-label" for="email">이메일</label>
				<!-- 로그인했을시 세션끌어오기-->
				<input class="form-control" type="email" id="email" name="email"
					value="${user.email}" readonly="readonly"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="nickname">닉네임</label>
				<!-- 로그인했을시 세션끌어오기-->
				<input class="form-control" type="text" id="nickname"
					name="nickname" value="${user.nickname}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">새 비밀번호</label> <input
					class="form-control" type="password" id="password" name="password"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">새 비밀번호 확인</label> <input
					class="form-control" type="password" id="password2" name="password2"/>
			</div>
			
			<div class="form-group has-feedback">
				<label class="control-label" for="user_name">이름</label>
				<!-- 로그인했을시 세션끌어오기-->
				<input class="form-control" type="text" id="user_name"
					name="user_name" value="${user.user_name}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="phone">연락처</label>
				<!-- 로그인했을시 세션끌어오기-->
				<input class="form-control" type="text" id="phone" name="phone"
					value="${user.phone}" />
			</div>
			
			<div class="form-group has-feedback">
				<label class="control-label" for="addr">우편번호</label>
				<!-- 로그인했을시 세션끌어오기-->
				<input class="form-control" type="text" id="zip_no" name="zip_no"
					value="${user.zip_no}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="addr">주소</label>
				<!-- 로그인했을시 세션끌어오기-->
				<input class="form-control" type="text" id="addr" name="addr"
					value="${user.addr}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="addr2">상세주소</label>
				<!-- 로그인했을시 세션끌어오기-->
				<input class="form-control" type="text" id="addr2" name="addr2"
					value="${user.addr2}" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
				<a href="/" class="btn btn-default">취소</a>
			</div>
		</form>
	</section>

</body>

</html>