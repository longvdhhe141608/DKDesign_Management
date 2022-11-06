<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
</head>

<body>
<div class="container-fluid" style="padding: 0">
    <div id="tab_menu" class="tab_menu">

        <div class="tab_element">
            <form action="headerHome">

        <div class="tab_element">
            <form action="headerHome">


    <div id="tab_menu" class="tab_menu">

        <div class="tab_element">
            <a href="${pageContext.request.contextPath}/home">


                <button class="tab_button">
                    <i class="fa-solid fa-house"></i> Trang chủ
                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="my_task.jsp">
                <button class="tab_button"><i class="fa-solid fa-briefcase"></i> Công
                    việc
                    của
                    tôi




        <div class="tab_element">
            <a href="${pageContext.request.contextPath}/Task/my_task">
                <button class="tab_button">
                    <i class="fa-solid fa-briefcase">Công việc của tôi</i>

                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="allProject">
                <button class="tab_button"><i class="fa-solid fa-clipboard-list"></i>
                    Công
                    trình

        <div class="tab_element">
            <a href="${pageContext.request.contextPath}/allProject">
                <button class="tab_button">
                    <i class="fa-solid fa-clipboard-list">Công trình</i>


                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="list_task.jsp">
                <button class="tab_button"><i class="fa-solid fa-bell"></i> Thông
                    báo

        <div class="tab_element">
            <a action="${pageContext.request.contextPath}/Task/list_task">
                <button class="tab_button" onclick="openCity('Thongbao')">
                    <i class="fa-solid fa-bell">Thông báo</i>

                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
