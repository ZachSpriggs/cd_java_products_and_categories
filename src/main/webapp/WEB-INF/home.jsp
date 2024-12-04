
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
            <a href = "/newCategory" class='navbar brand text-white'>Create a Category</a>
	         <a href = "/newProduct" class='navbar brand text-white'>Create a Product</a>
        </nav>
        <div class = "col-4">
        	<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Name</th>
				      <th scope="col">Description</th>
				      <th scope="col">Price</th>
				    </tr>
				  </thead>
					  <tbody>
						  <c:forEach items = "${products}" var = "products">
					        <tr>
						      <td><c:out value = "${product.name}"/></td>
						      <td><c:out value = "${product.description}"/></td>
						      <td><c:out value = "${product.price}"/></td>
						    </tr>     		
					      </c:forEach>
					  </tbody>
			</table>
        </div>
        <div class = "col-4">
        	<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Name</th>

				    </tr>
				  </thead>
					  <tbody>
						  <c:forEach items = "${categories}" var = "category">
					        <tr>
						      <td><c:out value = "${category.name}"/></td>
						    </tr>     		
					      </c:forEach>
					  </tbody>
			</table>
        </div>
        
	</div>

</body>
</html>