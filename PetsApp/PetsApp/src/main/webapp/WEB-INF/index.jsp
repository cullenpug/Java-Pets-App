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
<title>Pets App Login</title>
</head>
<body>
	<div class="mx-auto">
		<div class="my-5 text-center">
			<h1>
				Welcome to<br> Pets App Tracker! <br>
			</h1>
		</div>
		<div class="d-flex justify-content-center">
			<div class="row g-3 align-items-center">
				<h2>Register:</h2>
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div class="col-auto">
						<form:label path="username">User Name:</form:label>
						<form:errors path="username" class="text-danger" />
						<form:input type="text" path="username" />
					</div>
					<div class="col-auto">
						<form:label path="email">Email:</form:label>
						<form:errors path="email" class="text-danger" />
						<form:input type="text" path="email" />
					</div>
					<div class="col-auto">
						<form:label path="password">Password:</form:label>
						<form:errors path="password" class="text-danger" />
						<form:input type="password" path="password" />
					</div>
					<div class="col-auto">
						<form:label path="confirm">Confirm Password</form:label>
						<form:errors class="text-danger" path="confirm" />
						<form:input type="password" path="confirm" />
					</div>
					<div>
						<input class="btn btn-info" type="submit" value="Submit">
					</div>
				</form:form>
			</div>
			<div class="row g-3 align-items-center">
				<h2>Login:</h2>
				<form:form action="/login" method="POST" modelAttribute="newLogin">
					<div class="col-auto">
						<form:label path="email">Email:</form:label>
						<form:errors path="email" class="text-danger" />
						<form:input type="text" path="email" />
					</div>
					<div class="col-auto">
						<form:label path="password">Password:</form:label>
						<form:errors path="password" class="text-danger" />
						<form:input type="password" path="password" />
					</div>
					<div>
						<input class="btn btn-info" type="submit" value="Submit">
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>