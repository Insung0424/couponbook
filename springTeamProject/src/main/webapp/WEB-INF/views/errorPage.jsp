<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
if(session != null){
	%>
	<script type="text/javascript">
	alert("잘못된 접근입니다" );
	window.history.back();
	</script>
	<%
} else {
	%>
	${msg }
	<%
}
%>
