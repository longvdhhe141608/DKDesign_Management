<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet"
          type="text/css"
          href="asset/css/login.css">
</head>
<body class="login">
<div class="navbar-shawdow">
    <div class="card-header">
        <h3>TMDKC</h3>
        <h4>Đăng Nhập</h4>
    </div>
    <div class="card-body">
        <form action="Login" method="post">
            <div class="input-group">
                <input id="email"
                       name="email"

                       required
                       class="form-control"
                       placeholder="Nhập Email">
            </div>
            <div class="input-group">
                <input id="password"
                       name="pass"
                       required

                       class="form-control"
                       placeholder="Nhập mật khẩu"
                       minlength="6"
                       maxlength="32">
            </div>
            <div class="input-group-text">
                <a href="Forgotpassword.jsp" class="text-blue">Quên mật khẩu</a>
            </div>
            <div class="input-group input-group-btn">
                <button type="submit" class="btn-login form-control">Đăng nhập</button>
            </div>
        </form>
    </div>


</div>

</body>
</html>
