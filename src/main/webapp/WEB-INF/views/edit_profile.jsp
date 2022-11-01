<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chỉnh sửa thông tin cá nhân</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="edit-profile">
    <div class="nav-left">
        <%@include file="nav_left.jsp" %>
    </div>
    <div class="nav-right">
        <div class="information">
            <a href="profile" class="main-information">icon</a>
            <h3 class="main-information">Chỉnh sửa thông tin cá nhân</h3>
        </div>
        <div class="main">
            <p>Thông tin cá nhân</p>
            <div class="name">
                <h5 class="main-name">Họ và tên: </h5>
                <input id="name"
                       name="name"


                       class=""
                       aria-valuetext=" Hoàng Thị Thu Hương">
            </div>
            <div class="number-CCCD">
                <h5 class="main-name">Họ và tên: </h5>
                <input id="CCCD"
                       name="CCCD"


                       class=""
                       aria-valuetext="Số CCCD/CMND">
            </div>
            <div class="day-of-birth">
                <h5 class="main-name">Họ và tên: </h5>
                <input id="day-of-birth"
                       name="day-of-birth"


                       class=""
                       aria-valuetext="Ngày sinh">
            </div>
            <div class="sex">
                <p>Giới tính</p>
                <form>
                    <input name="gender" type="radio" value="Nam"/>Nam
                    <input name="gender" type="radio" value="Nữ"/>Nữ
                </form>
            </div>
            <div class="SĐT">
                <h5 class="main-name">SĐT: </h5>
                <input id="SĐT"
                       name="SĐT"


                       class=""
                       aria-valuetext="323423423">
            </div>
            <div class="email">
                <h5 class="main-name">Email: </h5>
                <input id="email"
                       name="email"


                       class=""
                       aria-valuetext="hanoi.gmail.com">
            </div>
            <div class="adress">
                <h5 class="main-name">Địa chỉ nhà: </h5>
                <input id="adress"
                       name="adress"


                       class=""
                       aria-valuetext="Chương Mỹ, Hà Nội">
            </div>
            <div class="btn">
                <button class="back">Hủy</button>
                <button class="save">Lưu</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>