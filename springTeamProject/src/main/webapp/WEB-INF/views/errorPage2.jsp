<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
if(session != null){
	%>
	<script type="text/javascript">
	var msg = '${msg }';
	alert("비정상적인 활동으로 제재를 받아 로그인이 제한됩니다.");
	window.history.back();
	</script>
	<%
} else {
	%>
	${msg }
	<%
}
%>
