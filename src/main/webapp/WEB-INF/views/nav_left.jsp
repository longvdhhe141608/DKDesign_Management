<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Thanh Công Cụ Trái</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script>
        function sendRedirect(url) {
            window.location.href = url;
        }
    </script>
</head>
<body>

<%--role leader--%>
<c:if test="${loginUser.role_id == 2}">
    <%--    <div class="container-fluid" style="padding: 0">--%>
    <%--        <div id="tab_menu" class="tab_menu">--%>
    <%--            <button class="tab_button" class="tab_button">--%>
    <%--                <a href="${pageContext.request.contextPath}/headerHome">--%>
    <%--                    <i class="fa-solid fa-house"></i>--%>
    <%--                    Trang chủ--%>
    <%--                </a>--%>
    <%--            </button>--%>
    <%--            <button class="tab_button">--%>
    <%--                <a href="${pageContext.request.contextPath}/task/my_task">--%>
    <%--                    <i class="fa-solid fa-briefcase"></i>--%>
    <%--                    Công việc của tôi--%>
    <%--                </a>--%>
    <%--            </button>--%>
    <%--            <button class="tab_button">--%>
    <%--                <a href="${pageContext.request.contextPath}/allProject">--%>
    <%--                    <i class="fa-solid fa-clipboard-list"></i>--%>
    <%--                    Công trình--%>
    <%--                </a>--%>
    <%--            </button>--%>
    <%--            <button class="tab_button">--%>
    <%--                <a href="${pageContext.request.contextPath}/notification">--%>
    <%--                    <i class="fa-solid fa-bell"></i>--%>
    <%--                    Thông báo--%>
    <%--                </a>--%>
    <%--            </button>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <div class="container-fluid" style="padding: 0">
        <div id="tab_menu" class="tab_menu">
            <button onclick="sendRedirect('${pageContext.request.contextPath}/allProject')"
                    class="tab_button">
                <i class="fa-solid fa-clipboard-list"></i>
                Công trình
            </button>
            <button onclick="sendRedirect('${pageContext.request.contextPath}/task/my-task-for-leader')"
                    class="tab_button">
                <i class="fa-solid fa-briefcase"></i>
                Công việc của tôi
            </button>

            <button onclick="sendRedirect('${pageContext.request.contextPath}/notification')" class="tab_button">
                <i class="fa-solid fa-bell"></i>
                Thông báo
            </button>
        </div>
    </div>
</c:if>

<%--role admin--%>
<c:if test="${loginUser.role_id == 1}">
<div class="container-fluid" style="padding: 0">
    <div id="" class="tab_menu">
        <a href="${pageContext.request.contextPath}/admin/memberlist">
            <button class="tab_button">
                <i class="fa-solid fa-house"></i>Trang chủ
            </button>
        </a>
        <a href="${pageContext.request.contextPath}/notification">
            <button class="tab_button">
                <i class="fa-solid fa-bell"></i>Thông báo
            </button>
        </a>
    </div>
    </c:if>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
    </script>
</body>
</html>