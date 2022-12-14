<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Duyệt Công Việc</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="list-task body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary ">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>

                <form style="display: flex;" action="${pageContext.request.contextPath}/project/change-status" method="post">
                    <input type="text" name="projectId" value="${project.id}" hidden="">
                    <div class="btn project-detail" style="margin: 0; padding: 0px 6px 0px 10px;">
                        <select name="statusId" class="btn btn-secondary dropdown-toggle" style="padding-bottom: 10px">
                            <c:forEach items="${listStatus}" var="status">
                                <option value="${status.id}" ${status.id== project.status ? 'selected' : ''} > ${status.statusProject}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <c:if test="${sessionScope.loginUser.role_id == 2}">
                            <c:if test="${project.status != 3 }">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </c:if>
                            <c:if test="${project.status == 3 }">
                                <button type="submit" class="btn btn-primary" disabled >Lưu</button>
                            </c:if>
                        </c:if>
                    </div>
                </form>

            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                        class="btn btn-secondary " type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        style="background: blue;" value="Duyệt công việc"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/requirement/requirement-for-leader?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           value="Yêu cầu của khách hàng">
                </a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/project/member?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <div class="plan">
            <div class="title">
                <h4>Phê duyệt công việc</h4>
            </div>
            <div class="my-task-search">
                <form action="plan_approval" method="get" style="display: flex" >
                    <input hidden name="id" value="${projectId}" >
<%--                <div class="my-task-search-name" style="margin-right:10px ;">--%>
<%--                    <div class="dropdown">--%>
<%--                            <select style="height: 38px" name="accountId" class="btn btn-secondary dropdown-toggle">--%>
<%--                                <option value=""> Tất cả</option>--%>
<%--                                <c:forEach items="${listAccount}" var="account">--%>
<%--                                    <option value="${account.id}" ${account.id== accountId ? 'selected' : ''} > ${account.username}</option>--%>
<%--                                </c:forEach>--%>
<%--                            </select>--%>
<%--                    </div>--%>

<%--                </div>--%>
                <div class="">
                    <div class="function_search">

                            <div class="wap_search">
                                <input style="margin-right: 10px;" type="text" name="name" class="search_term"
                                      value="${name}" placeholder="Tên công việc">
                                <button type="submit" class="btn btn-primary"> Tìm kiếm</button>
                            </div>

                    </div>
                </div>
                </form>
            </div>
            <div class="table_content">
                <div class="">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col" class="col-4">Công việc</th>
                            <th scope="col" class="col-1">Người thực hiện</th>
                            <th scope="col" class="col-1">Thời gian bắt đầu</th>
                            <th scope="col" class="col-1">Thời gian dự kiến kết thúc</th>
                            <th scope="col" class="col-1">Số lượng file</th>
                            <th scope="col" class="col-1">Phê duyệt</th>
                            <th scope="col" class="col-2">Ghi chú</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listTask}" var="task">
                            <tr>
                                <td style="justify-content: center;">
                                    <form class="form-name-project" action="">
                                        <div class="name-project">
                                                ${task.taskName}
                                        </div>
                                    </form>
                                </td>
                                <td>${task.assignToName}</td>
                                <td>
                                    <div class="name-input" >
                                        <fmt:formatDate value="${task.startDate}" var="std" pattern="dd/MM/yyyy"/>
                                            ${std}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input" >
                                        <fmt:formatDate value="${task.deadline}" var="dl" pattern="dd/MM/yyyy"/>
                                            ${dl}
                                    </div>
                                </td>
                                <td>${task.fileNumber}</td>

                                <td >
                                    <div style="display: flex;justify-content: space-between;">
                                    <c:if test="${project.status == 1}">
                                    <c:if test="${task.taskStatus == 1}">
                                    <a href="plan_approval/agree?taskId=${task.taskId}">
                                        <button
                                                class="btn btn-primary">Đồng ý
                                        </button>
                                    </a>
                                    <form action="plan_approval/cancel" method="post">
                                        <input hidden type="text" name="taskId" value="${task.taskId}">
                                        <button class="btn btn-secondary">Hủy bỏ</button>
                                        </c:if>

                                        <c:if test="${task.taskStatus == 5}">Đã hủy bỏ</c:if>

                                        </c:if>
                                    </div>
                                </td>
                                <td>
                                    <c:if test="${task.taskStatus == 1}">
                                        <input required name="description" type="text">
                                    </c:if>
                                    <c:if test="${task.taskStatus == 5}">
                                        ${task.description}
                                    </c:if>
                                </td>
                                </form>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="pagination">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${page != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="plan_approval?id=${projectId}&page=${page-1}&name=${name}&accountId=${accountId}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a class="page-link"
                                                         href="plan_approval?id=${projectId}&page=${i}&name=${name}&accountId=${accountId}">${i}</a></li>
                            </c:forEach>

                            <c:if test="${page != endPage}">
                                <li class="page-item">
                                    <a class="page-link" href="plan_approval?id=${projectId}&page=${page+1}&name=${name}&accountId=${accountId}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
<script>
    var mess = '${mess}'
    if (mess != '') {
        alert(mess);
    }
</script>
</body>

</html>