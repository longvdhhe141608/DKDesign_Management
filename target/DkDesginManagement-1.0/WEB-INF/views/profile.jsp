<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="profile">
    <jsp:include page="nav_left.jsp"/>
    <div class="profile-main">
        <div class="information">
            <a href="#" class="main-information">icon</a>

        </div>
        <div class="information">
            <a href="/headerHome" class="main-information">icon</a>
            <h3 class="main-information">Thông tin cá nhân</h3>
        </div>
        <div class="main">
            <div class="main-name">
                <h5 class="name"> Họ và tên: </h5>
                <p id="name">${requestScope.profile.name}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Mã nhân viên:</h5>
                <p id="employee-code">${profile.id}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Số CCCD/CMND </h5>
                <p id="number-CCCD">${requestScope.profile.cccd}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Ngày sinh: </h5>
                <p id="Date-of-birth">${requestScope.profile.name}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Giới tính: </h5>
                <p id="sex">${requestScope.profile.gender==1?"Nam":requestScope.profile.gender==1?"Nu":"Unknown"}</p>
            </div>
            <div class="main-name">
                <h5 class="name">Số điện thoại: </h5>
                <p id="SĐT">${requestScope.profile.phone}</p>
            </div>

            <div class="main-name">
                <h5 class="name"> Email: </h5>
                <p id="email">${requestScope.profile.mail}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Địa chỉ nhà: </h5>
                <p id="address">${requestScope.profile.address}</p>
            </div>
            <div class="main-name-btn">

                <button class="edit">Chỉnh sửa</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>