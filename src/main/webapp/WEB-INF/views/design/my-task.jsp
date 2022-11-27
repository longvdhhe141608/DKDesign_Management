<%--&lt;%&ndash;<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ page contentType="text/html;charset=UTF-8" language="java" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!doctype html>&ndash;%&gt;--%>
<%--&lt;%&ndash;<html lang="en">&ndash;%&gt;--%>

<%--&lt;%&ndash;<head>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta charset="utf-8">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"&ndash;%&gt;--%>
<%--&lt;%&ndash;          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link rel="stylesheet" href="<c:url value="/resources/assets/css/all_project.css"/>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link rel="stylesheet" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link rel="stylesheet" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link rel="stylesheet" href="<c:url value="/resources/assets/css/summary.css"/>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <title>Tất cả công việc cá nhân</title>&ndash;%&gt;--%>
<%--&lt;%&ndash;</head>&ndash;%&gt;--%>
<%--&lt;%&ndash;<body>&ndash;%&gt;--%>
<%--&lt;%&ndash;<jsp:include page="header.jsp"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class=" body_page">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <jsp:include page="nav_left.jsp"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="summary  " style="margin-top: 20px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="title">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <h4>Tất cả công công việc cá nhân</h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="content-function">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div style="display: flex; justify-content: end; margin-bottom: 20px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="function-two" style="margin-right: 20px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="dropdown">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"&ndash;%&gt;--%>
<%--&lt;%&ndash;                           aria-expanded="false">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            Tìm kiếm&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="dropdown-menu">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <a class="dropdown-item" href="#">Biệt thự nhà dân</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <a class="dropdown-item" href="#">Biệt thự nhà dân 1</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <a class="dropdown-item" href="#">Biệt thự nhà dân 2</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="function-thir">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div class="function_search">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <form action="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="wap_search">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input style="margin-right: 10px;" type="text" class="search_term"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                       placeholder="tên công việc">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <button type="submit" class="btn btn-primary"> tìm kiếm</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </form>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="table_content">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class=" table-responsive-sm">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <table class="table table-bordered">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <th scope="col">Công việc phụ</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <th scope="col">Thời gian bắt đầu</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <th scope="col">Thời gian dự kiến kết thúc</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <th scope="col">Thời gian kết thúc</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <th scope="col">Tên công trình</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <th scope="col"></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:forEach begin="1" end="10">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <tr class="tung-hang">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <td class="tung-o">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="name-project">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    Đây là tên công việc&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="block-link">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="links">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <a href="#"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                           class="link-cong-viec">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <button class="btn-chi-tiet">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                Chi tiết&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="name-input" style="width: 150px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    20/10/2022&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="name-input" style="width: 150px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    20/10/2022&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="name-input" style="width: 150px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    20/11/2022&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <td> Đây là tên dự án chứa công việc này</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div style="display: flex; justify-content: space-between;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <button><i class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <form action="sub-task-Designer.html"&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                  style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    <tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td style="justify-content: center;">&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            <form class="form-name-project" action="sub-task.html">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div class="name-project">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    thiết kế phòng ngủ&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        tiết&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                    </button>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            </form>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/10/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            20/11/2022&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td> Biệt thự nhà dân</td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        <td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                            <div style="display: flex; justify-content: space-between;">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                <button><i&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                                        class="fa-regular fa-pen-to-square"></i></button>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                    &lt;%&ndash;                            </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                        </td>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    &lt;%&ndash;                    </tr>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </tbody>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </table>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="pagination" style="display: flex; justify-content: end;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <nav aria-label="Page navigation example">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <ul class="pagination">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li class="page-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <a class="page-link" href="#" aria-label="Previous">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span aria-hidden="true">&laquo;</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li class="page-item"><a class="page-link" href="#">1</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li class="page-item"><a class="page-link" href="#">2</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li class="page-item"><a class="page-link" href="#">3</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li class="page-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <a class="page-link" href="#" aria-label="Next">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span aria-hidden="true">&raquo;</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </nav>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"&ndash;%&gt;--%>
<%--&lt;%&ndash;        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"&ndash;%&gt;--%>
<%--&lt;%&ndash;        crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://code.jquery.com/jquery-3.3.1.js"&ndash;%&gt;--%>
<%--&lt;%&ndash;        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    // $(function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;    //     $("#header-include").load("header.html");&ndash;%&gt;--%>
<%--&lt;%&ndash;    //     $("#narbar_menu").load("nav-left.html");&ndash;%&gt;--%>
<%--&lt;%&ndash;    // });&ndash;%&gt;--%>
<%--&lt;%&ndash;    const show = document.querySelector("#show");&ndash;%&gt;--%>

<%--&lt;%&ndash;    const popup = document.querySelector(".popup");&ndash;%&gt;--%>
<%--&lt;%&ndash;    let close = document.querySelector('.close_popup');&ndash;%&gt;--%>
<%--&lt;%&ndash;    close.addEventListener('click', function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;        popup.classList.add("hide__popup");&ndash;%&gt;--%>
<%--&lt;%&ndash;    });&ndash;%&gt;--%>

