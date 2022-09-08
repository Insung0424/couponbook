<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon"><link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
	<meta charset="UTF-8">
	<title>로그인 폼 화면</title>
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body class="mt-5">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4 m-auto">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form" method='post' action="loginProc">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="Email"
										name="email" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>
								
								<!-- <div class="checkbox">
									<label> <input name="remember-me" type="checkbox">Remember Me</label>
								</div> -->
								
								<button class="btn w-100 btn-lg btn-warning " type="submit">로그인</button>
							</fieldset>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
<!-- <main class="form-signin w-50 mt-5 m-auto">
	<form action="loginProc" method="post">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
		아이디
        <div class="form-floating">
          <input name="user_id" type="text" class="form-control" id="floatingInput" placeholder="user_id" />
          <label for="floatingInput">아이디</label>
        </div>
		비밀번호
        <div class="form-floating">
          <input name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password" />
          <label for="floatingPassword">비밀번호</label>
        </div>
    
        <button class="w-100 btn btn-lg btn-warning" type="submit">로그인</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2022-08-22</p>
	</form>
</main> -->

</body>
</html>