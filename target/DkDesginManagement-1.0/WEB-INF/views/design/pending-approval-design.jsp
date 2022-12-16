<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chờ Duyệt Công Việc</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/requirement.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/design/header.jsp"/>
<div class="body_page">
    <jsp:include page="/WEB-INF/views/design/nav_left.jsp"/>
    <div class="requiment summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <%--                    <select style="border: none; padding: 6px;">--%>
                    <%--                        <option class="btn btn-secondary">Đang thực hiện</option>--%>
                    <%--                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>--%>
                    <%--                    </select>--%>
                </div>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/design/project/summary?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                <%--                <c:if test="${pageContext.page==summary.jsp}">--%>

                <%--                </c:if>--%>
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Công việc"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        style="background: blue"
                        value="Trạng thái"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/project/member-active?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/dashboard?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <div>
            <h4>Trạng thái công việc</h4>
            <div class="my-task-search">
                <form style="display: flex"
                      action="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task">
                    <div class="my-task-search-name" style="margin-right:10px ;">
                        <div class="dropdown">
                            <select style="height: 38px" class="btn btn-secondary dropdown-toggle"
                                    name="status">
                                <option ${status == 0 ? "selected": ""} value="0">Tất cả</option>
                                <c:forEach items="${statusList}" var="i">
                                    <option ${status == i.id ? "selected": ""} value="${i.id}">${i.statusTask}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="">
                        <div class="function_search">
                            <form action="">
                                <div class="wap_search">

                                    <input style="margin-right: 10px;" type="text" class="search_term"
                                           placeholder="Tên công việc" name="textSearch" value="${textSearch}">
                                    <input style="margin-right: 10px;" type="text" class="search_term"
                                           placeholder="Tên công việc" name="project-id" hidden value="${project.id}">
                                    <button type="submit" class="btn btn-primary"> Tìm kiếm</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <div>
            <table class="table table-bordered">
                <tr>
                    <th scope="col" style="width: 30%">Công việc</th>
                    <th scope="col" style="width: 10%">Người thực hiện</th>
                    <th scope="col" style="width: 10%">Ngày bắt đầu</th>
                    <th scope="col" style="width: 10%">Ngày dự kiến kết thúc</th>
                    <th scope="col" style="width: 5%">Số lượng fie:</th>
                    <th scope="col" style="width: 15%">Phê duyệt</th>
                    <th scope="col" style="width: 20%">Ghi chú</th>
                </tr>
                <c:forEach items="${waitDtoList}" var="i">

                    <tr>
                        <td>
                            <div style="display: flex;justify-content: space-between;">
                               <div class="col-8">
                                       ${i.taskName}
                               </div>
                            <div class="col-4">
                                <a>
                                <button class="chi-tiet">Chi tiết</button>
                                </a>
                            </div>
                            </div>
                        </td>
                        <td>${i.username}</td>
                        <td>
                                ${i.startDate}
                        </td>
                        <td>
                                ${i.endDate}
                        </td>
                        <td>
                                ${i.numberOfFile}
                        </td>
                        <td>
                            <c:if test="${i.status == 1}">
                                <div class="alert alert-secondary" role="alert" style="width: 150px;">
                                    <h2 style="color:#383d41; font-size: 15px; margin: 0; padding: 0;">${i.statusTask}</h2>
                                </div>
                            </c:if>
                            <c:if test="${i.status == 2}">
                                <div class="alert alert-success" role="alert" style="width: 150px;">
                                    <h2 style="color:#0f5132;font-size: 15px; margin: 0; padding: 0;">${i.statusTask}</h2>
                                </div>
                            </c:if>
                            <c:if test="${i.status == 3}">
                                <div class="alert alert-warning" role="alert" style="width: 150px;">
                                    <h2 style="color:#664d03;font-size: 15px; margin: 0; padding: 0;">${i.statusTask}</h2>
                                </div>
                            </c:if>
                            <c:if test="${i.status == 4}">
                                <div class="alert alert-info" role="alert" style="width: 150px;">
                                    <h2 style="color:#055160;font-size: 15px; margin: 0; padding: 0;">${i.statusTask}</h2>
                                </div>
                            </c:if>
                            <c:if test="${i.status == 5}">
                                <div class="alert alert-danger" role="alert" style="width: 150px;">
                                    <h2 style="color:#842029;font-size: 15px; margin: 0; padding: 0;">${i.statusTask}</h2>
                                </div>
                            </c:if>
                        </td>
                        <td>${i.description}</td>
                    </tr>
                </c:forEach>

            </table>
        </div>
        <div class="pagination">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <c:forEach items="${requestScope.lsPage}" var="page">
                        <li class="page-item ${requestScope.page == page ? "active" : ""}">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task?project-id=${project.id}&pageNo=${page}&status=${status}&textSearch=${textSearch}">${page}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%--<div class="popup hide__popup">--%>
<%--    <div class="popup__content">--%>
<%--        <div class="title">--%>
<%--            <h4>Thêm yêu cầu của khách hàng</h4>--%>
<%--        </div>--%>
<%--        <div class="info">--%>
<%--            <table class="table table-borderless">--%>
<%--                <tr>--%>
<%--                    <td>Vị trí:</td>--%>
<%--                    <td><input class="info-text" type="text" style="width: 500px;"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Yêu cầu:</td>--%>
<%--                    <td><textarea class="info-text" type="texta" style="width: 500px;"></textarea>--%>
<%--                </tr>--%>

<%--            </table>--%>


<%--        </div>--%>
<%--        <div class="button_click">--%>
<%--            <div></div>--%>
<%--            <div class="btn_cancel">--%>
<%--                <button type="button" class="btn btn-secondary close_popup">Hủy--%>
<%--                    bỏ--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="btn_ok">--%>
<%--                <button type="button" class="btn btn-primary">Lưu</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<script>
    const show = document.querySelector("#show-member");

    const popup = document.querySelector(".popup");
    let close = document.querySelector('.close_popup');
    close.addEventListener('click', function () {
        popup.classList.add("hide__popup");
    });

    show.addEventListener('click', function () {
        popup.classList.remove("hide__popup");
    })
</script>


</body>

</html>