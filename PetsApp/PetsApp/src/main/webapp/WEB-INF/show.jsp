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
<title>Show Details</title>
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
		<div class="container text-center">
			<h2>
				<c:out value="${pets.petName}"></c:out> the <c:out value="${pets.type}"></c:out>
			</h2>
			<h3>
				Posted By:
				<c:out value="${pets.user.username}"></c:out>
			</h3>
			<p>
				Current level:
				<c:out value="${pets.level}"></c:out>
				<br>
				Current health:
				<c:out value="${pets.health}"></c:out>
				<br>
				Current happiness:
				<c:out value="${pets.happiness}"></c:out>
				<br>
				
			</p>
			<div class="d-grid gap-2 col-6 mx-auto">
				<%-- Check the userId is in session (ONLY display edit/delete if the userId matches the creators id) --%>
				<c:if test="${userId == pets.user.id}">
					<div class="d-grid gap-2 d-md-block">
						<a class="btn btn-outline-warning" href="/pets/${pets.id}/edit">Edit</a>
					</div>
					<form action="/pets/${pets.id}/delete" method="post">
						<input type="hidden" name="_method" value="delete"> <input
							class="btn btn-outline-danger" type="submit" value="Delete">
					</form>
				</c:if>
			</div>
		</div>
	</div>	
</body>
</html>