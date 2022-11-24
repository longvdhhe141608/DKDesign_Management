<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!doctype html>--%>
<%--<html lang="en">--%>

<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"--%>
<%--          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="<c:url value="/resources/assets/css/all_project.css"/>"/>--%>
<%--    <link rel="stylesheet" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>--%>
<%--    <link rel="stylesheet" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>--%>
<%--    <link rel="stylesheet" href="<c:url value="/resources/assets/css/summary.css"/>"/>--%>
<%--    <title>Tất cả công việc cá nhân</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<jsp:include page="header.jsp"/>--%>
<%--<div class=" body_page">--%>
<%--    <jsp:include page="nav_left.jsp"/>--%>
<%--    <div class="summary  " style="margin-top: 20px;">--%>
<%--        <div class="title">--%>
<%--            <h4>Tất cả công công việc cá nhân</h4>--%>
<%--        </div>--%>
<%--        <div class="content-function">--%>
<%--            <div style="display: flex; justify-content: end; margin-bottom: 20px;">--%>
<%--                <div class="function-two" style="margin-right: 20px;">--%>
<%--                    <div class="dropdown">--%>
<%--                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"--%>
<%--                           aria-expanded="false">--%>
<%--                            Tìm kiếm--%>
<%--                        </a>--%>
<%--                        <div class="dropdown-menu">--%>
<%--                            <a class="dropdown-item" href="#">Biệt thự nhà dân</a>--%>
<%--                            <a class="dropdown-item" href="#">Biệt thự nhà dân 1</a>--%>
<%--                            <a class="dropdown-item" href="#">Biệt thự nhà dân 2</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="function-thir">--%>
<%--                    <div class="function_search">--%>
<%--                        <form action="">--%>
<%--                            <div class="wap_search">--%>
<%--                                <input style="margin-right: 10px;" type="text" class="search_term"--%>
<%--                                       placeholder="tên công việc">--%>
<%--                                <button type="submit" class="btn btn-primary"> tìm kiếm</button>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="table_content">--%>
<%--            <div class=" table-responsive-sm">--%>
<%--                <table class="table table-bordered">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th scope="col">Công việc phụ</th>--%>
<%--                        <th scope="col">Thời gian bắt đầu</th>--%>
<%--                        <th scope="col">Thời gian dự kiến kết thúc</th>--%>
<%--                        <th scope="col">Thời gian kết thúc</th>--%>
<%--                        <th scope="col">Tên công trình</th>--%>
<%--                        <th scope="col"></th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach begin="1" end="10">--%>
<%--                        <tr class="tung-hang">--%>
<%--                            <td class="tung-o">--%>
<%--                                <div class="name-project">--%>
<%--                                    Đây là tên công việc--%>
<%--                                </div>--%>
<%--                                <div class="block-link">--%>
<%--                                    <div></div>--%>
<%--                                    <div class="links">--%>
<%--                                        <a href="#"--%>
<%--                                           class="link-cong-viec">--%>
<%--                                            <button class="btn-chi-tiet">--%>
<%--                                                Chi tiết--%>
<%--                                            </button>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <div class="name-input" style="width: 150px;">--%>
<%--                                    20/10/2022--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <div class="name-input" style="width: 150px;">--%>
<%--                                    20/10/2022--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                <div class="name-input" style="width: 150px;">--%>
<%--                                    20/11/2022--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                            <td> Đây là tên dự án chứa công việc này</td>--%>
<%--                            <td>--%>
<%--                                <div style="display: flex; justify-content: space-between;">--%>
<%--                                    <button><i class="fa-regular fa-pen-to-square"></i></button>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <form action="sub-task-Designer.html"&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                  style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        tiết&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                    </button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            </form>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        <td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                <button><i&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        </td>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--            <div class="pagination" style="display: flex; justify-content: end;">--%>
<%--                <nav aria-label="Page navigation example">--%>
<%--                    <ul class="pagination">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#" aria-label="Previous">--%>
<%--                                <span aria-hidden="true">&laquo;</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#" aria-label="Next">--%>
<%--                                <span aria-hidden="true">&raquo;</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </nav>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"--%>
<%--        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://code.jquery.com/jquery-3.3.1.js"--%>
<%--        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">--%>
<%--</script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>--%>
<%--<script>--%>
<%--    // $(function () {--%>
<%--    //     $("#header-include").load("header.html");--%>
<%--    //     $("#narbar_menu").load("nav-left.html");--%>
<%--    // });--%>
<%--    const show = document.querySelector("#show");--%>

<%--    const popup = document.querySelector(".popup");--%>
<%--    let close = document.querySelector('.close_popup');--%>
<%--    close.addEventListener('click', function () {--%>
<%--        popup.classList.add("hide__popup");--%>
<%--    });--%>

<%--    show.addEventListener('click', function () {--%>
<%--        popup.classList.remove("hide__popup");--%>
<%--    })--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/task_detail.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class=" body_page">
        <div id="narbar_menu"></div>
        <div class="summary  " style="margin-top: 20px;">

            <div class="title">
                <h4>Tất cả công công việc cá nhân</h4>
            </div>
            <div class="table_content">
                <div class=" table-responsive-sm">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Công việc phụ</th>

                            <th scope="col">Thời gian bắt đầu</th>
                            <th scope="col">Thời gian dự kiến kết thúc</th>
                            <th scope="col">Thời gian kết thúc</th>
                            <th scope="col">Tên công trình</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${myTask}" var="i">
                            <tr>
                                <td style="justify-content: center;">

                                    <form class="form-name-project" action="sub-task.html">
                                        <div class="name-project">
                                                ${i.subTaskName}
                                        </div>
                                        <div>
                                            <a class="btn btn-primary summary-detail-all" style="float: right;"
                                               href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${i.projectID}&section-id=${i.sectionID}&task-id=${i.taskID}&sub-task-id=${i.subTaskID}">Chi
                                                tiết
                                            </a>
                                        </div>
                                    </form>

                                </td>

                                <td>
                                        ${i.startDate}
                                </td>
                                <td>
                                        ${i.deadline}
                                </td>
                                <td>
                                        ${i.endDate}
                                </td>
                                <td> ${i.projectName}</td>
                                <td>
                                    <c:if test="${i.status == 1}">
                                        <a href="${pageContext.request.contextPath}/design/sub-task/view-edit-sub-task?project-id=${i.projectID}&section-id=${i.sectionID}&task-id=${i.taskID}&sub-task-id=${i.subTaskID}"><i
                                                class="fa-regular fa-pen-to-square"></i></a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            <c:forEach items="${lsPage}" var="page">
                                <li class="page-item ${requestScope.page == page ? "active" : ""}">
                                    <a class="page-link"
                                       href="${pageContext.request.contextPath}/design/">${page}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<%--<script>--%>
<%--    const show = document.querySelector("#show-member");--%>

<%--    const popup = document.querySelector(".popup");--%>
<%--    let close = document.querySelector('.close_popup');--%>
<%--    close.addEventListener('click', function () {--%>
<%--        popup.classList.add("hide__popup");--%>
<%--    });--%>

<%--    show.addEventListener('click', function () {--%>
<%--        popup.classList.remove("hide__popup");--%>
<%--    })--%>
<%--</script>--%>
</body>
</html>