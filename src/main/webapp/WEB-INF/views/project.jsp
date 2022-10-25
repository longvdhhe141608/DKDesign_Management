<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Công trình</title>
    <link href="<c:url value="/resources/assets/css/project.css" />" rel="stylesheet" />
</head>
<body>
<%@include file="header.jsp" %>
<div class="project">
    <div class="">
        <%@include file="nav-left.jsp" %>
    </div>
    <div class="project-main">
        <h1>Tất cả công trình</h1>

        <div class="top">
            <div class="add-congtrinh">
                <input type="button" name="add" value="+ Thêm công trình"></br>
            </div>
            <div class="top-right">
                <div class="select-year">
                    <select name="year" id="year">
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022" selected>2022</option>
                    </select>
                </div>
                <div class="search-congtrinh">

                    <input type="text" id="search" name="search" placeholder="Tìm Kiếm">
                    <button>Search</button>
                </div>
            </div>
        </div>

        <div class="table">
            <table class="table-congtrinh">
                <tr>
                    <th></th>
                    <th>Công trình</th>
                    <th>Loại công trình</th>
                    <th>Thời gian bắt đầu</th>
                    <th>Trạng thái</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Biệt thự nhà dân</td>
                    <td>Ngoại thất</td>
                    <td>05/05/2022</td>
                    <td>Đang thực hiện</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Biệt thự nhà dân</td>
                    <td>Ngoại thất</td>
                    <td>05/05/2022</td>
                    <td>Đang thực hiện</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Biệt thự nhà dân</td>
                    <td>Ngoại thất</td>
                    <td>05/05/2022</td>
                    <td>Đang thực hiện</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Biệt thự nhà dân</td>
                    <td>Ngoại thất</td>
                    <td>05/05/2022</td>
                    <td>Đang thực hiện</td>
                </tr>
            </table>

            <div class="phantrang">
                <a href=""><</a>
                <a href="">1</a>
                <a href="">2</a>
                <a href="">></a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
