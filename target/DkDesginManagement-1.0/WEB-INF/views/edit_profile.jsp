
<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Chỉnh sửa thông tin cá nhân</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="edit-profile">
    <jsp:include page="nav_left.jsp"/>
    <div class="nav-right">
        <div class="information">
            <h3 class="main-information">Chỉnh sửa thông tin cá nhân</h3>
        </div>
        <div class="main">
            <p>Thông tin cá nhân</p>
            <a hidden>
                <input value="${profile.id}" name="id" type="text" class="form-control" required>
            </a>
            <div class="name">
                <h5 class="main-name">Họ và tên: </h5>
                <input id="name"
                       name="name"
                       class=""
                       value="${profile.name}">
            </div>
            <div class="number-CCCD">
                <h5 class="main-name">cccd: </h5>
                <input id="cccd"
                       name="cccd"
                       class=""
                       value="${profile.cccd}">
            </div>
            <div class="day-of-birth">
                <h5 class="main-name">Date Of Birth: </h5>
                <input id="dob"
                       name="dob"
                       class=""
                       type="date"
                       value="${profile.dob}">
            </div>
            <div class="sex">
                <p>Giới tính</p>

                <form>
                    <input id="1" name="gender" type="radio" value="Nam"/>Nam
                    <input id="0" name="gender" type="radio" value="Nữ"/>Nữ
                </form>
            </div>
            <div class="SĐT">
                <h5 class="main-name">SĐT: </h5>
                <input type="tel"
                       id="phone"
                       name="phone"
                       class=""
                       value="${profile.phone}">
            </div>
            <div class="email">
                <h5 class="main-name">Email: </h5>
                <input type="email"
                       id="email"
                       name="email"
                       class=""
                       value="${requestScope.profile.mail}">
            </div>
            <div class="address">
                <h5 class="main-name">Địa chỉ nhà: </h5>
                <input id="address"
                       name="address"
                       class=""
                       value="${profile.address}">
            </div>
            <div class="btn">
                <button class="back">Hủy</button>
                <input value="Save" type="submit" class="save">
            </div>
        </div>
    </div>
</div>
</body>
</html>