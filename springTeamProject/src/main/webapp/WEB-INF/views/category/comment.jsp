<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
#modal {
   position: absolute;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.8);
   top: 0;
   left: 0;
   display: none;
}

#modal_content {
   width: 50%;
   height: 800px;
   background: #fff;
   border-radius: 10px;
   position: relative;
   top: 50%;
   left: 50%;
   margin-top: -100px;
   margin-left: -25%;
   text-align: center;
   box-sizing: border-box;
   padding: 50px 0;
   line-height: 23px;
}

#span {
   display: inline-block;
   margin-left: 30px;
}
</style>
</head>
<body>
   <div class="modal-header">
      <div class="modal-title">댓글로 거래하기</div>


      <div id="modal_trade" style="height: 50px; margin-left: 200px;">
         <div id="modal_trade_content"></div>
      </div>


      
   </div>


   <div class="modal-body">
      <div class="mb-3">
         작성자 <input type="text" id="writer" readonly value="${mem.email}"
            class="form-control" /> 내용
         <textarea class="form-control" id="editor1" name="editor1"
            class="com_comment" rows="5"></textarea>
       <c:choose>
       	<c:when test="${not empty user_id}">
         <script type="text/javascript">
            CKEDITOR.replace('editor1');
         </script>
        </c:when>
        <c:otherwise>
        	<script type="text/javascript">
           	 CKEDITOR.replace('editor1');
           	 CKEDITOR.instances.editor1.config.readOnly = true;
        	 CKEDITOR.instances.editor1.setData("로그인후 댓글을 남길 수 있습니다");
        	</script>
        </c:otherwise>
       </c:choose>
      </div>
   </div>
   <c:if test="${not empty user_id}"> 
   <div class="modal-footer">
      <button type="button" id="add_btn" class="btn btn-primary">댓글등록</button>
      <input type="button" id="more_comment" value="댓글 보기"
         class="btn btn-primary">
   </div>
	</c:if>
   <span id="comment_list"></span>

   <div id='modal'>
      <div id='modal_content'>
         <div class="modal-header">
            <div class="modal-title">내용</div>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true" style="font-size: 1em;">×</span>
            </button>
         </div>
         <div class="modal-body">
            <div class="mb-3">
               <textarea class="form-control" id="editor2" name="editor2"
                  class="modal_com_content" rows="5"></textarea>
               <script type="text/javascript">
                  CKEDITOR.replace('editor2');
               </script>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" id="modal_modify_btn" class="btn btn-primary">등록</button>
            <button type="button" id="modal_modify_cancel_btn"
               class="btn btn-primary">취소</button>
            </td>
         </div>
      </div>
   </div>

</body>
</html>