<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
	
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg" style="background-color: #ddd">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">CouponBook</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">홈</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">전체</a></li>
								<li><a class="dropdown-item" href="#">편의점</a></li>
								<li><a class="dropdown-item" href="#">커피/음료</a></li>
								<li><a class="dropdown-item" href="#">외식</a></li>
								<li><a class="dropdown-item" href="#">상품권</a></li>
								<li><a class="dropdown-item" href="#">기타</a></li>
							</ul></li>
					</ul>
					<div style="margin-right: 50px;">
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="검색어 입력" aria-label="Search" style="width: 300px;">
							<button class="btn btn-light" type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path
										d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
</svg>
							</button>
						</form>
					</div>
					<ul class="nav navbar-top-links navbar-right"
						style="padding-right: 50px;">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" data-bs-toggle="dropdown" href="#"> <svg
									xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-person-circle"
									viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
</svg></a>
							<ul class="dropdown-menu dropdown-user">
								<li><a class="dropdown-item" href="#"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-person-fill"
											viewBox="0 0 16 16">
  <path
												d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg>마이페이지</a></li>

								<li><a class="dropdown-item" href="main.jsp"><svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-box-arrow-right"
											viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
												d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg>로그아웃</a></li>
							</ul> <!-- /.dropdown-user --></li>
						<!-- /.dropdown -->
					</ul>
					<form class="r-flex" role="regist">
						<a class="btn btn-primary disabled" href="#"
							style="margin-right: 5px;">상품등록</a>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<form action="/product_add" method="post" enctype="multipart/form-data" name="form">
		<div class="container" style="margin-top: 30px;">
			<div class="row">
				<div class="col">
					<input type="text" placeholder="제목을 입력하세요" name="pd_name"
						style="width: 500px; margin-bottom: 10px;">
					<!-- file upload -->
					<input type="file" name="file">
					<div id="uploadData">
						
					</div>
					<textarea class="form-control" id="write_editor" name="write_editor" rows="5"></textarea>
					<script type="text/javascript">
					    CKEDITOR.replace( 'write_editor' );
					</script>
					
					<input type="button" id="add" class="btn btn-primary" value="submit"
						style="float: left; margin-bottom: 10px;">
						
					<button type="reset" class="btn btn-secondary"
						style="float: right; margin-bottom: 10px; margin-right: 5px;">취소</button>

					<!-- 해당 부분 ckeditor4 로 변경한 뒤 script작성 -->
				</div>
			</div>
		</div>
	</form>
	<script>
		$("#add").click(function (){
			let pd_desc = null;
			if(CKEDITOR.instances.write_editor.getData() != null){
				pd_desc = CKEDITOR.instances.write_editor.getData();
			}
			else{
				pd_desc = "";
			}
			
			let pd_name = form.pd_name.value;
			if(pd_name == null){
				pd_name = "";
			}
			
			let img = form.img;
			if(img == null){
				img = "";
			}else{
				img = form.img.value;
			}
			
			let simg = form.simg;
			if(simg == null){
				simg = "";
			}else{
				simg = form.simg.value;
			}
			
			let pd_img = null;
			if(img == "" && simg == ""){
				pd_img = "";
			}
			else{
				pd_img = img + ',' + simg;
			}
			
			$.ajax({
				type : "post",
				url : '<c:url value="/product_add"/>',
				data : JSON.stringify(
						{
							"pd_desc":pd_desc,
							"pd_name":pd_name,
							"pd_img":pd_img,
							"location_id": 1,
							"company_name": "com3",
							"category_id": 2,
							"pd_price" : "2500",
							"pd_discount" : 11
						}		
					),
				contentType: 'application/json',
				success : function(result){
					window.location.href = "main2"; // session 값 유지되는지 모르겠음
				},
				error : function(result){
					console.log(result);
					alert("error");
				}
			})
		});

		$("input[type='file']").on("change", function(e) {
			
			if($("#imgDeleteBtn").length > 0){
				alert("x 버튼을 눌러 기존이미지를 지워주세요");
				return;
			}
			
			let fileInput = $('input[name="file"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			let formData = new FormData();
			
			if (!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}
			
			formData.append("file", fileObj);

			$.ajax({
				url : '/upload',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(data) {
					console.log(data);
					showImg(data);
				},
				error : function(data) {
					alert("이미지 파일을 올려주세요");
				}
			});

		});

		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 10485760; //10MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}
		
		function showImg(image){
			if(!image || image.length == 0){
				return
			}
			let uploadData = $("#uploadData"); // 이미지 들어갈 위치
			let img = image.img;
			let simg = image.simg; // 썸네일 이미지 불러오기
			let str = "";
			console.log(img);
			
			let encodingImg = encodeURIComponent(img);
			let encodingsImg = encodeURIComponent(simg);
			
			str += "<div id='result_card'>";
			str += "<img src='/getImg?fileNameNPath=" + encodingImg +"'>";
			str += "<div id='imgDeleteBtn' data-file = '" + encodingImg + "'>x</div>";
			str += "<input type='hidden' name='img' value='" + encodingImg + "'>";
			str += "<input type='hidden' name='simg' value='" + encodingsImg + "'>";
			str += "</div>";
			// 에러 발생시 console 확인 -> .replace(/\\/g, '/') 로 해결가능한 문제일경우 uploaddata 에 추가
			// 한글인코딩 문제 일경우 ->  encodeURIComponent(uploadData);
			uploadData.append(str);    
		}
		
		function deleteImg(){
			let file = $("#imgDeleteBtn").data("file");
			let deletediv = $("#result_card");
			
			$.ajax({
				url: '/deleteImg',
				data : {fileNameNPath : file},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					deletediv.remove();
					$("input[type='file']").val("");
				},
				error : function(result){
					console.log(result);
					alert("파일 삭제 실패");
				}
	       });
		}
		
		$("#uploadData").on("click", "#imgDeleteBtn", function(e){
			deleteImg();
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>