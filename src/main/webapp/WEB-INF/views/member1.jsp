<%--
  Created by IntelliJ IDEA.
  User: Huan
  Date: 17/10/2022
  Time: 09:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thành viên dự án</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="list-task">
    <div class="nav-left">
        <%@include file="nav-left.jsp" %>
    </div>
    <div class="list-task-detail">
        <div class="list-top">
            <h1>Biệt thự nhà dân</h1>
            <a class="project-detail"><input type="button" value="trạng thái "></a>
        </div>
        <div class="list-task-head">
            <a class="project-detail"><input type="button" value="Chi tiết dự án"></a>
            <a class="list"><input type="button" value="Lịch"></a>
            <a class="calendar"><input type="button" value="Danh sách"></a>
            <a class="customer-request"><input type="button" value="Thành viên dự án"></a>
            <a class="project-progress"><input type="button" value="Tiến độ"></a>
            <a class="project-member"><input type="button" value="Thành viên dự án"></a>
            <a class="statistic"><input type="button" value="Thống kê"></a>
        </div>

        <div class="top">
            <div class="add-task">
                <input type="button" name="add" value="+ Thêm thành viên">
            </div>
        </div>

        <table class="table-task">
            <tr class="list-task-top">
                <th class="list-task-top-detail">Tên</th>
                <th class="list-task-top-detail">Chức danh</th>
                <th class="list-task-top-detail">Số điện thoại</th>
                <th class="list-task-top-detail">Email</th>
                <th>Địa chỉ</th>
                <th>Trạng thái</th>
            </tr>

            <tr>
                <td>Nguyễn Như Huấn</td>
                <td>trưởng nhóm</td>
                <td>0332000229</td>
                <td>huannnhe141550@fpt.edu.vn</td>
                <td>Chương Mỹ, Hà Nội</td>
                <td>mở</td>
            </tr>
            <tr>
                <td>Nguyễn Như Huấn</td>
                <td>trưởng nhóm</td>
                <td>0332000229</td>
                <td>huannnhe141550@fpt.edu.vn</td>
                <td>Chương Mỹ, Hà Nội</td>
                <td>mở</td>
            </tr>
            <tr>
                <td>Nguyễn Như Huấn</td>
                <td>trưởng nhóm</td>
                <td>0332000229</td>
                <td>huannnhe141550@fpt.edu.vn</td>
                <td>Chương Mỹ, Hà Nội</td>
                <td>mở</td>
            </tr>
            <tr>
                <td>Nguyễn Như Huấn</td>
                <td>trưởng nhóm</td>
                <td>0332000229</td>
                <td>huannnhe141550@fpt.edu.vn</td>
                <td>Chương Mỹ, Hà Nội</td>
                <td>mở</td>
            </tr>
            <tr>
                <td>Nguyễn Như Huấn</td>
                <td>trưởng nhóm</td>
                <td>0332000229</td>
                <td>huannnhe141550@fpt.edu.vn</td>
                <td>Chương Mỹ, Hà Nội</td>
                <td>mở</td>
            </tr>
            <tr>
                <td>Nguyễn Như Huấn</td>
                <td>trưởng nhóm</td>
                <td>0332000229</td>
                <td>huannnhe141550@fpt.edu.vn</td>
                <td>Chương Mỹ, Hà Nội</td>
                <td>mở</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>