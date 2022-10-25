<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="i" items="${mess}">
		<div >
			<img style="width: 250px;" alt="" src="${i.testcol}">
		</div>
		<a href="add/${i.id}">${i.name}</a>
	</c:forEach>
</body>
</html>