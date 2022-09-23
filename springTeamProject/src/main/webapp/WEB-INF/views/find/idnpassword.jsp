<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style type="text/css">
html {
	height: 100%;
}

#findIdnNickPhone, #findPasswordnChage {
	height: 100%;
	margin: 0 auto;
	text-align: center;
	margin-top: 30%;
}

.panel-title {
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="container" style="height: 100%">

		<div id="findIdnNickPhone">
			<div class="panel-heading">
				<h3 class="panel-title">아이디 찾기</h3>
			</div>

			<div id="findNickname">
				<p>회원가입시 입력한 닉네임을 입력해주세요</p>
				<div class="form-group">
					<form action="/find/findIdNickname" method="post"
						onsubmit="return checkNickname()" id="form1">
						<input class="form-control" type="text" name="nickname"
							id="nickname" style="width: 300px; margin: 0 auto;"
							placeholder="닉네임  입력">
						<div style="margin-top: 5px;">
							<button class="btn btn-primary">확인</button>
							<input type="button" value="돌아가기" id="back"
								class="btn btn-primary" />
						</div>
					</form>
				</div>
			</div>

			<div id="findphone" style="display: none;">
				<p>회원가입시 입력한 전화번호를 입력해주세요</p>
				<form action="/find/findIdPhone" method="post"
					onsubmit="return checkPhone()" id="form2">
					<input type="text" class="form-control" id="phone"
						placeholder="전화번호 입력" style="width: 300px; margin: 0 auto;">
					<div style="margin-top: 5px;">
						<button class="btn btn-primary">확인</button>
						<input type="button" value="돌아가기" id="back"
							class="btn btn-primary" />
					</div>
				</form>
			</div>

			<div class="form-group">
				<input class="btn btn-link" id="findId" type="button" value="아이디 찾기" />
				&nbsp; <input class="btn btn-link" id="findPassword" type="button"
					value="비밀번호 찾기" /> <input class="btn btn-link" id="findIdNickname"
					type="button" value="닉네임으로 아이디 찾기" />&nbsp;<input
					class="btn btn-link" id="findIdPhone" type="button"
					value="전화번호로 아이디 찾기" />
			</div>

		</div>

		<div id="findPasswordnChage" style="display: none;">
			<div class="panel-heading">
				<h3 class="panel-title">비밀번호 찾기</h3>
			</div>
			<p>회원가입시 입력한 이메일과 닉네임을 입력해주세요</p>
			<form action="/find/checknicknamenemail" method="post"
				onsubmit="return checkPass()" id="form3">
				<input class="form-control" type="email" name="email" id="passemail"
					style="width: 300px; margin: 0 auto;" placeholder="이메일 입력"><br>
				<input class="form-control" type="text" name="nickname"
					id="passnickname" style="width: 300px; margin: 0 auto;"
					placeholder="닉네임 입력"> <br>
				<button class="btn btn-primary">확인</button>
				<input type="button" value="돌아가기" id="back2" class="btn btn-primary" />
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$("#findPassword").click(function() {
			if ($("#findPasswordnChage").css("display") == "none") {
				$("#findPasswordnChage").css("display", "block");
				$("#findIdnNickPhone").css("display", "none");
			}
		});

		$("#findId").click(function() {
			if ($("#findIdnNickPhone").css("display") == "none") {
				$("#findIdnNickPhone").css("display", "block");
				$("#findPasswordnChage").css("display", "none");
			}
		});

		$("#findIdPhone").click(function() {
			if ($("#findphone").css("display") == "none") {
				$("#findphone").css("display", "block");
				$("#findNickname").css("display", "none");
			}
		});

		$("#findIdNickname").click(function() {
			if ($("#findNickname").css("display") == "none") {
				$("#findNickname").css("display", "block");
				$("#findphone").css("display", "none");
			}
		});

		$("#back").click(function() {
			history.go(-1);
		});
		$("#back2").click(function() {
			history.go(-1);
		});

		function checkNickname() {
			if ($('#nickname').val() == '') {
				alert('닉네임을 입력해주세요');
				$('#nickname').focus();
				return false;
			}
		};

		function checkPhone() {
			if ($('#phone').val() == '') {
				alert('전화번호를 입력해주세요');
				$('#phone').focus();
				return false;
			}

			let p = $('#phone').val();
			let phone = Phone_format(p);
			console.log(phone);

			let form = $("#form2");

			let input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'phone';
			input.value = phone;
			form.append(input);

		};

		function checkPass() {
			if ($('#passemail').val() == '') {
				alert('이메일을 입력해주세요');
				$('#passemail').focus();
				return false;
			}

			if ($('#passnickname').val() == '') {
				alert('닉네임을 입력해주세요');
				$('#passnickname').focus();
				return false;
			}
		};

		function Phone_format(number) {
			return number.replace(/[^0-9]/g, "").replace(
					/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
					"$1-$2-$3").replace("--", "-");
		}
	</script>



</body>
</html>