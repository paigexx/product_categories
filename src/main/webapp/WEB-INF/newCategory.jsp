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
<title>New Product</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<a class="navbar-brand" href="/">Home</a>
    	<a class="navbar-brand" href="/product/new">New Product</a>
    </nav><br/>
        <h3>New Category</h3>
        <form:form action="/category/save" method="post" modelAttribute="category">
        	<form:label path="name">Category Name: </form:label>
        	<form:errors path="name"/>
        	<form:input path="name"/>
        	<input class="btn btn-primary" type="submit" value="Create Category!"/>
        </form:form>
  
    </div> <!-- End of Container -->
</body>
</html>