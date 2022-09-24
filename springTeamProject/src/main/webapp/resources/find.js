/**
 * 
 */
$("#findPassword").click(function(){
		if($("#findPasswordnChage").css("display") == "none"){
			$("#findPasswordnChage").css("display","block");
			$("#findIdnNickPhone").css("display","none");
		}
	});
	$("#findId").click(function(){
		if($("#findIdnNickPhone").css("display") == "none"){
			$("#findIdnNickPhone").css("display","block");
			$("#findPasswordnChage").css("display","none");
		}
	});
	$("#findIdPhone").click(function(){
		if($("#findphone").css("display") == "none"){
			$("#findphone").css("display","block");
			$("#findNickname").css("display","none");
		}
	});
	$("#findIdNickname").click(function(){
		if($("#findNickname").css("display") == "none"){
			$("#findNickname").css("display","block");
			$("#findphone").css("display","none");
		}
	});
	$("#findemailNickname").click(function(){
		if($("#findpasswordnick").css("display") == "none"){
			$("#findpasswordnick").css("display","block");
			$("#findpasswordphone").css("display","none");
		}
	});
	$("#findemailPhone").click(function(){
		if($("#findpasswordphone").css("display") == "none"){
			$("#findpasswordphone").css("display","block");
			$("#findpasswordnick").css("display","none");
		}
	});
	$("#back1").click(function (){
		history.go(-1);
	});
	$("#back2").click(function (){
		history.go(-1);
	});
	$("#back3").click(function (){
		history.go(-1);
	});
	$("#back4").click(function (){
		history.go(-1);
	});
	function checkNickname(){
		if($('#nickname').val() == ''){
			alert('닉네임을 입력해주세요');
			$('#nickname').focus();
			return false;
		}
	};
	function checkPhone(){
		if($('#phone').val() == ''){
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
	function checkPass(){
		if($('#passemail').val() == ''){
			alert('이메일을 입력해주세요');
			$('#passemail').focus();
			return false;
		}
		
		if($('#passnickname').val() == ''){
			alert('닉네임을 입력해주세요');
			$('#passnickname').focus();
			return false;
		}
	};
	function checkPass2(){
		if($('#passemail2').val() == ''){
			alert('이메일을 입력해주세요');
			$('#passemail2').focus();
			return false;
		}
		
		if($('#passphone').val() == ''){
			alert('전화번호를 입력해주세요');
			$('#passphone').focus();
			return false;
		}
		
		let p = $('#passphone').val();
		let phone = Phone_format(p);
		
		console.log(p);
		console.log(phone);
		
		let form = $("#form4");
		
		let input = document.createElement('input');
		input.type = 'hidden';
		input.name = 'phone';
		input.value = phone;
		form.append(input);
		
	};
	function Phone_format(number){
	    return number.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");
	}