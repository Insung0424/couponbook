<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:forEach items="${detail }" var="detail">
   <!DOCTYPE html>

   <html lang="ko">
<head>
<link rel="shortcut icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/favicon.ico" />' type="image/x-icon">

<meta name="google-site-verification" content="W2SP-3NSepUh9GRqINVyqPzBUn54Jb_MQaqgDfllql4" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>

<!--폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link
   href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/home.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/slide.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/map.css">

<!-- 댓글,신고,거래완료,ckeditor를 위한 css,js -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/report.css">
<!-- 신고기능모달창을 위한 css 삭제하면 모달창이 아니라 페이지에 추가되는 방식으로 작동함 현재 경로를 잡지 못하고 있음 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
body {
   font-family: 'Nanum Gothic', sans-serif;
}

#com_writer {
   text-align: left;
   font-weight: bolder;
}

#comment_box2 {
   width: 100%;
   padding-left: 50px;
}

#mini_title {
   font-weight: 700;
   font-size: 20px;
   font-family: "나눔고딕", NanumGothic, "Nanum Gothic", Dotum,
      Apple SD Gothic Neo, sans-serif;
   letter-spacing: -.12px;
   color: #16181a;
   -webkit-box-align: center;
   -webkit-align-items: center;
   -ms-flex-align: center;
   align-items: center;
}

#mini_content {
   font-size: 17px;
   line-height: 26px;
   letter-spacing: -.19px;
   color: #16181a;
   vertical-align: middle;
   letter-spacing: -.27px;
}

#price {
   font-family: Tahoma, "Apple SD Gothic Neo", "Apple SD Gothic NEO",
      "Nanum Gothic", Dotum, sans-serif;
}
</style>
</head>

