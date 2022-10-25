<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="updateForm" modelAttribute="test">
		<form:input type="text" path="id" />
		<br>
		<form:input type="text" path="name" />
		<br>
		<form:input type="text" path="testcol" />
		<br>
		<input type="submit" value="sub">
	</form:form>
</body>
</html>