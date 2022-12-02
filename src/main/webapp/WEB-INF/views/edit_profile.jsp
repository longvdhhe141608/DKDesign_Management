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
    <title>Chỉnh sửa thông tin cá nhân</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/profile.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/information.js"/>"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary" style="margin-left: 20%;">
        <a href="${pageContext.request.contextPath}/profile/detail" style="font-size: 30px;color: black"><i
                class="fa-solid fa-chevron-left"></i> Chỉnh sửa thông tin cá nhân</a>


        <form id="add-project1" action="editProfile" method="post" enctype="multipart/form-data">

            <div class="information-main">
                <div class="information-main-avata">
                    <img alt="avatar" class="img_avatar_change" src="${sessionScope.loginUser.avatar_url}"
                         style="display: flex"/>
                    <input value="${sessionScope.loginUser.avatar_url}" type="text" name="oldAvatar" hidden/>
                    <label class="btn btn-edit"
                           style="display: flex; border: none; border-radius: 5px; background-color: royalblue; color: white; margin-right: 100px; margin-top: 5px;">
                        <input type="file" name="newAvatar" title="Upload avatar" accept="image/*"/>
                    </label>
                </div>


                <div>
                    <input type="text" id="userid" name="userid" value="${profile.id}" hidden>
                    <table class="table table-borderless">
                        <tr>
                            <td class="col-6">Họ và tên:</td>
                            <td class="col-6">
                                <input class="info-text" type="text" id="name"
                                 name="name" value="${profile.name}" style="width: 300px;padding: 3px">
                                <div class="text-danger error"></div></td>

                        </tr>

                        <tr>
                            <td>Số CCCD/CMND:</td>
                            <td><input class="info-text" type="text" id="cccd" name="cccd"
                                       value="${profile.cccd}" style="width: 300px;padding: 3px">
                                <div class="text-danger error"></div></td>
                        </tr>
                        <tr>
                            <td>Ngày sinh:</td>
                            <td><input  class="info-text" type="date" id="inputstartdate" name="dob" value="${profile.dob}" style="width: 300px;padding: 3px">
                                <div class="text-danger error"></div></td>
                        </tr>
                        <tr>
                            <td>Giới tính:</td>
                            <td><select class="btn btn-secondary" name="gender" id="gender" >
                                <option id="1" value="1">Nam</option>
                                <option id="2" value="2" ${profile.gender==2?"selected":""}>Nữ</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td><input class="info-text" type="text" id="phone" name="phone"
                                       value="${profile.phone}" style="width: 300px;padding: 3px">
                                <div class="text-danger error"></div></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input class="info-text" type="text"
                                       id="email"
                                       name="email" value="${profile.mail}" style="width: 300px;padding: 3px">
                                <div class="text-danger error"></div></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ nhà:</td>
                            <td><input class="info-text" type="text"
                                       id="address" name="address" value="${profile.address}" style="width: 300px;padding: 3px">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <%-- button --%>
            <div class="btn-edit">
                <button class="btn btn-secondary" style="margin-right: 10px; color: white">
                    <a style="color: white" href="javascript:history.back() ">Hủy</a>
                </button>
                <button onclick="return checkvalidate('#add-project1')" type="submit" class="btn btn-primary" value="">Lưu
                </button>
            </div>
        </form>
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