<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/calendar.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/bodyAdmin.js"/>"></script>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <jsp:include page="header.jsp"/>
    <!-- body -->
    <div class="body_page">
        <div class="nav-left">
            <jsp:include page="nav_left.jsp"/>
        </div>
        <div class="tab_content ">
            <div id="London" class="city">
                <div class="container-fluid">
                    <h2 style="margin-top: 50px;">Xin chào , ${sessionScope.loginUser.username}</h2>
                    <div class="main">
                        <%--Bảng công tình đang làm--%>
                        <div class="main-detail">
                            <h4>Công trình</h4>
                            <div class="main-detail-left">
                                <div class="card_list_project">
                                    <c:forEach items="${listProDoing}" var="i">
                                        <div class="card_project">
                                            <a href="${pageContext.request.contextPath}/design/project/summary?id=${i.id}"
                                               style="color: black; text-decoration: none">
                                                    ${i.projectName}
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                                <%--                                <table class=" table">--%>
                                <%--                                    <c:forEach items="${listProDoing}" var="i">--%>
                                <%--                                        <tr>--%>
                                <%--                                            <td class="left-main">--%>
                                <%--                                                    ${i.project_name}--%>
                                <%--                                            </td>--%>
                                <%--                                            <td class="left-main">--%>
                                <%--                                                    ${i.project_name}--%>
                                <%--                                            </td>--%>
                                <%--                                        </tr>--%>
                                <%--                                    </c:forEach>--%>
                                <%--                                </table>--%>
                            </div>
                        </div>
                        <%--Kết thúc bảng công trình đang làm--%>
                        <%--Bảng danh sách công việc--%>
                        <div class="main-detail">
                            <h4>Công việc của tôi</h4>
                            <div class="tab">
                                <button class="btn btn-secondary tablinks" onclick="openProject(event , 'project')">
                                    Đang làm
                                </button>
                                <button class="btn btn-secondary tablinks" onclick="openProject(event , 'overdue')">
                                    Quá hạn
                                </button>
                                <button class="btn btn-secondary tablinks" onclick="openProject(event , 'complete')">
                                    Hoàn thành
                                </button>
                            </div>
                            <div id="project" class="tabcontent">
                                <table class=" table ">
                                    <tr class=" right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 3</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 2</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 1</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                </table>
                            </div>
                            <div id="overdue" class="tabcontent" style="display: none">
                                <table class=" table ">
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 1</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 1</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 1</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 1</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 1</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 1</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                </table>
                            </div>
                            <div id="complete" class="tabcontent" style="display: none">
                                <table class=" table ">
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 2</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 2</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                    <tr class="right-detail">
                                        <a href="#" style="color: black; text-decoration: none">
                                            <td style="font-size: 20px;">Mặt bằng tầng 2</td>
                                            <td style="font-size: 20px;">03/09</td>
                                        </a>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer -->
<!-- <div class="footer_page"></div> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
</body>
</html>