<%--&lt;%&ndash;    show.addEventListener('click', function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;        popup.classList.remove("hide__popup");&ndash;%&gt;--%>
<%--&lt;%&ndash;    })&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8"/>--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>--%>
<%--    <title>Công việc cá nhân</title>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"--%>
<%--          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/task_detail.css"/>"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>--%>
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"--%>
<%--          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="--%>
<%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
<%--    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<jsp:include page="header.jsp"/>--%>
<%--<div class="body_page">--%>
<%--    <jsp:include page="nav_left.jsp"/>--%>


<%--        <div class="summary" style="margin-top: 20px;">--%>

<%--            <div class="title">--%>
<%--                <h4>Công việc cá nhân</h4>--%>
<%--            </div>--%>
<%--            <div class="table_content">--%>
<%--                <div class=" table-responsive-sm">--%>
<%--                    <table class="table table-bordered">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th scope="col">Công việc phụ</th>--%>

<%--                            <th scope="col">Thời gian bắt đầu</th>--%>
<%--                            <th scope="col">Thời gian dự kiến kết thúc</th>--%>
<%--                            <th scope="col">Thời gian kết thúc</th>--%>
<%--                            <th scope="col">Tên công trình</th>--%>

<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <c:forEach items="${myTask}" var="i">--%>
<%--                            <tr>--%>
<%--                                <td style="justify-content: center;">--%>

<%--                                    <form class="form-name-project" action="sub-task.html">--%>
<%--                                        <div class="name-project">--%>
<%--                                                ${i.subTaskName}--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <a class="btn btn-primary summary-detail-all " style="float: right;"--%>
<%--                                               href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${i.projectID}&section-id=${i.sectionID}&task-id=${i.taskID}&sub-task-id=${i.subTaskID}">--%>
<%--                                                <button class="btn btn-primary chi-tiet">Chi tiết</button>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                    </form>--%>

<%--                                </td>--%>

<%--                                <td>--%>
<%--                                        ${i.startDate}--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                        ${i.deadline}--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                        ${i.endDate}--%>
<%--                                </td>--%>
<%--                                <td> ${i.projectName}</td>--%>
<%--&lt;%&ndash;                                <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <c:if test="${i.status == 1}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <a href="${pageContext.request.contextPath}/design/sub-task/view-edit-sub-task?project-id=${i.projectID}&section-id=${i.sectionID}&task-id=${i.taskID}&sub-task-id=${i.subTaskID}"><i&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                class="fa-regular fa-pen-to-square"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </td>&ndash;%&gt;--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>

<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--                <div class="pagination" style="display: flex;justify-content: end">--%>
<%--                    <nav aria-label="Page navigation example">--%>
<%--                        <ul class="pagination justify-content-end">--%>
<%--                            <c:forEach items="${lsPage}" var="page">--%>
<%--                                <li class="page-item ${requestScope.page == page ? "active" : ""}">--%>
<%--                                    <a class="page-link"--%>
<%--                                       href="${pageContext.request.contextPath}/design/">${page}</a>--%>
<%--                                </li>--%>
<%--                            </c:forEach>--%>
<%--                        </ul>--%>
<%--                    </nav>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--</div>--%>

<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"--%>
<%--        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://code.jquery.com/jquery-3.3.1.js"--%>
<%--        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">--%>
<%--</script>--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    const show = document.querySelector("#show-member");&ndash;%&gt;--%>

<%--&lt;%&ndash;    const popup = document.querySelector(".popup");&ndash;%&gt;--%>
<%--&lt;%&ndash;    let close = document.querySelector('.close_popup');&ndash;%&gt;--%>
<%--&lt;%&ndash;    close.addEventListener('click', function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;        popup.classList.add("hide__popup");&ndash;%&gt;--%>
<%--&lt;%&ndash;    });&ndash;%&gt;--%>

<%--&lt;%&ndash;    show.addEventListener('click', function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;        popup.classList.remove("hide__popup");&ndash;%&gt;--%>
<%--&lt;%&ndash;    })&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
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
    <title>Công việc cá nhân</title>
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


    <div class="summary" style="margin-top: 20px;">

        <div class="title">
            <h4>Công việc cá nhân</h4>
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

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${myTask}" var="i">
                        <tr style="color: ${(i.startDate <= nowDate && i.deadline >= nowDate ? "#32c107dd" : "red"
                         || i.status == 4 ? "#a2a3a2dd" : ""
                         || nowDate == i.startDate ? "#32c107dd" : "")}">
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
                                <%--                                <td>--%>
                                <%--                                    <c:if test="${i.status == 1}">--%>
                                <%--                                        <a href="${pageContext.request.contextPath}/design/sub-task/view-edit-sub-task?project-id=${i.projectID}&section-id=${i.sectionID}&task-id=${i.taskID}&sub-task-id=${i.subTaskID}"><i--%>
                                <%--                                                class="fa-regular fa-pen-to-square"></i></a>--%>
                                <%--                                    </c:if>--%>
                                <%--                                </td>--%>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <div class="pagination" style="display: flex;justify-content: end">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <c:forEach items="${lsPage}" var="page">
                            <li class="page-item ${requestScope.page == page ? "active" : ""}">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/design/my-task?pageNo=${page}">${page}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
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