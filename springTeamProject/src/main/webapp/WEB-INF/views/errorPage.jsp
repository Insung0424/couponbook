<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
if(session != null){
	%>
	<script type="text/javascript">
	var msg = '${msg }';
	alert("아이디 또는 비밀번호가 틀렸습니다 \n다시 확인해주세요");
	window.history.back();
	</script>
	<%
} else {
	%>
	${msg }
	<%
}
%>
