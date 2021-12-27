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
<title>Title Here</title>
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
    	<a class="navbar-brand" href="/category/new">New Category</a>
    </nav><br/>
        <h3>New Product</h3>
        <form:form action="/product/save" method="post" modelAttribute="product">
        <p>
        	<form:label path="name">Product Name: </form:label><br/>
        	<form:errors path="name"/>
        	<form:input path="name"/>
        </p>
        <p>
        	<form:label path="description">Product Description: </form:label><br/>
        	<form:errors path="description"/>
        	<form:textarea path="description"/>
        </p>
        <p>
        	<form:label path="price">Product Price: </form:label><br/>
        	<form:errors path="price"/>
        	<form:input type="number" step="0.01" path="price"/>
        </p>
        <input class="btn btn-primary" type="submit" value="Create Product!"/>
        </form:form>
    </div> <!-- End of Container -->
</body>
</html>