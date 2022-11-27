<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thay đổi mật khẩu</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="change password">
    <div class="nav-left">
        <jsp:include page="nav_left.jsp"/>
    </div>
    <div class="nav-right">
        <h3>Thay đổi mật khẩu</h3>
        <div class="input-group">
            <p>mật khẩu</p>
            <input id="old-password" name="old-password" class="form-control" required/>
        </div>
        <div class="input-group">
            <p>mật khẩu mới</p>
            <input id="new-password" name="new-password" class="form-control" required/>
        </div>
        <div class="input-group">
            <p>xác nhận mật khẩu</p>
            <input id="confirmed-password" name="confirmed-password" class="form-control" required/>
        </div>
        <div class="change-password-btn">
            <button class="btn-login form-control"><a href="javascript:history.back()">Thoát</a></button>
            <button type="submit" class="btn-login form-control">Lưu</button>
        </div>
    </div>
</div>
</body>
</html>