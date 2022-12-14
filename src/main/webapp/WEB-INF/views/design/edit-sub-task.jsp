<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chỉnh Sửa Công Việc Phụ</title>
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
    <script src="<c:url value="/resources/assets/js/edit-subtask.js"/>"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/design/header.jsp"/>
<div class="body_page">
    <jsp:include page="/WEB-INF/views/design/nav_left.jsp"/>
    <div class="summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/design/project/summary?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        style="background: blue"
                        value="Công việc"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
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
        <div class="task-details-main">
            <form id="add-project1" action="${pageContext.request.contextPath}/design/sub-task/edit-sub-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}"
                  method="post">
                <div>
                <h4>
                    <input type="text" class=" info-text" id="exampleFormControlInput1"
                           value="${subTask.taskName}" name="sub-task-name">
                    <div class="text-danger error"></div>
                </h4>
                </div>
                <div style="font-size: 20px;">
                    <a href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}">${project.projectName}
                        > </a>
                    <a href="${pageContext.request.contextPath}/design/task/view-detail-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}">${tasks.taskName}
                        > </a>
                    <a href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}">${subTask.taskName}
                        > </a>
                </div>
                <table class="table table-borderless" style="border: 0;">
                    <tr>
                        <td class="col-6">Nhiệm vụ:</td>
                        <td class="col-6">${subTask.nameEmployee}</td>
                    </tr>
                    <tr>
                        <td>Công trình:</td>
                        <td>${project.projectName}</td>
                    </tr>
                    <tr>
                        <td>Đầu mục công việc:</td>
                        <td>${section.sectionName}</td>
                    </tr>
                    <tr>
                        <td>Thời gian bắt đầu:</td>
                        <td>
                            <div class="name-input " >
                                <input id="inputstartdate" class=" info-text" formControlName="dob" type="date" style="width: 150px"
                                       value="${subTask.startingDate}" name="start-date">
                            </div>
                            <div class="text-danger error"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian dự kiến kết thúc:</td>
                        <td>
                            <div class="name-input " >
                                <input style="width: 150px" id="inputenddate" class="info-text" formControlName="dob" type="date"
                                       value="${subTask.deadline}"
                                       name="deadline">
                            </div>
                            <div class="text-danger error"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Số lượng file:</td>
                        <td><input class="info-text" style="width: 150px" type="number" value="${subTask.numberOfFile}" name="numberOfFile">
                            <div class="text-danger error"></div></td>
                    </tr>
                    <tr>
                        <td>Vị trí của yêu cầu:</td>
                        <td>
                            <select name="requirement" id=""
                                    class="btn btn-secondary">
                                <c:forEach items="${requirements}" var="r">
                                    <option value="${r.id}" ${r.id == subTask.requirementID ? "selected" : ""}>${r.requirementName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <c:if test="${mess != null}">
                                <div class="alert alert-danger" role="alert" style="width: 400px;">
                                        ${mess}
                                </div>
                            </c:if>
                        </td>
                        <td>
                            <div style="display: flex; justify-content: end;">
                                <a class="btn btn-secondary" style="margin-right: 10px;"
                                   href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}">Hủy
                                    bỏ</a>
                                <button onclick="return checkvalidate('#add-project1')" type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
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