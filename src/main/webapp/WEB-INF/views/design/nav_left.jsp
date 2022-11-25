<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <script>
        function sendRedirect(url) {
            window.location.href = url;
        }
    </script>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <div id="tab_menu" class="tab_menu">
        <button onclick="sendRedirect('${pageContext.request.contextPath}/design/home')" class="tab_button">
            <i class="fa-solid fa-house"></i>
            Trang chủ
        </button>
        <button onclick="sendRedirect('${pageContext.request.contextPath}/design/my-task')" class="tab_button">
            <i class="fa-solid fa-briefcase"></i>
            Công việc của tôi
        </button>
        <button onclick="sendRedirect('${pageContext.request.contextPath}/design/project/view-all-project')" class="tab_button">
            <i class="fa-solid fa-clipboard-list"></i>
            Công trình
        </button>
        <button onclick="sendRedirect('notification.html')" class="tab_button">
            <i class="fa-solid fa-bell"></i>
            Thông báo
        </button>
    </div>
</div>
</body>
</html>