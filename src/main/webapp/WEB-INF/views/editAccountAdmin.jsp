<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chỉnh sửa thông tin cá nhân</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/profile.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div style="margin-left: 20%;">
        <span style="font-size: 30px;"><a href="javascript:history.back()"><i class="fa-solid fa-chevron-left"></i></a>Chỉnh sửa thông tin cá nhân</span>

            <div class="information-main">
                <div class="information-main-avata">
                    <button type="button" class="avatar_change" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false" style="
                      border-radius: 50%;
                      background-color: white;
                      border: none;
                      outline: none;
                    ">
                        <img alt="" class="img_avatar_change" src="../image/a.jpg"/>
                    </button>
                </div>
                <div>
                    <form action="editAccount" method="post">
                    <table class="table table-borderless">
                        <p class="text-danger">${error}</p>
                        <tr>
                            <input name="id" type="number" value="${member.memberId}" hidden/>
                            <td><label>Họ và tên:</label></td>
                            <td>
                                <input name="name" type="text" value="${member.memberName}">
                            </td>
                        </tr>
                        <tr>
                            <td>Mã nhân viên:</td>
                            <td><input name="username" type="text" value="${member.memberCode}" readonly></td>
                        </tr>
                        <tr>
                            <td>Số CCCD/CMND:</td>
                            <td><input name="cccd" type="text" value="${member.memberCccd}"></td>
                        </tr>
                        <tr>
                            <td>Ngày sinh:</td>
                            <td>
                                <input type="date" name="dob" value="${member.memberDob}">
                            </td>
                        </tr>
                        <tr>
                            <td>Giới tính:</td>
                            <td><select name="gender" id="gender" required>
                                <option id="1" value="1">Nam</option>
                                <option id="2" value="2" ${member.memberGender==2?"selected":""}>Nữ</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td><input name="phone" type="text" value="${member.memberPhone}"></td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td><input name="mail" type="text" value="${member.memberMail}"></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ nhà:</td>
                            <td><input name="address" type="text" value="${member.memberAddress}"></td>
                        </tr>
                        <tr>
                            <td>Vai trò:</td>
                            <td>
                                <select id="role" name="role">
                                    <option id="leader" value="2">thiết kế</option>
                                    <option id="designer" value="1" ${member.memberRole==1?"selected":""}>trưởng nhóm
                                    </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Trạng thái:</td>
                            <td>
                                <select name="status" id="status">
                                    <option id="active" value="1">mở</option>
                                    <option id="blocked" value="2" ${member.memberStatus==2?"selected":""}>Chặn</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <div class="btn-edit">
                        <a href="javascript:history.back()">
                            <button class="btn btn-secondary" style="margin-right: 10px;">Hủy</button>
                        </a>
                        <input type="submit" value="Chỉnh sửa" class="btn btn-primary"/>
                    </div> </form>
                </div>
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