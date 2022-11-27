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
                        class="btn btn-secondary" type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        style="background: blue;" value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Duyệt công việc"></a>
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
        <div class="task-details-main">
            <div class="task-details-main">
                <div>
                    <c:if test="${task.taskStatus == 1}">
                        <div class="alert alert-secondary" role="alert" style="width: 250px;">
                            <h2 style="color:#383d41; font-size: 20px; margin: 0; padding: 0;">Chưa phê duyệt</h2>
                        </div>
                    </c:if>
                    <c:if test="${task.taskStatus == 2}">
                        <div class="alert alert-success" role="alert" style="width: 250px;">
                            <h2 style="color:#0f5132;font-size: 20px; margin: 0; padding: 0;">Đang thực hiện</h2>
                        </div>
                    </c:if>
                    <c:if test="${task.taskStatus == 3}">
                        <div class="alert alert-warning" role="alert" style="width: 250px;">
                            <h2 style="color:#664d03;font-size: 20px; margin: 0; padding: 0;">Chờ phê duyệt</h2>
                        </div>
                    </c:if>
                    <c:if test="${task.taskStatus == 4}">
                        <div class="alert alert-info" role="alert" style="width: 250px;">
                            <h2 style="color:#055160;font-size: 20px; margin: 0; padding: 0;">Đã hoàn thành</h2>
                        </div>
                    </c:if>
                    <c:if test="${task.taskStatus == 5}">
                        <div class="alert alert-danger" role="alert" style="width: 250px;">
                            <h2 style="color:#842029;font-size: 20px; margin: 0; padding: 0;">Hủy bỏ</h2>
                        </div>
                    </c:if>
                </div>
                <c:if test="${task.taskStatus == 3 && loginUser.role_id == 2}">
                    <div style="border-bottom: 1px solid grey; text-align: start;">

                        <a href="task/change-status?taskId=${task.taskId}&operation=agree">
                            <button class="btn btn-primary">Đồng ý</button>
                        </a>

                        <a href="task/change-status?taskId=${task.taskId}&operation=cancel">
                            <button class="btn btn-secondary">Hủy bỏ</button>
                        </a>
                    </div>
                </c:if>

                <h4>${task.taskName}</h4>
                <div style="display: flex; font-size: 20px; margin-left: 10px;">
                    <a href="list_task?id=${task.projectId}">${task.projectName}></a><br>
                    <a href="task_detail?taskId=${task.taskfId}">${task.sectionName}></a><br>
                    <a href="subtask?taskId=${task.taskId}">${task.taskName}></a>
                </div>
                <table class="table table-borderless" style="border: 0;">

                    <tr>
                        <td>Nhiệm vụ:</td>
                        <td>${task.assignToName}</td>
                    </tr>
                    <tr>
                        <td>Công trình:</td>
                        <td>${task.projectName}</td>
                    </tr>
                    <tr>
                        <td>Đầu mục công việc:</td>
                        <td>${task.sectionName}</td>
                    </tr>
                    <tr>
                        <td>Thời gian bắt đầu:</td>
                        <td>
                            ${task.startDate}
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian dự kiến kết thúc:</td>
                        <td>
                            ${task.deadline}
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian kết thúc:</td>
                        <td>
                            ${task.endDate}
                        </td>
                    </tr>
                    <tr>
                        <td>Số lượng file:</td>
                        <td>${task.numberFileCurrent} / ${task.fileNumber}</td>
                    </tr>
                    <tr>
                        <td>Tiến độ:</td>
                        <td>${task.workProgress}</td>
                    </tr>
                    <tr>
                        <td>Trạng thái:</td>
                        <td>
                            <c:if test="${task.taskStatus == 1}">
                                Chưa phê duyệt
                            </c:if>
                            <c:if test="${task.taskStatus == 2}">
                                Đang thực hiện
                            </c:if>
                            <c:if test="${task.taskStatus == 3}">
                                Chờ phê duyệt
                            </c:if>
                            <c:if test="${task.taskStatus == 4}">
                                Đã hoàn thành
                            </c:if>
                            <c:if test="${task.taskStatus == 5}">
                                Hủy bỏ
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td>Yêu cầu khách hàng:</td>
                        <td>${task.requirementName}</td>
                    </tr>

                    <tr>
                        <td>Xem file:</td>
                        <td>
                            <div id="fileInput" class="container js-file-list"></div>
                        </td>
                    </tr>
                </table>
            </div>
            <p style="font-size: 20px;">Bình luận</p>
            <c:if test="${task.taskStatus != 1}">
                <div class=" task-cmt-details-main">
                    <form class="task-detail-cmt" action="add-comment" method="post">
                        <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                        <input name="taskId" type="text" value="${task.taskId}" hidden="">
                        <input name="operation" type="text" value="subTaskDetail" hidden="">
                        <input name="content" class="input-cmt" type="text" placeholder="Bình luận....">
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
                                <span>${comment.content}</span>

                            </div>

                            <div>
                                <c:if test="${comment.isPin() ==true}">
                                <i class="fa-solid fa-thumbtack"></i>

                                    </c:if>
                                    <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.role_id == 2 }">
                                    <a href="pin-comment?taskId=${task.taskId}&operation=taskDetail&commentId=${comment.id}">
                                        <button type="button" class=" btn-primary">Pin</button>
                                    </a>
                                    </c:if>
                              </div>
                            </div>
                            </br>
                            <!----------item------------>
                        </c:forEach>
                    </c:if>



                </div>
            </c:if>

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
    <script>
        $(document).ready(function () {
            $('#fileInput').on('change', function () {
                var files = $(this)[0].files;

                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    var fileReader = new FileReader();
                    fileReader.onload = (function (fileParams) {
                        return function (event) {
                            var str = '<div class="col-md-2">' +
                                '<span id="upload" class="js-file-name"></span><br>' +

                                '<span class="js-file-size"></span> (Byte)<br>' +
                                '<img class="img-thumbnail js-file-image" style="width: 100%; height: 100%">' +
                                '</div>';
                            $('.js-file-list').append(str);

                            var imageSrc = event.target.result;
                            var fileName = fileParams.name;

                            var fileSize = fileParams.size;

                            $('.js-file-name').last().text(fileName);

                            $('.js-file-size').last().text(fileSize);
                            $('.js-file-image').last().attr('src', imageSrc);


                        };
                    })(file);
                    fileReader.readAsDataURL(file);
                }
            });
        });
    </script>
    <script>
        var mess = '${mess}'
        if (mess != '') {
            alert(mess);
        }
    </script>
</body>
</html>