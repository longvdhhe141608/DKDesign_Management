<%--
  Created by IntelliJ IDEA.
  User: Huan
  Date: 10/10/2022
  Time: 09:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Nav-left</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css" />"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/"/>"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <div id="tab_menu" class="tab_menu">
        <div class="tab_element">
            <form action="homepage.jsp">
                <button class="tab_button" onclick="openCity('London')" autofocus>
                    <i class="fa-solid fa-house"></i> Trang chủ
                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="">
                <button class="tab_button" onclick="openCity('Paris')"><i class="fa-solid fa-briefcase"></i> Công
                    việc
                    của
                    tôi
                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="allProject.html">
                <button class="tab_button" onclick="openCity('Tokyo')"><i class="fa-solid fa-clipboard-list"></i>
                    Công
                    trình
                </button>
            </form>
        </div>
        <div class="tab_element">
            <form action="listtask.jsp">
                <button class="tab_button" onclick="openCity('Thongbao')"><i class="fa-solid fa-bell"></i> Thông
                    báo
                </button>
            </form>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
</html>