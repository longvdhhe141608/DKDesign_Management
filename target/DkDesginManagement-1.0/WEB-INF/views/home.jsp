<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Trang chủ</title>
    <link href="<c:url value="/resources/assets/css/home.css" />" rel="stylesheet"/>
<body>
<%@include file="header.jsp" %>

<div class="home">
    <div class="nav-left">
        <%@include file="nav-left.jsp" %>
    </div>
    <div class="main">
        <h1>Xin chào, ${sessionScope.loginUser.nameAcc}</h1>
        <div class="main-table">
            <table class="main-table-tbn">

                <div class="main-table-left">
                    <tbody>
                    <tr>
                        <th colspan="2">
                            Công trình
                        </th>
                    </tr>
                    <tr>
                        <td><input type="button" name="icon" value="icon"></td>
                        <td><a href="${pageContext.request.contextPath}/logout">Biệt thự nhà dân</a></td>
                    </tr>
                    <tr>
                        <td><input type="button" name="icon" value="icon"> <img src="home.jsp" alt=""></td>
                        <td><a href="logout">Biệt thự nhà dân2</a></td>
                    </tr>
                    <tr>
                        <td><input type="button" name="icon" value="icon"></td>
                        <td><a href="${pageContext.request.contextPath}/logout">Biệt thự nhà dân3</a></td>
                    </tr>
                    </tbody>
                </div>
            </table>
            <div class="main-table-right">
                <table class="main-table-tbn">

                    <tbody>
                    <tr>
                        <th colspan="3">
                            Công việc của tôi
                        </th>
                    </tr>
                    <tr>
                        <td><a href="congviecchung.xxx">Công việc(3)</a></td>
                        <td><a href="quahan.xxx">Quá hạn(1)</a></td>
                        <td><a href="hoanthanh.xxx">Hoàn thành(5)</a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="matbang1.xxx">Mặt bằng tầng 1</a></td>
                        <td><a href="matbang1.xxx">03/09</a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="matbang2.xxx">Mặt bằng tầng 2</a></td>
                        <td><a href="matbang2.xxx">03/09</a></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="matbang3.xxx">Mặt bằng tầng 3</a></td>
                        <td><a href="matbang3.xxx">03/09</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</body>
</html>
