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
<%@include file="header.jsp" %>
<div class="change password">
  <div class="nav-left">
    <%@include file="nav_left.jsp" %>
  </div>
  <div class="nav-right">
    <h3>Thay đổi mật khẩu</h3>
    <div class="input-group">
      <p>mật khẩu</p>
      <input id="password"
             name="password"

             required
             class="form-control"
             placeholder="123456">
    </div>
    <div class="input-group">
      <p>mật khẩu mới</p>
      <input id="new-password"
             name="new-password"

             required
             class="form-control"
      >
    </div>
    <div class="input-group">
      <p>xác nhận mật khẩu</p>
      <input id="confirm-password"
             name="password"

             required
             class="form-control"
      >
    </div>
    <div class="change-password-btn">
      <button type="submit" class="btn-login form-control">Thoát</button>
      <button type="submit" class="btn-login form-control">Lưu</button>
    </div>
  </div>
</div>
</body>
</html>