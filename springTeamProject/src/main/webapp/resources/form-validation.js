//메일 중복 확인
function mailChk(){
	alert("메일을 확인해야 하는데..");
	window.location.href="mailChk";
}

//비밀번호 확인
function pwChk(){
	var pw1 = document.getElementById('password').value;
	var pw2 = document.getElementById('password-chk').value;
	var pwChkisTrue;
	
	if(pw1.length < 4){
		alert("비밀번호는 4자 이상이어야 합니다");
		pwChkisTrue = false;
		return false;
	}
	
	if( pw1 != pw2){
		alert("입력한 비밀번호가 같지 않습니다");
		pwChkisTrue = false;
		return false;
	} else {
		alert("비밀번호가 일치합니다");
		pwChkisTrue = true;
		return true;
	}
}

// validation 문구 출력
// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')
  
  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
    	
    	
   	  if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      
//      console.log(pwChk().pwChkisTrue);
      
      form.classList.add('was-validated')
      
    }, false)
  })
})()