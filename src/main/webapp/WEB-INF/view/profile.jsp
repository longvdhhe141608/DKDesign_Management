<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="profile">
    <div class="nav-left">
        <%@include file="nav-left.jsp" %>
    </div>
    <div class="profile-main">
        <div class="information">
            <a href="#" class="main-information">icon</a>

        </div>
        <div class="information">
            <a href="Home.jsp" class="main-information">icon</a>
            <h3 class="main-information">Thông tin cá nhân</h3>
        </div>
        <div class="main">
            <div class="main-name">
                <h5 class="name"> Họ và tên: </h5>
                <p id="name">Hoàng Thị Thu Hương</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Mã nhân viên:</h5>
                <p id="employee-code">huonghtt</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Số CCCD/CMND </h5>
                <p id="number-CCCD">531231512512</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Ngày sinh: </h5>
                <p id="Date-of-birth">07-07-2000</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Giới tính: </h5>
                <p id="sex">Nam</p>
            </div>
            <div class="main-name">
                <h5 class="name">Số điện thoại: </h5>
                <p id="SĐT">1234567895</p>
            </div>

            <div class="main-name">
                <h5 class="name"> Email: </h5>
                <p id="email">huong@gmail.com</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Địa chỉ nhà: </h5>
                <p id="address">Hà Nội , Việt nam </p>
            </div>
            <div class="main-name-btn">

                <button class="edit">Chỉnh sửa</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>