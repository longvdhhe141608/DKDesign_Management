<jsp:useBean id="profile" scope="request" type="DkDesignManagement.Entity.Employee"/>
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
        <a style="font-size: 30px;"><i class="fa-solid fa-chevron-left"></i> Chỉnh sửa thông tin cá nhân</a>
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
            <form action="edit" method="post">
                <div>
                    <table class="table table-borderless">
                        <input type="text" id="userid" name="userid" value="${profile.id}" hidden>
                        <tr>
                            <td>Họ và tên:</td>
<<<<<<< Updated upstream
                            <td><input type="text" id="name" name="name" value="${profile.name}" readonly=""></td>
                        </tr>
<%--                        <tr>--%>
<%--                            <td>Mã nhân viên:</td>--%>
<%--                            <td><input type="text" value="${profile.id}" disabled></td>--%>
<%--                        </tr>--%>
                        <tr>
                            <td>Số CCCD/CMND:</td>
                            <td><input pattern="^[0-9]{10,12}$" type="text" id="cccd" name="cccd" value="${profile.cccd}"></td>
=======
                            <td><input type="text" id="name" name="name" value="${profile.name}"></td>
                        </tr>
                        <tr>
                            <td>Mã nhân viên:</td>
                            <td><input type="text" value="${profile.id}" disabled></td>
                        </tr>
                        <tr>
                            <td>Số CCCD/CMND:</td>
                            <td><input type="text" id="cccd" name="cccd" value="${profile.cccd}"></td>
>>>>>>> Stashed changes
                        </tr>
                        <tr>
                            <td>Ngày sinh:</td>
                            <td><input type="date" id="dob" name="dob" value="${profile.dob}"></td>
                        </tr>
                        <tr>
                            <td>Giới tính:</td>
                            <td><select name="gender" id="gender">
                                <option id="1" value="1">Nam</option>
                                <option id="2" value="2" ${profile.gender==2?"Selected":""}>Nữ</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td><input type="text" id="phone" name="phone" value="${profile.phone}"></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" id="email" name="email" value="${profile.mail}"></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ nhà:</td>
                            <td><input type="text" id="address" name="address" value="${profile.address}"></td>
                        </tr>

                    </table>
                </div>

                <%-- button --%>
                <div class="btn-edit">
<<<<<<< Updated upstream
                    <button class="btn btn-secondary" style="margin-right: 10px; color: white"><a
=======
                    <button class="btn btn-secondary" style="margin-right: 10px;"><a
>>>>>>> Stashed changes
                            href="${pageContext.request.contextPath}/profile/detail">Hủy</a></button>
                    <input type="submit" onclick="alert('Sua profile thanh cong')" class="btn btn-primary" value="Lưu">
                </div>
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
</html>