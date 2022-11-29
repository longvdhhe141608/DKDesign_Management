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
                <h3>${project.projectName}</h3>
<%--                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">--%>
<%--                    <select style="border-radius: 5px; padding: 6px;">--%>
<%--                        <option class="btn btn-secondary">Đang thực hiện</option>--%>
<%--                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
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
                <a class="test"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <div class="task-details-main">
            <div>
                <c:if test="${subTask.status == 1}">
                    <div class="alert alert-secondary" role="alert" style="width: 250px;">
                        <h2 style="color:#383d41; font-size: 20px; margin: 0; padding: 0;">Chưa phê duyệt</h2>
                    </div>
                </c:if>
                <c:if test="${subTask.status == 2}">
                    <div class="alert alert-success" role="alert" style="width: 250px;">
                        <h2 style="color:#0f5132;font-size: 20px; margin: 0; padding: 0;">Đang thực hiện</h2>
                    </div>
                </c:if>
                <c:if test="${subTask.status == 3}">
                    <div class="alert alert-warning" role="alert" style="width: 250px;">
                        <h2 style="color:#664d03;font-size: 20px; margin: 0; padding: 0;">Chờ phê duyệt</h2>
                    </div>
                </c:if>
                <c:if test="${subTask.status == 4}">
                    <div class="alert alert-info" role="alert" style="width: 250px;">
                        <h2 style="color:#055160;font-size: 20px; margin: 0; padding: 0;">Đã hoàn thành</h2>
                    </div>
                </c:if>
                <c:if test="${subTask.status == 5}">
                    <div class="alert alert-danger" role="alert" style="width: 250px;">
                        <h2 style="color:#842029;font-size: 20px; margin: 0; padding: 0;">Hủy bỏ</h2>
                    </div>
                </c:if>
            </div>
            <h4>${subTask.taskName}</h4>
            <div style="font-size: 20px;">
                <a href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}">${project.projectName}
                    > </a>
                <a href="${pageContext.request.contextPath}/design/task/view-detail-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}">${tasks.taskName}
                    > </a>
                <a href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}">${subTask.taskName}
                    > </a>
            </div>
            <table class="table table-borderless">

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
                        ${subTask.startingDate}
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        ${subTask.deadline}
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <c:if test="${subTask.endedDate != null}">
                            ${subTask.endedDate}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td>${totalFile}/${subTask.numberOfFile}</td>
                </tr>
                <tr>
                    <td>Tiến độ:</td>
                    <td>${progressPercent} %</td>
                </tr>
                <tr>
                    <td>Yêu cầu khách hàng:</td>
                    <td>${subTask.nameRequirement}</td>
                </tr>

                <tr>
                    <td>Upload file:</td>
                    <td>
                        <c:if test="${progressPercent != 100 && subTask.status == 2 }">
                            <form action="${pageContext.request.contextPath}/design/sub-task/update-file-sub-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}"
                                  class="update_file" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="file" class="form-control" id="fileInput" multiple name="file">
                                </div>
                                <div>
                                    <input class="btn btn-primary" type="submit" value="Update File">
                                </div>
                            </form>
                        </c:if>
                        <div class="container js-file-list">
                            <c:if test="${status == 2}">
                                <div class="alert alert-danger" role="alert">
                                    <h2 style="color:#664d03;font-size: 20px; margin: 0; padding: 0;">${mess}</h2>
                                </div>
                            </c:if>
                            <c:if test="${status == 1}">
                                <div class="alert alert-success" role="alert">
                                    <h2 style="color:#0f5132;font-size: 18px; margin: 0; padding: 0;">${mess}</h2>
                                </div>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </table>
            <div style="display: flex; justify-content: space-between;">
                <c:if test="${progressPercent == 100 && subTask.status == 2}">
                    <a href="${pageContext.request.contextPath}/design/sub-task/submit-sub-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}"
                       class="btn btn-primary">Nộp</a>
                </c:if>
                <c:if test="${subTask.status == 1}">
                    <a class="btn btn-primary"
                       href="${pageContext.request.contextPath}/design/sub-task/view-edit-sub-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}">
                        Chỉnh sửa
                    </a>
                </c:if>
            </div>
        </div>
<%--                <div style=" text-align: end; margin-left: 10px;">--%>
<%--                    <form action="${pageContext.request.contextPath}/editTaskDetail">--%>
<%--                        <a href="">--%>
<%--                            <button class="btn btn-primary">--%>
<%--                                Chỉnh sửa--%>
<%--                            </button>--%>
<%--                        </a>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--        <div class="task-cmt-details">--%>
<%--            <p style="font-size: 20px;">Bình luận</p>--%>
<%--            <div class="task-cmt-details-main">--%>
<%--                <div style="display: flex;">--%>
<%--                    <img class="img_avatar" src="../image/a.jpg" />--%>
<%--                    <div class="task-cmt-details-member">--%>
<%--                        <span class="name-avatar">Nam</span>--%>
<%--                        <span> 4 phút trước</span></br>--%>
<%--                        <span class="cmt-details-total">ok đấy</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div><button style="margin: 5px;"><i class="fa-solid fa-thumbtack"></i></button><br>--%>

<%--            <div class="task-cmt-details-main">--%>
<%--                <div style="display: flex;">--%>
<%--                    <img class="img_avatar" src="../image/a.jpg" />--%>

<%--                    <input style="width: 500px; margin-right: 10px;" type="text" placeholder="Viết bình luận...">--%>
<%--                    <button>Gửi</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
        <div class="task-cmt-details">
            <p style="font-size: 20px;">Bình luận</p>
            <div class="task-cmt-details-main">
                <form style="display: flex" action="${pageContext.request.contextPath}/add-comment" method="post">
                    <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                    <input name="taskId" type="text" value="${subTask.id}" hidden="">
                    <input name="operation" type="text" value="taskDetail" hidden="">
                    <input style="width: 900px; margin-right: 10px;" name="content" class="input-cmt" type="text"
                           placeholder="Bình luận....">
                    <button class="btn btn-primary">Gửi</button>
                </form>
            </div>
            <div class="task-cmt-details">
                <c:if test="${listComment.size() > 0}">
                    <c:forEach items="${listComment}" var="comment">
                        <!----------item------------>
                        <div style="display: flex">
                            <div class="task-cmt-details-main">
                                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                                <span class="name-avatar">${comment.accountName}</span>
                                <span> ${comment.dateCountDown}</span></br>
                                <span style="margin-left: 50px">${comment.content}</span>

                            </div>
                            <div>
                                <c:if test="${comment.isPin() ==true}">
                                    <i class="fa-solid fa-thumbtack"></i>

                                </c:if>
                                <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.role_id == 2 }">
                                    <a href="pin-comment?taskId=${task.taskId}&operation=taskDetail&commentId=${comment.id}">
                                        <button type="button" class=" btn-primary">Pin</button>
                                    </a></br>
                                </c:if>
                            </div>
                        </div>

                        <!----------item------------>
                    </c:forEach>
                </c:if>

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