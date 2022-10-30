<%--
  Created by IntelliJ IDEA.
  User: Huan
  Date: 17/10/2022
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/" />"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src=""></script>
</head>

<body>

<%@include file="NavLeft.jsp" %>

<div class="summary">
    <div class="top">
        <div class="list-top">
            <h1>Biệt thự nhà dân</h1>
            <a class="project-detail"><input type="button" value="trạng thái"><i
                    class="fa-solid fa-angle-down"></i></a>
        </div>
        <div class="list-task-head">
            <a class="project-detail"><input type="button" value="Sơ lược"></a>
            <a class="list"><input type="button" value="Danh sách"></a>
            <a class="calendar"><input type="button" value="Lịch"></a>
            <a class="customer-request"><input type="button" value="Yêu cầu của khách hàng"></a>
            <a class="project-progress"><input type="button" value="Tiến độ"></a>
            <a class="project-member"><input type="button" value="Thành viên"></a>
            <a class="statistic"><input type="button" value="Thống kê"></a>
        </div>
    </div>
    <div class="summary-main">
        <div class="main-Quickview">
            <table class="table table-borderless">
                <tr>
                    <td>
                        <h4>Sơ lược công trình</h4>
                    </td>
                    <td>
                        <button class="btn-update">Cập nhật</button>
                    </td>
                </tr>
                <tr>
                    <td>Chủ nhà:</td>
                    <td>Nguyễn Văn A</td>
                </tr>
                <tr>
                    <td>Số điện thoại:</td>
                    <td>0123345678</td>
                </tr>
                <tr>
                    <td>Địa chỉ công trình:</td>
                    <td>xóm 1, thôn tân xã,huyện thạch thất, hà nội</td>
                </tr>
                <tr>
                    <td>Loại công trình:</td>
                    <td>Ngoại thất</td>
                </tr>
                <tr>
                    <td>Diện tích xây dựng:</td>
                    <td>500m2</td>
                </tr>
                <tr>
                    <td>Thời gian hoàn thành:</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>Địa chỉ công trình:</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>Mô tả:</td>
                    <td>-</td>
                </tr>
            </table>
        </div>

        <div class="main-file">
            <a>Hồ sơ thi công</a>
            <a><i class="fa-solid fa-paperclip"></i></a>
        </div>
        <div class="main-file">
            <a>Hình vẽ 3D </a>
            <a><i class="fa-solid fa-paperclip"></i></a>
        </div>
        <form>
            Hồ sơ thi công <input type="file" id="user_picture" onchange="update_image()">
        </form>

        <div id="meme_picture"><img src="" height="200" width="300"></div>

    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>