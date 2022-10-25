<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Quên mật khẩu</title>
  <link rel="stylesheet"
        type="text/css"
        href="../asset/css/forgotpassword.css">
</head>
<body class="fogotpassword">
<div class="navbar-shawdow">
  <div class="card-header">
    <h3>TMDKC</h3>
  </div>
  <div class="input-group">
    <input id="email"
           name="email"

           required
           class="form-control"
           placeholder="Nhập Email">
  </div>
  <div class="input-group-btn">
    <button type="submit" class="btn btn-close">Hủy bỏ</button>
    <button type="submit" class="btn btn-verify">Xác minh</button>

  </div>
</div>

</body>
</html>
