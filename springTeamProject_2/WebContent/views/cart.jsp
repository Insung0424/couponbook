<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>index</title>
</head>
<body>

<div align="center">
<h1>Product</h1>
<table border="2" >
<tr>
<th>Options</th>
<th >Id</th>
<th>Photo</th>
<th >Name</th>
<th >Price</th>
<th >deadline</th>
<th >Sub Total</th>

 
</tr>

<c:set var="s" value="0"></c:set>
<c:forEach var="pr" items="${sessionScope.cart}">
<c:set var="s" value="${s+ pr.product.price * pr.product.quantity}"></c:set>
<tr>
<td><a href="" >delete</a></td>
<td>${pr.product.id }</td>

<td>
<img alt="" src="" height="100px" width="100px">

</td>

<td></td>
<td></td>
<td></td>
<td></td>
</tr>


  
  
  
  
</c:forEach>

<tr><td colspan="6" align="right">Sum</td>
<td>${s}</td>

</tr>
</table>
<a href="">Shop</a>  <br>

</div>



</body>
</html>