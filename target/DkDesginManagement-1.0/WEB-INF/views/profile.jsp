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
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/profile.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div style="margin-left: 20%;">
        <span style="font-size: 30px;"><i class="fa-solid fa-chevron-left"></i>Thông tin cá nhân</span>
        <div class="information-main">
            <div class="information-main-avata">
                <button type="button" class="avatar_change" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false" style="
                      border-radius: 50%;
                      background-color: white;
                      border: none;
                      outline: none;
                    ">
                    <img class="img_avatar_change" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                </button>
            </div>
            <div>
                <table class="table table-borderless">
                    <tr>
                        <td>Họ và tên:</td>
                        <td>Hoàng Thị Thu Hương</td>
                    </tr>
                    <tr>
                        <td>Mã nhân viên:</td>
                        <td>huonghtt</td>
                    </tr>
                    <tr>
                        <td>Số CCCD/CMND:</td>
                        <td>1234567890123</td>
                    </tr>
                    <tr>
                        <td>Ngày sinh:</td>
                        <td>20/04/2000</td>
                    </tr>
                    <tr>
                        <td>Giới tính:</td>
                        <td>Nữ</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td>0123456678</td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>huonghtthe141550@fpt.edu.vn</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ nhà:</td>
                        <td>Nam Định, Việt Nam</td>
                    </tr>

                </table>
            </div>
        </div>
        <div>
            <form action="">
                <button class="btn btn-primary btn-edit">Chỉnh sửa</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
</body>
<%--<script>--%>
<%--    $(function () {--%>
<%--        $("#header-include").load("header.html");--%>
<%--        $("#narbar_menu").load("nav-left.html");--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>