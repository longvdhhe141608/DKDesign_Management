<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Header</title>
    <link href="<c:url value="/resources/assets/css/header.css" />" rel="stylesheet" />
</head>
<body>


<div class="head">
    <div class="nav">

        <h3 class="home">TMDKC</h3>


        <form class="search-home" action="#" method="post">

            <input class="input-search" type="text" id="search" name="search" placeholder="Tìm Kiếm">
            <button class="btn-search" type="submit" >Search</button>
        </form>


        <div class="dropdown">
            <c:if test="${sessionScope.loginUser != null}">
                <span class="dropdown-select">${loginUser.roleInWeb} ${loginUser.nameAcc}</span>
            </c:if>
            <div class="dropdown-content">
                <p><a class="dropdown-content-title" href="profile">Thông tin cá nhân</a></p>
                <p><a class="dropdown-content-title" href="changePassword">Đổi mật khẩu</a></p>
                <p><a class="dropdown-content-title" href="logout">Dang xuat</a></p>
            </div>
        </div>

    </div>
</div>
</body>
</html>
