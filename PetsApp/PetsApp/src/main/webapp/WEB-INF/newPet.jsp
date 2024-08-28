<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Add a friend!</title>
</head>
<body>
		<div class="container">
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
			style="color: rebeccapurple">
			<div class="container-fluid">
				<h1>Pets App Tracker!</h1>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"  href="/homepage" >Home</a></li>
						<li class="nav-item"><a class="nav-link"  href="/pets/new"  >Create</a></li>
						<li class="nav-item"><a class="nav-link"  href="/logout" >Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<h2>Add a Friend:</h2>
		<form:form action="/pets/new" method="POST" modelAttribute="pet">
			<div class="mb-3">
				<form:label path="petName">Name:</form:label>
				<form:errors path="petName" class="text-danger" />
				<form:input type="text" path="petName" />

			</div>
			<div class="mb-3">
				<form:label path="level">Level:</form:label>
				<form:errors path="level" class="text-danger" />
				<form:input type="number" path="level" />
			</div>
			<div class="mb-3">
				<form:label path="type">Type:</form:label>
				<form:errors path="type" class="text-danger" />
				<form:input type="text" path="type" />
				
			</div>
			<div class="mb-3">
				<form:label path="health">Health:</form:label>
				<form:errors path="health" class="text-danger" />
				<form:input type="number" path="health" />
			</div>
			<div class="mb-3">
				<form:label path="happiness">Happiness:</form:label>
				<form:errors path="happiness" class="text-danger" />
				<form:input type="number" path="happiness" />
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
		
	</div>
</body>
</html>