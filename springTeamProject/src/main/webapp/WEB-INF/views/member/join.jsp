<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 폼</title>
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
    <!-- Custom styles for this template -->
    <link href="/../resources/form-validation.css" rel="stylesheet">
    <style type="text/css">
    	.email_ok{
			color:#008000;
			display: none;
		}
		
		.email_already{
			color:#6A82FB; 
			display: none;
		}
    </style>
</head>

<body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>회원가입</h2>
      <p class="lead">이메일과 닉네임은 필수입니다</p>
    </div>

    <div class="row g-5">
      <div class="col-md-7 col-lg-8 m-auto">
        <h4 class="mb-3">회원 정보</h4>
        <!-- novalidate: 폼화면의 유효성 검사를 하지 않음을 명시한다 -->
        <form class="needs-validation" role="form" 
        	method='post' action="joinProc" novalidate
        	onsubmit="return pwChk();">
          <div class="row g-3">
			
			
            <div class="col-8 mb-3">
              <label for="email" class="form-label">이메일 </label>
              <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
              <div class="invalid-feedback">
				로그인에 사용할 이메일을 입력하세요.
              </div>
	            <!-- id ajax 중복체크 -->
				<span class="email_ok">사용 가능한 메일입니다.</span>
				<span class="email_already">이미 사용 중인 메일입니다</span>
            </div>
            
            <!-- disabled -->
            <div class="col-3 pt-3 mb-3">
              <input type="button" class="btn btn-outline-warning mt-3" onclick="mailChk()" value="메일중복확인"  >
            </div>
            
            <script type="text/javascript">
            	function mailChk() {
					var email = $('#email').val();
            		$.ajax({
            			url:"./mailChk",
            			type:"post",
            			dataType:"json",
            			data : {email : email},
            		      success : function(data){
            		        if(data == 0){
            		        	$('.email_ok').css("display","inline-block"); 
                                $('.email_already').css("display", "none");
            		            alert("사용가능한 메일입니다.");
            		        }else {
            		        	$('.email_already').css("display","inline-block");
                                $('.email_ok').css("display", "none");
            		          alert("중복된 메일입니다.");
            		          $('email').val('');
            		        }
            		      },
           	            error:function(){
           	                alert("에러입니다");
           	            }
            		});
	            	/* var mailAddr = document.getElementById("email").value;
            		alert("입력받은 메일 주소" + mailAddr); */
				};
            </script>
            
            
            
            
          
            <div class="col-12 mb-3">
              <label for="nickname" class="form-label">닉네임</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" name="nickname" id="nickname" placeholder="nickname" required>
	              <div class="invalid-feedback">
					닉네임을 입력하세요
	              </div>
              </div>
            </div>
          
            <!-- 비밀번호 같은지 확인하고 싶은데.. -->
            <div class="col-sm  mb-3">
              <label for="password" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="password" id="password" placeholder="" value="" required>
              <div class="invalid-feedback">
				비밀번호를 입력하세요
              </div>
            </div>

            <div class="col-sm">
              <label for="password-chk" class="form-label">비밀번호 확인</label>
              <input type="password" class="form-control" name="chkPwd" id="password-chk" placeholder="" value="" required>
              <div class="invalid-feedback">
				입력한 비밀번호와 같지 않습니다
              </div>
            </div>

            <div class="col-12 mb-3">
              <label for="user_name" class="form-label">이름 <span class="text-muted">(Optional)</span></label>
              <input type="text" class="form-control" name="user_name" id="user_name" placeholder="">
            </div>

            <div class="col-12 mb-3">
              <label for="phone" class="form-label">전화번호 <span class="text-muted">(Optional)</span></label>
              <input type="tel" class="form-control" name="phone" id="phone" placeholder="010-1234-5678">
            </div>
            
            <!-- 카카오 우편번호 api -->
            <div class="col-6  mb-3">
              <label for="sample6_postcode" class="form-label">주소 <span class="text-muted">(Optional)</span></label>
			  <input type="text" class="form-control" name="zip_no" id="sample6_postcode" placeholder="우편번호" readonly>
            </div>
            <div class="col-6 mt-4 pt-2">
				<input type="button" class="btn btn-outline-warning" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
            </div>
            <div class="col-12 ">
				<input type="text" class="form-control" name="addr" id="sample6_address" readonly  placeholder="주소"><br>
            </div>
            <div class="col-6  mb-3">
				<input type="text" class="form-control" name="addr2" id="sample6_detailAddress" placeholder="상세주소">
            </div>
            <div class="col-6  mb-3">
				<input type="text" class="form-control" id="sample6_extraAddress" readonly placeholder="구 주소">
            </div>
			
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("sample6_address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("sample6_detailAddress").focus();
			            }
			        }).open();
			    }
			</script>
            <!-- 카카오 우편번호 api 끝 -->

          </div>

			<hr class="my-4">

          <button class="w-100 btn btn-warning btn-lg" type="submit">회원등록</button>
        </form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022-08-23 Company BM</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>


	<script src="/../resources/form-validation.js"></script>
</body>
</html>