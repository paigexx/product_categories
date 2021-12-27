<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
        <h1>Welcome</h1>
        <hr/>
        <h4>Explore Categories: </h4>
        <c:forEach items="${categories}" var="category">
        <a class="link" href="/category/${category.id}">${category.name}</a></br/>
        </c:forEach>
        <hr/>
        <h4>Explore Products: </h4>
        <c:forEach items="${products}" var="product">
        <a class="link" href="/product/${product.id}">${product.name}</a></br/>
        </c:forEach>
        <hr/>
        <a href="/category/new">New Category</a><br/>
        <a href="/product/new">New Product</a>
    </div> <!-- End of Container -->
</body>
</html>