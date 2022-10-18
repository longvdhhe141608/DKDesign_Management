<%--
  Created by IntelliJ IDEA.
  User: Huan
  Date: 18/10/2022
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link rel="stylesheet"
          type="text/css"
          href="asset/css/header.css">
</head>
<body>


<div class="head">
    <div class="nav">

        <h3 class="home">TMDKC</h3>


        <form class="search-home" action="#" method="post">

            <input class="input-search" type="text"  id="search" name="search" placeholder="Tìm Kiếm">
            <button class="btn-search">Search</button>
        </form>


        <div class="dropdown">
            <span class="dropdown-select">Icon Profile</span>
            <div class="dropdown-content">
                <p><input class="dropdown-content-title" name="profile" type="button" href="profile.xxx" value="Thông tin cá nhân"></p>
                <p><input class="dropdown-content-title" name="changePassword" type="button" href="changePassword.xxx" value="Đổi mật khẩu"></p>
                <p><input class="dropdown-content-title" name="logout" type="button" href="Login.jsp" value="Đăng xuất"></p>
            </div>
        </div>

    </div>
</div>
</body>
</html>

