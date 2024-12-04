<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>   
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Category</title>
</head>
<body>

	<div class = "container">
		<nav class='navbar navbar-light bg-dark text-white'>
            <a class='navbar brand text-white' href="/newCategory">Create a Category</a>
            <a class='navbar brand text-white' href="/newProduct">Create a Product</a>
        </nav>
        <div class = "col-8">
        	<h3><c:out value = "${category.name}"/></h3>
        	<h5>Products: </h5>
	        	<ul>
		        	<c:forEach items = "${category_products}" var = "product">
		        		<li><c:out value="${product.name}"></c:out></li>
		        		<li> Description: <c:out value="${product.description}"></c:out></li>
		        		<hr>
		        	</c:forEach>
	        	</ul>
       		<hr>
              <form action="/products/${product.id}" method="POST">
           		<label>Add product:</label>
                  <select name = "product">
                      <c:forEach items = "${products}" var = "product">
                          <option value = "${product.id}"><c:out value = "${product.name}"/>
                          </option>
                      </c:forEach>
                  </select>
           <div class='row'>
               <button class='btn btn-dark ml-3 mt-3'>Add</button>
           </div>
       </form>
        </div>
	</div>

</body>
</html>