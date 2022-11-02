<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/calendar.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/bodyAdmin.js"/>"></script>
</head>

<body>
<div class="container-fluid" style="padding: 0;">
    <div class="header_page row " style="background-color: #383F51; ">
        <div class="header_right col-1">
            <div class="logo">
                <a href="">
                    <img src="assets/image/TMDKC.png" alt="">
                </a>
            </div>

        </div>
        <div class="header_left col-10">
            <div class="search_box">
                <form class="form-inline my-2 my-lg-0">
                    <input style="width: 30rem;" class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm"
                           aria-label="Search"/>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                        Tìm kiếm
                    </button>
                </form>
            </div>

        </div>
        <div class="col-1 header-right">
            <div class="account">
                <!-- Example single danger button -->
                <div class="btn-group">
                    <button type="button" class="avatar" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"
                            style="
                border-radius: 50%;
                background-color: white;
                border: none;
                outline: none;
              ">
                        <img class="img_avatar" src=""/>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/profile"><i class="fa-solid fa-user"></i> Thông tin cá nhân</a>
                        <a class="dropdown-item" href="#"><i class="fa-solid fa-key"></i> Đổi mật khẩu</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>

</html>