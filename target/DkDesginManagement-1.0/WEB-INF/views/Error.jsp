<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/27/2022
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lỗi</title>
</head>
<body>
<div style="text-align: center;">
    <h3>Hành động của bạn không được thực hiện thành công do lỗi sau:</h3>
    <h4>${exception.message}</h4>
    <a href="javascript:history.back()">Quay trở lại</a>
</div>
</body>
</html>
