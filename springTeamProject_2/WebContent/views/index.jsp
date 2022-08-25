<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<body>
<center><h1>Shopping</h1></center>

<table border="3" align="center" ><tr>
 
<td>Id</td>
<td>Photo</td>
<td>Name</td>
<td>Price</td>
<td>deadline</td>
<td>Description</td>


</tr>

<c:forEach var="p" items="${listproduct}">


<tr>

<td>${p.id }</td>
<td>
<img alt="" src="" height="100px" width="100px">

</td>
<td></td>
<td></td>
<td></td>
<td></td>



<td><a href=""  >OrderNow</a></td>

</tr>

</c:forEach>
</table>
</body>
</html>