<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>
<a href="/board/list">게시판</a><br />
<script type="text/javascript">
	function myPage(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/mypage/myInfo');
		    document.body.appendChild(f);
		    f.submit();
	}
	function myBoard(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/mypage/myBoard');
		    document.body.appendChild(f);
		    f.submit();
	}
	function myComment(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/mypage/myComment');
		    document.body.appendChild(f);
		    f.submit();
	}
	function myLike(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/mypage/myLike');
		    document.body.appendChild(f);
		    f.submit();
	}
	function myReport(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/mypage/myReport');
		    document.body.appendChild(f);
		    f.submit();
	}
	function myTrade(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/mypage/myTrade');
		    document.body.appendChild(f);
		    f.submit();
	}
	function delete_info(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'get');
		    f.setAttribute('action', '/mypage/delete_info_mypageView');
		    document.body.appendChild(f);
		    f.submit();
	}
	function myUpdate(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'get');
		    f.setAttribute('action', '/mypage/updateView');
		    document.body.appendChild(f);
		    f.submit();
	}
	function goReport(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'get');
		    f.setAttribute('action', '/mypage/goReport');
		    document.body.appendChild(f);
		    f.submit();
	}


	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="mypage/logout";
		})
			
		
	})

</script>
<body>
	<form name='homeForm' method="post" action="/mypage/login">
		<c:if test="${user == null}">
			<div>
				<label for="user_id"></label>
				<input type="text" id="user_id" name="user_id">
			</div>
			<div>
				<label for="password"></label>
				<input type="password" id="password" name="password">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${user != null }">
			<div>
				<p>${user.user_name}님 환영 합니다.</p>
			
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
<!--a href="/mypage/myInfo?user_id=${user.user_id }">myinfo</a>-->
<a href="javascript:void(0)"onClick="javascript:myUpdate()">myupdate</a>
<a href="javascript:void(0)"onClick="javascript:myPage()">myinfo</a>
<a href="javascript:void(0)"onClick="javascript:delete_info()">delete_info</a>
<a href="javascript:void(0)"onClick="javascript:myBoard()">myboard</a>
<a href="javascript:void(0)"onClick="javascript:myComment()">mycomment</a>
<a href="javascript:void(0)"onClick="javascript:myLike()">mylike</a>
<a href="javascript:void(0)"onClick="javascript:myReport()">myreport</a>
<a href="javascript:void(0)"onClick="javascript:myTrade()">mytrade</a>
<a href="javascript:void(0)"onClick="javascript:goReport()">goReport</a>


</body>
</html>
