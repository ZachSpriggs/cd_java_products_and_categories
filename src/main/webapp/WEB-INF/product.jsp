<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>   
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Product</title>
</head>
<body>

	<div class = "container">
		<nav class='navbar navbar-light bg-dark text-white'>
            <a class='navbar brand text-white' href="/newCategory">Create a Category</a>
            <a class='navbar brand text-white' href="/newProduct">Create a Product</a>
        </nav>
        <div class = "col-8">
        	<h3><c:out value = "${product.name}"/></h3>
        	<h5>Categories: </h5>
        		<ul>
		        	<c:forEach items = "${product_categories}" var = "category">
		        		<li><c:out value="${category.name}"></c:out></li>
		        	</c:forEach>
        		</ul>
        	<hr>
        	 <form action = "/categories/${category.id}" method="POST">
            <label>Add category:</label>
                    <select name = "category">
                        <c:forEach items = "${categories}" var = "category">
                            <option value = "${category.id}"><c:out value = "${category.name}"/>
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