<body style="background-color: #f2f2f2">
<script async src="https://cse.google.com/cse.js?cx=80cd685c6894246e8">
</script>
   <!-- Page Wrapper -->

   <!-- Page Wrapper -->
   <div id="wrapper">

      <!-- Sidebar -->
      <%@include file="/WEB-INF/views/includes/main_sidebar.jsp"%>

      <!-- Sidebar end -->

      <!-- Main Content -->
      <div id="content"
         style="width: 100%; min-height: 100%; position: relative; margin: 0;">

         <%@include file="/WEB-INF/views/includes/main_header.jsp"%>

         <div class="container text-center"
            style="margin-top: 30px; margin-bottom: 30px; background-color: white; border-radius: 10px; padding: 30px;">


            <div class=content
               style="margin-top: 30px; margin-bottom: 30px; width: 90%; background-color: white; margin: 0 auto;">


               <div class=row style="margin-bottom: 50px;">
                  <div class="col" style="">

                     <c:set var="img" value="${fn:split(detail.pd_img, ',')[0]}"></c:set>
					<c:set var="simg2" value="${fn:replace(img, '%2F', '/')}"></c:set>
                     <div
                        style="width: 300px; height: 300px; background-color: gray; display: flex; justify-content: center;">
                        <img style="width: 100%; height: 100%;"
                           src="/getImg?fileNameNPath=${simg2}" alt="Not Found Image">
                           
                           
                     </div>

                  </div>
                  <div class=col>
                     <h3
                        style="margin: 8px 0 12px; font-size: 30px; letter-spacing: -.25px; line-height: 38px; color: #16181a; font-family: 'Nanum Gothic', sans-serif;">
                        <c:out value="${detail.pd_name }" />
                     </h3>


                     <hr style="border-top: 2px solid #bbb;">

                     <h3 style="text-align: left; font-size: 15px; margin: 3px;">
                        유효기간 :
                        <fmt:parseDate var="dateValue" pattern="yyyy-MM-dd"
                           value="${detail.pd_date}" />
                        <fmt:formatDate value="${dateValue }" pattern="yyyy-MM-dd"
                           var="date" />
                        <c:out value="${date}" />
                     </h3>

                     <div class="row">
                        <h5 id="price"
                           style="text-align: left; vertical-align: middle; font-size: 32px; letter-spacing: -.27px; color: #16181a;">
                           <c:out value="${detail.pd_price }" />
                           <span> 원</span><span
                              style="margin-left: 20px; font-size: 20px; color: red;">할인율
                              : <c:out value="${detail.pd_discount }" /> %
                           </span>

                        </h5>
                     </div>
                     <hr style="border-top: 2px solid #bbb;">

                     <h3 id="mini_title" style="text-align: left;">
                        카테고리 :<span id="mini_content"> <c:set var="category_id"
                              value="${detail.category_id  }" /> <c:if
                              test="${category_id eq 1}">
                        편의점
                        </c:if> <c:if test="${category_id eq 2}">
                        커피/음료
                        </c:if> <c:if test="${category_id eq 3}">
                        외식
                        </c:if> <c:if test="${category_id eq 4}">
                        상품권
                        </c:if> <c:if test="${category_id eq 5}">
                        기타
                           </c:if></span>
                     </h3>
                     <h3 id="mini_title" style="text-align: left;">
                        사용처 : <span id="mini_content"> <c:out
                              value="${detail.company_name }" />
                        </span>
                     </h3>
                     <div class="row" id = "row1">
                        <div class="col" style="padding: 0;">
                           <c:set var="user_id" value="${mem.user_id }" />
                           <c:if test="${not empty user_id}">
                           <form method = "get" id = "frm">
                              <input type="hidden" id="product_id" name="product_id"
                                 value="${detail.product_id }">
                              <input type="hidden" id="user_id" name="user_id"
                                 value="${mem.user_id }">
                              <input type="hidden" id="pd_name" name="pd_name"
                                 value="${detail.pd_name }">
                              <input type="button" value="🤍" id="like"
                                 style = "background-color: white; border: 1px solid black; float: left; margin-left: 15px; border-radius: 5px;">
                                 </form>
                           </c:if>
                        </div>
                        <div class="col">
                           <c:set var="writer_user_id" value="${detail.user_id }" />
                           <c:if test="${mem.user_id ==writer_user_id}">
                              <form method="get">
                                 <input type="hidden" id="product_id" name="product_id"
                                    value="${param.product_id }">
                                 <p style='width: 80px; float: right;'>
                                    <input type="submit" class="btn btn-info" value="글 수정하기"
                                       formaction="/modifyPostView">
                                 </p>

                              </form>

                           </c:if>
                           <c:set var="writer_user_id" value="${detail.user_id }" />
                           <c:if test="${mem.user_id == writer_user_id}">
                              <form method="post" action="/deleteBoard" id="boardInfo"
                                 name="boardInfo">
                                 <input type="hidden" id="product_id" name="product_id"
                                    value="${param.product_id }"> <input type="hidden"
                                    id="board_no" name="board_no" value="${detail.board_no }">
                                 <button type="button" class="btn btn-secondary"
                                    data-toggle="modal" data-target="#exampleModal">삭제</button>
                              </form>
                           </c:if>
                        </div>
                     </div>
                  </div>
                  <div class="modal fade" id="exampleModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                              </button>
                           </div>
                           <div class="modal-body">게시물을 정말 삭제하시겠습니까?</div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-primary"
                                 onclick="deleteBoard();document.getElementById('boardInfo').submit();">삭제하기</button>
                              <button type="button" class="btn btn-secondary"
                                 data-dismiss="modal">취소하기</button>
                           </div>
                        </div>
                     </div>
                  </div>
                  <hr style="border: solid 1px black;">
                  <div>
                     <div style="display: none;">
                        <textarea class="form-control" id="read_editor"
                           name="read_editor" rows="5" readonly="readonly"></textarea>
                        <script type="text/javascript">
               CKEDITOR.replace('read_editor');
            </script>
                     </div>
                  </div>
                  <div class="map_wrap">
                     <div id="map"
                        style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

                     <div id="menu_wrap" class="bg_white">
                        <div class="option">
                           <div>
                              <form onsubmit="searchPlaces(); return false;">
                                 키워드 : <input type="text" value="${detail.company_name }"
                                    id="keyword" size="15">
                                 <button type="submit">검색하기</button>
                              </form>
                           </div>
                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                     </div>
                  </div>
                  <hr style="border: solid 1px black; margin-top: 10px;">

                  <div class=content
                     style="word-break: break-all; margin-top: 50px; margin-bottom: 30px; height: 500px; width: 100%; background-color: white; margin: 0 auto; font-size: 2em; text-align: left;">
                     ${detail.pd_desc }</div>




               </div>
               <div class="container text-center"
                  style="margin-top: 30px; margin-bottom: 30px; background-color: white; border-radius: 10px; padding: 30px;">




                  <%@include file="comment.jsp"%>
               </div>
            </div>

            <a class="scroll-to-top rounded" id="top_btn" href="#page-top">
               <i class="fas fa-angle-up"></i>
            </a>


            <!-- 거래완료 -->
            <!-- <input type="button" id="modal_TradingEnd" class="btn btn-primary"
            style="display: block;" value="거래완료하기" />
         <button id="modal_btn_report" class="btn btn-primary">신고</button> -->



            <!-- 신고 기능 모달 창 -->

            <div id="modal_report">
               <div id="modal_report_content">
                  <div class="modal-header">
                     <div class="modal-title">불량사용자신고</div>
                  </div>
                  <div class="modal-body">
                     <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">신고종류</label>
                        <select id="re_title" class="form-select form-select-sm">
                           <option value="">유형선택</option>
                           <option value="1">허위매물</option>
                           <option value="2">삼자거래사기</option>
                           <option value="3">또 추가할 항목</option>
                        </select>
                     </div>
                     <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">상세내용</label>
                        <textarea class="form-control" id="editor4" name="editor4"
                           rows="5"></textarea>
                        <script type="text/javascript">
                   CKEDITOR.replace( 'editor4' );
               </script>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button id="report_submit" class="btn btn-primary">확인</button>
                     <button id="report_cancel" class="btn btn-primary">취소</button>

                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Modal -->

      <input type="hidden" id="user_id" name="user_id"
         value="${detail.user_id}"> <input type="hidden" id="mem_id"
         name="mem_id" value="${mem.user_id }">





      <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b5d92b8ee871200a69f42873e88b086&libraries=services"></script>

      <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
      <script>
      $(document).ready(function() {
         
         $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
               $('#top_btn').fadeIn();
            } else {
               $('#top_btn').fadeOut();
            }
         });
         
         $('#top_btn').click(function() {
            $('html, body').animate({
               scrollTop : 0
            }, 400);
            return false;
         });
         
         if(${detail.pd_status} == 2){
            alert("판매자가 이미 판매완료한 상품입니다");
         }
         
         checkLike();
         
      });
      
      function checkLike(){
        	 let product_id = $("#product_id").val();
             let user_id = ${mem.user_id};
             let pd_name = $("#pd_name").val();
             
             $.ajax({
                type:'get',
                url : '/product/getMyLike',
                data : {
                       "product_id" : product_id,
                       "user_id" : user_id
                },
                contentType : 'application/json',
                success : function(data){
                   
                  var like = data.like;
                   
                  if(like == "nolike"){
                	  frm.like.value = "🤍";
                  }else{
                	  frm.like.value = "❤️";
                  }
         		} //success
             }) //ajax
      };
             
      $("#like").click(function (){
            let product_id = $("#product_id").val();
            let user_id = ${mem.user_id};
            let pd_name = $("#pd_name").val();
            
            $.ajax({
               type:'get',
               url : '/product/getMyLike',
               async : false,
               data : {
                      "product_id" : product_id,
                      "user_id" : user_id
               },
               contentType : 'application/json',
               success : function(data){
                  
                  var like = data.like;
                  
                 if(like == "nolike"){
                     
                    $.ajax({
                        type:'post',
                       url : '/category/detail/insertL.do',
                       async : false,
                       data : {
                              "product_id" : product_id,
                              "user_id" : user_id,
                              "pd_name" : pd_name
                       },
                       success : function(data){
                    	   
                       },
                       error : function(){
                          alert("등록error");
                       }
                       
                    });  
                    frm.like.value = "❤️";
                     alert("찜목록등록완료");
                    
                  }
                  else{
                     
                     $.ajax({
                           type:'post',
                          url : '/category/detail/deleteL.do',
                          async : false,
                          data : {
                                 "product_id" : product_id,
                                 "user_id" : user_id,
                                 "pd_name" : pd_name
                          },
                          success : function(data){
                          },
                          error : function(){
                             alert("삭제error");
                          }
                          
                       }); 
                     frm.like.value = "🤍";
                     alert("찜목록해제");
                  }
               },
               
               error : function(status){
                  console.log(status);
                  alert("확인error");
               }
               
            });
            
            
         });
      
      $("#modal_btn_report").click(function(){
         $("#modal_report").fadeIn();
      });
      $("#report_cancel").click(function(){
         $("#modal_report").fadeOut();
      });

      $("#modal_TradingEnd").click(function(){
         //버튼 숨기기,보이기
         $("#modal_TradingEnd").toggle(); 
         // 거래 완료 유형선택자 페이지 제공   
         //$("#modal_trade_content").load("buyerTradeEnd");
         // 한번 로드 후 취소누르면 hide로 내용을 숨김처리하므로 show로 보여줌
         
         let product_id = $("#product_id").val();
         let sell_user_id = $("#user_id").val();
         let buyer_user_id = $("#mem_id").val();
         const user_id = ${mem.user_id};
         const seller = ${detail.user_id};
         
         if(seller == user_id){
            $.ajax({
               type:'get',
               url : '/product/get/getMySellPdstatus',
               data : {
                      "product_id" : product_id,
                      "sell_user_id" : seller
               },
               aysc : false,
               contentType : 'application/json',
               success : function(data){
                  var log = data.pd_status;
                  if(log == "notradelog"){
                     if($("#modal_trade_content").load("sellerTradeEnd")){
                        $("#modal_trade_content").show("sellerTradeEnd")
                        
                     }
                     $("#modal_trade_content").load("sellerTradeEnd");
                  }else if(log == 1){
                     if($("#modal_trade_content").load("sellerTradeEnd")){
                        $("#modal_trade_content").show("sellerTradeEnd")
                     }
                     $("#modal_trade_content").load("sellerTradeEnd");
                  }
                  else if(log == 2){
                     alert("이미 거래완료한 상품입니다");
                  }else{
                     alert("사기거래로 신고된 상품입니다");
                  }
               },
               error : function(){
                  alert("네트워크에 오류가 발생했습니다");
               }
            });
         }
         else{
            $.ajax({
               type:'get',
               url : '/product/get/getMyBuyPdstatus',
               data : {
                      "product_id" : product_id,
                      "sell_user_id" : seller,
                      "buyer_user_id" : user_id
               },
               aysc : false,
               contentType : 'application/json',
               success : function(data){
                  var log = data.pd_status;
                  if(log == "notradelog"){
                     if($("#modal_trade_content").load("buyerTradeEnd")){
                        $("#modal_trade_content").show("buyerTradeEnd");
                     }
                     $("#modal_trade_content").load("sellerTradeEnd");
                  }else if(log == 1){
                     if($("#modal_trade_content").load("buyerTradeEnd")){
                        $("#modal_trade_content").show("buyerTradeEnd");
                     }
                     $("#modal_trade_content").load("sellerTradeEnd");
                  }
                  else if(log == 2){
                     alert("이미 거래완료한 상품입니다");
                  }else{
                     alert("사기거래로 신고된 상품입니다");
                  }
               },
               error : function(){
                  alert("네트워크에 오류가 발생했습니다");
               }
            });
         }
      });

      $("#add_btn").click(function(){
         
         const product_id = ${detail.product_id };
         const user_id = ${mem.user_id};
         const comment_content = CKEDITOR.instances.editor1.getData();
         const seller = ${detail.user_id};
         if(comment_content == ''){
            alert('내용을 입력하세요');
            return;
         }
         
         $.ajax({
            type:'post',
            url : '/replies/new',
            data : JSON.stringify({
               "product_id" : product_id,
               "user_id" : user_id,
               "comment_content" : comment_content
            }),
            contentType : 'application/json',
            success : function(data){
               if(data == "InsertSuccess"){
                  if(user_id  == seller){
                            getAllList();
                            CKEDITOR.instances.editor1.setData("");                      
                         }
                         else{
                            getList();
                            CKEDITOR.instances.editor1.setData("");    
                         }
               }
            },
            error : function(){
               alert("nope");
            }
         });
         
         
      });
      
      function getAllList() {
         const product_id= ${detail.product_id};
         const user_id_1= ${detail.user_id};
         
         $.getJSON("/replies/get?product_id="+ product_id,
            function(data) {
               var list = data.list;
               
               var comment_html = "<div>";
               if(list.length < 1){
                  comment_html += "등록된 댓글이 없습니다</div>";
                  alert("등록된 댓글이 없습니다");
               }else{
               
                  for(i = 0;i < list.length;i++){
                     console.log(list[i]);
                     let content = list[i].comment_content;
                     let user_id_check = list[i].user_id;
                     let nickname = list[i].nickname;
                     let time = list[i].comment_write_time;
                     let comment_no = list[i].comment_no;
                     let comment_no_level = list[i].comment_no_level;
                     let group_no = list[i].group_no;
                     
                     
                     if(group_no >= 2){
                        comment_html += "</div><div id='comment_box2' style='display:inline-block;'>";
                     }
                     
                     comment_html += "<span id='com_writer' value="+nickname+">" + nickname + "</span><br/>";
                     comment_html += "<div style='border: #ffb6c1 solid 1px; border-left: #ffb6c1 solid 10px; padding: 20px; background: #fff; font-size: 100%;'><span id='span_content'>" + content + "</span></div><br>";
                     comment_html += "<div style=' display: flex;'> <span id='span_write_time' style='margin:5px;'>" + time + "</span><br>";
                     
                     
                     
                     if(user_id_1 == user_id_check){
                         comment_html += "<button id='update' data-id =" + comment_no + " class='btn btn-primary'>수정</button>";
                         comment_html += "&nbsp;";
                         comment_html += "<button id='delete' data-id ="+ comment_no +" class='btn btn-primary'>삭제</button><br></div><hr>";
                     }
                     else{
                        comment_html += "<button id='answer' data-id ="+ comment_no_level +" class='btn btn-primary'>답글</button> </div><br></div><hr>";
                     }
                  }
               }
               
               $("#comment_list").html(comment_html);
            })};
            
            
      function getList() {
         const product_id= ${detail.product_id};
         const user_id_1= ${mem.user_id};
         const user_id_2 = ${detail.user_id}; //상품페이지에 등록된 유저 아이디
         
         
         $.ajax({
            type : "get",
            url:"/replies/get/comment",
              data:{
                 "product_id":product_id,
                 "user_id_1": user_id_1,
                 "user_id_2": user_id_2,
              },
              contentType: 'application/json',
              success:function(data){
                  var comment_html = "<div id='comment_box'>";
                  var li = data.list;
                  var count = data.count;  
               if(count == -1){
                  comment_html += "댓글을 등록해주세요</div>";
                  alert("등록된 댓글이 없습니다. 댓글을 등록해주세요");
               }else if(count == 0){
                  comment_html += "아직 판매자가 댓글을 확인하지않았습니다</div>";
                  alert("아직 판매자가 댓글을 확인하지않았습니다");
                 }else{
                	 console.log(li);
                	 
                	 for(j = 0;j<li.length; j++){
                		 
                		 var list = li[j];
                		 
                		 console.log(list);
                		 
	                  for(i = 0;i < list.length;i++){
	                     let content = list[i].comment_content;
	                     let user_id_check = list[i].user_id;
	                     let time = list[i].comment_write_time;
	                     let comment_no = list[i].comment_no;
	                     let comment_no_level = list[i].comment_no_level;
	                     let group_no = list[i].group_no;
	                     let nickname = list[i].nickname;
	                     
	                     if(group_no >= 2){
	                        comment_html += "</div><div id='comment_box2' style='display:inline-block;'>";
	                     }
	                     
	                     comment_html += "<span id='com_writer' value="+nickname+">" + nickname + "</span><br/>";
	                     comment_html += "<div style='border: #ffb6c1 solid 1px; border-left: #ffb6c1 solid 10px; padding: 20px; background: #fff; font-size: 100%;'><span id='span_content'>" + content + "</span></div><br>";
	                     comment_html += "<div style=' display: flex;'> <span id='span_write_time' style='margin:5px;'>" + time + "</span><br>";
	                     
	                     
	                     
	                     if(user_id_1 == user_id_check){
	                         comment_html += "<button id='update' data-id =" + comment_no + " class='btn btn-primary'>수정</button>";
	                         comment_html += "&nbsp;";
	                         comment_html += "<button id='delete' data-id ="+ comment_no +" class='btn btn-primary'>삭제</button><br></div><hr>";
	                     }
	                     else{
	                        comment_html += "<button id='answer' data-id ="+ comment_no_level +" class='btn btn-primary'>답글</button> </div><br></div><hr>";
	                     }
	                     
	                  }
	                  
                	}
               }
               
               $("#comment_list").html(comment_html);
                 
              },
              error:function(){
                 alert('통신실패');
              }
         })};
            
      $("#more_comment").click(function(){
         let user_id = ${mem.user_id};
         let seller = ${detail.user_id};
         
         if(user_id  == seller){//판매자일 경우
            getAllList();
         }
         else{//구매자일경우
            getList(); 
         }
      });

      $(document).on("click", "#delete", function(){
         const comment_no = $(this).data("id");
         console.log(comment_no);
         alert('댓글을 삭제하시겠습니까?');
                 $.ajax({
                     type:'delete',
                     url:'<c:url value="/replies/delete/"/>'+comment_no,
                     data:JSON.stringify({"comment_no":comment_no}),
                     contentType: 'application/json',
                     success:function(data){
                        let user_id = ${mem.user_id};
                       let seller = ${detail.user_id};
                       
                       if(user_id  == seller){
                          getAllList();
                       }
                       else{
                            getList();
                       }
                     },
                     error:function(){
                        alert('통신실패');
                     }
                  });
           
      });

      $(document).on("click", "#update", function(){
         const comment_no = $(this).data("id");
         $("#modal").fadeIn();
         $("#modal_modify_cancel_btn").click(function(){
            $("#modal").fadeOut();
         });
         $(".close").click(function(){
            $("#modal").fadeOut();
         });
         
         $("#modal_modify_btn").click(function(){
            const modal_com_content = CKEDITOR.instances.editor2.getData();
            if(modal_com_content == ''){
               alert("내용을 입력해주세요");
            }
                    $.ajax({
                        type:'put',
                        url:'<c:url value="/replies/update"/>',
                        data:JSON.stringify(
                           {
                             "comment_content" : modal_com_content,
                              "comment_no":comment_no
                           }      
                        ),
                        contentType: 'application/json',
                        success:function(data){
                          $('.modal_com_content').val('');
                             $("#modal").fadeOut();
                                 let user_id = ${mem.user_id};
                             let seller = ${detail.user_id};
                             
                             if(user_id  == seller){
                                getAllList();
                                CKEDITOR.instances.editor1.setData(""); 
                             }
                             else{
                                  getList();
                                  CKEDITOR.instances.editor1.setData(""); 
                             }
                           
                        },
                        error:function(){
                           alert('통신실패');
                        }
                     });   
            
         });
         
      });

      $(document).on("click", "#answer", function(){
         const comment_no_level = $(this).data("id");
         $("#modal").fadeIn();
         $("#modal_modify_cancel_btn").click(function(){
            $("#modal").fadeOut();
         });
         $(".close").click(function(){
            $("#modal").fadeOut();
         });
         $("#modal_modify_btn").click(function(){
            const modal_com_content = CKEDITOR.instances.editor2.getData();
            const product_id = ${detail.product_id};
            const user_id = ${mem.user_id};
            
            if(modal_com_content == ''){
               alert("내용을 입력해주세요");
            }
            
            console.log('답글');
                    $.ajax({
                        type:'post',
                        url:'<c:url value="/replies/tabComment"/>',
                        data:JSON.stringify(
                           {
                             "product_id" : product_id,
                             "user_id" : user_id,
                             "comment_content" : modal_com_content,
                              "comment_no_level": comment_no_level,
                              "comment_no" : comment_no_level
                           }      
                        ),
                        contentType: 'application/json',
                        success:function(data){
                           if(data == "insert"){
                           $('.modal_com_content').val('');
                             $("#modal").fadeOut();
                               let user_id = ${mem.user_id};
                             let seller = ${detail.user_id};
                             
                             if(user_id  == seller){
                                getAllList();
                                CKEDITOR.instances.editor1.setData(""); 
                             }
                             else{
                                  getList();
                                  CKEDITOR.instances.editor1.setData(""); 
                             }
                           }else{
                              console.log("실패");
                           }
                           
                        },
                        error:function(){
                           alert('통신실패');
                        }
                     });   
            
         });
         
      });
      function deleteBoard(){
         var message='${message}';
         alert(message);
         location.href="/category/all";
      }
   </script>

      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
      <script
         src="${pageContext.request.contextPath}/resources/js/slide.js/"></script>
      <script src="${pageContext.request.contextPath}/resources/map.js/"></script>
      <script
         src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
      <script
         src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!-- Custom scripts for all pages-->
      <script
         src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
</c:forEach>
</body>
</html>