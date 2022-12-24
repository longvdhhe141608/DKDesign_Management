<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Công Việc Cá Nhân</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/task_detail.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/design/header.jsp"/>
<div class="body_page">
    <jsp:include page="/WEB-INF/views/design/nav_left.jsp"/>


    <div class="summary" style="margin-top: 20px;">

        <div class="title">
            <h4>Công việc cá nhân</h4>
        </div>
        <div class="table_content">
            <div class=" table-responsive-sm">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col" class="col-4">Công việc phụ</th>

                        <th scope="col" class="col-2">Thời gian bắt đầu</th>
                        <th scope="col" class="col-2">Thời gian dự kiến kết thúc</th>
                        <th scope="col" class="col-2">Thời gian kết thúc</th>
                        <th scope="col" class="col-2">Tên công trình</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${myTask}" var="i">
                        <tr style="color: ${(i.startDate <= nowDate && i.deadline >= nowDate ? "#32c107dd" : "red"
                         || i.status == 4 ? "#a2a3a2dd" : ""
                         || nowDate == i.startDate ? "#32c107dd" : "")}">
                            <td style="display: flex; justify-content: space-between;">

                                    <div class="name-project col-8">
                                            ${i.subTaskName}
                                    </div>
                                    <div class="col-4">
                                        <a
                                           href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${i.projectID}&section-id=${i.sectionID}&task-id=${i.taskID}&sub-task-id=${i.subTaskID}">
                                            <button class="summary-detail-all" >
                                                Chi tiết
                                            </button>
                                        </a>
                                    </div>

                            </td>

                            <td>
                                <fmt:formatDate value="${i.startDate}" var="std" pattern="dd/MM/yyyy"/>
                                    ${std}
                            </td>
                            <td>
                                <fmt:formatDate value="${i.deadline}" var="dl" pattern="dd/MM/yyyy"/>
                                    ${dl}
                            </td>
                            <td>
                                <fmt:formatDate value="${i.endDate}" var="ed" pattern="dd/MM/yyyy"/>
                                    ${ed}
                            </td>
                            <td> ${i.projectName}</td>
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


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
</body>
</html>