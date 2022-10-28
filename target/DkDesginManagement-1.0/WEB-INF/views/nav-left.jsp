<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>nar-left</title>
    <link href="<c:url value="/resources/assets/css/nav-left.css" />" rel="stylesheet" />
</head>
<body>
<div class="tab">
    <div class="btn">
        <span class="input-group"> <img src="home.jsp" alt=""></span><span class="input-group">Trang chủ</span>
    </div>
    <div class="btn">
        <span class="input-group"><img src="" alt=""></span><span class="input-group">Công việc của tôi</span>
    </div>
    <div class="btn" datasrc="">
        <span class="input-group"><img src="project.jsp" alt=""></span><span class="input-group">Công trình</span>
    </div>
    <div class="btn">
        <span class="input-group"><img src="notification.jsp" alt=""></span><span class="input-group">Thông báo</span>
    </div>
</div>
</body>
</html>
