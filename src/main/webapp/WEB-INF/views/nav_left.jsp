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
            <button onclick="sendRedirect('${pageContext.request.contextPath}/headerHome')" class="tab_button">
                <i class="fa-solid fa-house"></i>
                Trang chủ
            </button>
            <button onclick="sendRedirect('${pageContext.request.contextPath}/task/my_task')" class="tab_button">
                <i class="fa-solid fa-briefcase"></i>
                Công việc của tôi
            </button>
            <button onclick="sendRedirect('${pageContext.request.contextPath}/allProject')"
                    class="tab_button">
                <i class="fa-solid fa-clipboard-list"></i>
                Công trình
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
    <div id="tab_menu" class="tab_menu">
        <button class="tab_button">
            <a href="${pageContext.request.contextPath}/admin/memberlist">
                <i class="fa-solid fa-house"></i>
                Trang chủ
            </a>
        </button>

        <button class="tab_button">
            <a href="${pageContext.request.contextPath}/notification">
                <i class="fa-solid fa-bell"></i>
                Thông báo
            </a>
        </button>
    </div>
    </c:if>
</body>
</html>