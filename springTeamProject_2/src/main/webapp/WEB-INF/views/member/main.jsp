<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>

<div class="card" id="comments">
  <div class="card-body">
    <form>
      <div class="form-group">
        <label>댓글 작성</label>
        <textarea class="form-control" id="com_content" rows="3"></textarea>
      </div>
      <input type="hidden" id="user_id" value="${vo.user_id}">
      <input type="hidden" id="product_id" value="${vo.product_id}">
      <button type="button" class="btn btn-primary" id="comment-create-btn">제출</button>
    </form>
  </div>
</div>

<script type="text/javascript">

</script>
</body>
</html>