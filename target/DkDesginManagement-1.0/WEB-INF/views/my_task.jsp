<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <title>Công việc của tôi</title>
</head>

<body>

<div id="header-include">
    <jsp:include page="header.jsp"/>
</div>
<div class="container_content body_page">
    <div id="nav-left-main">
        <jsp:include page="nav_left.jsp"/>
    </div>

    <div class="summary">

<<<<<<< HEAD
                </select></a>
            </div>
            <div class="list-task-head">
                <a class="project-detail" href="${pageContext.request.contextPath}/summary"><input type="button" value="Sơ lược"></a>
                <a class="list" href="${pageContext.request.contextPath}/Task/list_task"><input type="button" value="Danh sách"></a>
                <a class="calendar" href="${pageContext.request.contextPath}/calendar"><input type="button" value="Lịch"></a>
                <a class="customer-request" href="${pageContext.request.contextPath}/requirement"><input type="button"
                                                                       value="Yêu cầu của khách hàng"></a>
                <a class="project-progress" href="${pageContext.request.contextPath}/progress"><input type="button" value="Tiến độ"></a>
                <a class="project-member" href="${pageContext.request.contextPath}/member"><input type="button" value="Thành viên"></a>
                <a class="statistic" href="${pageContext.request.contextPath}/dashboard"><input type="button" value="Thống kê"></a>
            </div>
=======
        <div class="title" style="padding-top: 55px;">
            <h4>Công việc của tôi</h4>
>>>>>>> General
        </div>
        <div class="my-task-search">

            <div class="my-task-search-name" style="margin-right:10px ;">
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                       aria-expanded="false" style="border-radius: 50px;">
                        Tìm kiếm
                    </a>
                    <div class=" dropdown-menu">
                        <a class="dropdown-item" href="#">Tên công trình</a>
                        <a class=" dropdown-item" href="#">Thời gian</a>
                        <a class=" dropdown-item" href="#">Loại công trình</a>
                    </div>
                </div>
            </div>
            <div class="">
                <div class="function_search">
                    <form action="">
                        <div class="wap_search">
                            <input type="text" class="search_term"
                                   placeholder="   Tên công việc">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="table_content">
            <div class="">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Công việc</th>
                        <th scope="col">Thời gian bắt đầu</th>
                        <th scope="col">Thời gian dự kiến kết thúc</th>
                        <th scope="col">Tên công trình</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach begin="1" end="5">
                        <tr>
                            <td class="ten-va-link">
                                <div class="name-project">
                                    Biệt thự nhà dân Biệt thự nhà dân Biệt
                                    thự
                                    nhà dân Biệt thự nhà
                                    dân Biệt thự nhà dân Biệt thự nhà dân
                                </div>
                                <div style="text-align: right">
                                    <a href="" class="link">
                                        <button class="button-link">
                                            Chi tiết
                                        </button>
                                    </a>
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    20/11/2022
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    20/11/2022
                                </div>
                            </td>
                            <td>Biệt thự nhà dân</td>
                        </tr>
                    </c:forEach>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    Biệt thự nhà dân Biệt thự nhà dân Biệt--%>
                    <%--                                    thự--%>
                    <%--                                    nhà dân Biệt thự nhà--%>
                    <%--                                    dân Biệt thự nhà dân Biệt thự nhà dân--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>Biệt thự nhà dân</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    Biệt thự nhà dân Biệt thự nhà dân Biệt--%>
                    <%--                                    thự--%>
                    <%--                                    nhà dân Biệt thự nhà--%>
                    <%--                                    dân Biệt thự nhà dân Biệt thự nhà dân--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>Biệt thự nhà dân</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    Biệt thự nhà dân Biệt thự nhà dân Biệt--%>
                    <%--                                    thự--%>
                    <%--                                    nhà dân Biệt thự nhà--%>
                    <%--                                    dân Biệt thự nhà dân Biệt thự nhà dân--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>Biệt thự nhà dân</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    Biệt thự nhà dân Biệt thự nhà dân Biệt--%>
                    <%--                                    thự--%>
                    <%--                                    nhà dân Biệt thự nhà--%>
                    <%--                                    dân Biệt thự nhà dân Biệt thự nhà dân--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>Biệt thự nhà dân</td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    Biệt thự nhà dân Biệt thự nhà dân Biệt--%>
                    <%--                                    thự--%>
                    <%--                                    nhà dân Biệt thự nhà--%>
                    <%--                                    dân Biệt thự nhà dân Biệt thự nhà dân--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            <div class="name-input" style="width: 150px;">--%>
                    <%--                                <input class="form-control" formControlName="dob" type="datetime"--%>
                    <%--                                       value="20/11/2022">--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td>Biệt thự nhà dân</td>--%>
                    <%--                    </tr>--%>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<%--<script>--%>
<%--    $(function () {--%>
<%--        $("#header-include").load("header.html");--%>
<%--        $("#nav-left-main").load("nav-left.html");--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>