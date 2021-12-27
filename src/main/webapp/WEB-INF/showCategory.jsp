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
    	<a class="navbar-brand" href="/product/new">New Product</a>
    </nav><br/>
        <h1>${category.name}</h1>
        <c:if test="${empty(products)}">
        	<p>No products listed in the category! Add one below.</p>
        </c:if>
     	<c:forEach items="${products}" var="product">
        	<a href="/product/${product.id}">${product.name}</a><br/>
        </c:forEach>
        
        <!--  Add a product -->
        <hr/>
        <h4>Add a Product</h4>
    	<form action="/category/${category.id}/addProduct" method="post">
        <select name="productId">
        		<option value="NONE">Select a Product</option>
       		 	<c:forEach items="${unassignedProducts}" var="product">
        			<option value="${product.id}">${product.name}</option>
        		</c:forEach>		 	
        </select>
        <input value="Add" type="submit"/>
        </form>
        
    </div> <!-- End of Container -->
</body>
</html>