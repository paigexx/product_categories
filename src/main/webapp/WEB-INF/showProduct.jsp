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
<title>${product.name}</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<a class="navbar-brand" href="/">Home</a>
    	<a class="navbar-brand" href="/category/new">New Category</a>
    </nav><br/>
	<h1>${product.name}</h1>
	<hr/>
	<c:if test="${empty(categories)}">
        	<p>No categories have been assigned to this product! Add one below.</p>
        </c:if>
     	<c:forEach items="${categories}" var="c">
        	<a href="/product/${c.id}">${c.name}</a><br/>
        </c:forEach>
        <hr/>
        <h4>Assign a Category</h4>
    	<form action="/product/${product.id}/addCategory" method="post">
        <select name="categoryId">
        		<option value="NONE">Select a Category</option>
       		 	<c:forEach items="${unassignedCategories}" var="category">
        			<option value="${category.id}">${category.name}</option>
        		</c:forEach>		 	
        </select>
        <input value="Add" type="submit"/>
        </form>
</body>
</html>