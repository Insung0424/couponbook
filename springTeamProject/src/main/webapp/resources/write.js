/**
 * 
 */
function nanugi() {
         let price = $('input[name=pd_price]').val();
         let price0 = $('input[name=pd_price0]').val();
         let price1 = $('input[name=pd_discount]').val();
         console.log(price);
         console.log(price0);
         
         price1 = Math.round(eval(100-((price/price0)*100)));
         console.log(price1);
         
         $('input[name=pd_discount]').attr('value',price1);
      }

      function su() {
         let pd_desc = CKEDITOR.instances.write_editor.getData();
         let pd_name = $('input[name=pd_name]').val();
         if(pd_name == ''){
            alert('제목을 입력해주세요');
            return false;
         }
         if(pd_desc == ''){
            alert('설명을 입력해주세요');
            return false;
         }
         
         let file = $('input[name=file]').val();
         if(file == ''){
            alert('사진을 등록해주세요');
            return false;
         }
         let img = $('input[name=img]').val();
         let simg = $('input[name=simg]').val();
         let pd_img = img + ',' + simg;
         $("#pd_desc").val(pd_desc);
         $("#pd_img").val(pd_img);
         
         let category_id = $('select[name=category_id]').val();
         console.log(category_id);
         if(category_id == ''){
            alert('쿠폰종류를 선택해주세요');
            return false;
         }
         
         let pd_price = $('input[name=pd_price]').val();
         if(pd_price == ''){
            alert('쿠폰의 판매가격을 입력해주세요');
            return false;
         }
         
         let pd_price0 = $('input[name=pd_price0]').val();
         if(pd_price0 == ''){
            alert('쿠폰의 정가를 입력해주세요');
            return false;
         }
         
         let pd_discount = $('input[name=pd_discount]').val();
         if(pd_discount == ''){
            alert('할인율을 입력해주세요');
            return false;
         }
         
         let company_name = $('input[name=company_name]').val();
         if(company_name == ''){
            alert('사용처를 입력해주세요');
            return false;
         }
         
         let location_id = $('select[name=location_id]').val();
         if(location_id == ''){
            alert('온라인/오프라인 쿠폰 중 하나를 선택해주세요');
            return false;
         }
         
         let pd_date = $('input[name=pd_date]').val();
         if(pd_date == ''){
            alert('사용기한을  선택해주세요');
            return false;
         }
         
         return true;
         
      };
   

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
               showImg(data);
            },
            error : function(data) {
               alert("이미지 파일을 올려주세요");
            }
         });

      });

      let regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|bmp|JPG|JPEG|PNG|GIF|BMP)$");
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