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
<title>Homepage</title>
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
							aria-current="page" href="/homepage">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/pets/new">Create</a></li>
						<li class="nav-item"><a class="nav-link" href="/logout">Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<h2>
			Welcome
			<c:out value="${user.username}"></c:out>
		</h2>
		<table class="table">
			<h3>Pets Linked:</h3>
			<thead>
				<tr>
					<th>Name:</th>
					<th>Type:</th>
					<th>Level:</th>
					<th>Owner</th>
					<th>Actions</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="pet" items="${pets}">
					<tr>
						<td><c:out value="${pet.petName}"></c:out></a></td>
						<td><c:out value="${pet.type}"></c:out></td>
						<td><c:out value="${pet.level}"></c:out></td>
						<td><c:out value="${pet.user.username}">
							</c:out></td>
						<td><a class="btn btn-outline-info" href="/pets/${pet.id}">Details</a>
							<c:if test="${userId == pet.user.id}">
								<a class="btn btn-outline-warning" href="/pets/${pet.id}/edit">Edit</a>
								<button type="button" class="btn btn-outline-light">
									<a href="/pets/${pet.id}/delete">
										<form action="/pets/${pet.id}/delete" method="post">
											<input type="hidden" name="_method" value="delete"> <input
												class="btn btn-outline-danger" type="submit" value="Delete">
										</form>
									</a>
								</button>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-grid gap-2">
			<a class="btn btn-outline-primary" href="/pets/new">Add a friend</a>
		</div>
	</div>
</body>