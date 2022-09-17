<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
if(session != null){
	%>
	<script type="text/javascript">
	var msg = '${msg }';
	alert("오류를 다시 한번 확인해주세요");
	window.history.back();
	</script>
	<%
} else {
	%>
	${msg }
	<%
}
%>
