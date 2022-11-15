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
    <div class="summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.project_name}</h3>
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <select style="border: none; padding: 6px;">
                        <option class="btn btn-secondary">Đang thực hiện</option>
                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>
                    </select>
                </div>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/design/project/summary?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                <%--                <c:if test="${pageContext.page==summary.jsp}">--%>
                        style="background: blue"
                <%--                </c:if>--%>
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/calendar?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Lịch"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/project/member?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
            </div>
        </div>
        <div class="task-details-main">
            <h4>${subTask.taskName}</h4>
            <c:forEach items="${subTasksList}" var="i">
                <c:if test="${i.id != subTask.id}">
                    <a style="font-size: 25px;"
                       href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${project.id}&section-id=${section.id}&task-id=${i.taskID}&sub-task-id=${i.id}">${i.taskName}</a><br>
                </c:if>
            </c:forEach>
            <table class="table table-borderless" style="border: 0;">

                <tr>
                    <td>Nhiệm vụ:</td>
                    <td>${subTask.nameEmployee}</td>
                </tr>
                <tr>
                    <td>Công trình:</td>
                    <td>${project.project_name}</td>
                </tr>
                <tr>
                    <td>Đầu mục công việc:</td>
                    <td>${tasks.taskName}</td>
                </tr>
                <tr>
                    <td>Thời gian bắt đầu:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime"
                                   value="${subTask.startingDate}">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime"
                                   value="${subTask.deadline}">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime"
                                   value="${subTask.endedDate}">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td>${subTask.numberOfFile}</td>
                </tr>
                <tr>
                    <td>Tiến độ:</td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td>Yêu cầu khách hàng:</td>
                    <td>${subTask.nameRequirement}</td>
                </tr>
                <tr>
                    <td>Ghi chú:</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>Upload thị file:</td>
                    <td>
                        <div class="form-group">

                            <input type="file" class="form-control" id="fileInput" multiple>
                        </div>
                    </td>
                </tr>
            </table>

        </div>
        <%--        <div style=" text-align: end; margin-left: 10px;">--%>
        <%--            <form action="${pageContext.request.contextPath}/editTaskDetail">--%>
        <%--                <a href="">--%>
        <%--                    <button class="btn btn-primary">--%>
        <%--                        Chỉnh sửa--%>
        <%--                    </button>--%>
        <%--                </a>--%>
        <%--            </form>--%>
        <%--        </div>--%>
        <%--        <div class="task-cmt-details">--%>
        <%--            <div class="task-cmt-details-main">--%>
        <%--                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>--%>
        <%--                <a class="name-avatar">Nam</a>--%>
        <%--                <a> 4 phút trước</a></br>--%>
        <%--                <p>ok đấy</p>--%>
        <%--            </div>--%>
        <%--            <div class="task-cmt-details-main">--%>
        <%--                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>--%>
        <%--                <a class="name-avatar">Nam</a>--%>
        <%--                <a> 4 phút trước</a></br>--%>
        <%--                <p>ok đấy</p>--%>
        <%--            </div>--%>
        <%--            <div class="task-cmt-details-main">--%>
        <%--                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>--%>
        <%--                <a class="name-avatar">Nam</a>--%>
        <%--                <a> 4 phút trước</a></br>--%>
        <%--                <p>ok đấy</p>--%>
        <%--            </div>--%>
        <%--            <div class="task-detail-cmt">--%>
        <%--                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>--%>
        <%--                <input class="input-cmt" type="text" placeholder="Bình luận....">--%>
        <%--                <button class="btn btn-primary">Gửi</button>--%>
        <%--            </div>--%>
        <%--        </div>--%>
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