<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>   
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>New Category </title>
</head>
<body>

<div class="container">
        <nav class='navbar navbar-light bg-dark text-white'>
            <a class='navbar brand text-white' href="/newCategory">Create a Category</a>
            <a class='navbar brand text-white' href="/newProduct">Create a Product</a>
        </nav>
        <h3>Create a Product</h3>
        <form:form action="/createProduct" method="POST" modelAttribute = "product">
            <div class="row">
                <div class="col-4">
                    <p>
	  					<form:label path = "name">Name:</form:label>
	  					<form:errors path = "name"/>
	  					<form:input path = "name" type = "text"/>
  					</p>
  					<p>
	  					<form:label path = "description">Description:</form:label>
	  					<form:errors path = "description"/>
	  					<form:input path = "description" type = "text"/>
  					</p>
  					<p>
	  					<form:label path = "price">Price:</form:label>
	  					<form:errors path = "price"/>
	  					<form:input path = "price" type = "text" value = "00.00"/>
  					</p>
                </div>
            </div>
            <div class='row'>
                <button class='btn btn-outline-success ml-3 mt-3'>Add</button>
            </div>
        </form:form>
        
    </div>

</body>
</html>