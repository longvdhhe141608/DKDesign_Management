<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

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
            <form action="headerHome.jsp">
                <button class="tab_button" onclick="openCity('London')" autofocus>
                    <i class="fa-solid fa-house"></i> Trang chủ
                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="my_task.jsp">
                <button class="tab_button" onclick="openCity('Paris')"><i class="fa-solid fa-briefcase"></i> Công
                    việc
                    của
                    tôi
                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="allProject.jsp">
                <button class="tab_button" onclick="openCity('Tokyo')"><i class="fa-solid fa-clipboard-list"></i>
                    Công
                    trình
                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="list_task.jsp">
                <button class="tab_button" onclick="openCity('Thongbao')"><i class="fa-solid fa-bell"></i> Thông
                    báo
                </button>
            </form>
        </div>
    </div>
</div>
</body>

</html>