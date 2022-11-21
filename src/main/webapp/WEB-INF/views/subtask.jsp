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
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <select style="border: none; padding: 6px;">
                        <option class="btn btn-secondary">Đang thực hiện</option>
                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>
                    </select>
                </div>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/summary?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        style="background: blue;" value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <div class="task-details-main">
            <c:if test="${task.taskStatus == 3}">
                <div style="border-bottom: 1px solid grey; text-align: start;">
                    <h4>Bạn có muốn phê duyệt không (FE sửa hộ)</h4>
                    <button class="btn btn-primary">Đồng ý</button>
                    <button class="btn btn-secondary">Hủy bỏ</button>
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
                    <td>Ghi chú:</td>
                    <td>${task.description}</td>
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
        <div class="task-cmt-details">
            <c:if test="${listComment.size() > 0}">
                <c:forEach items="${listComment}" var="comment">
                    <!----------item------------>
                    <div class="task-cmt-details-main">
                        <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                        <a class="name-avatar">${comment.accountName}</a>
                        <a> ${comment.dateCountDown}</a></br>
                        <p>${comment.content}</p>
                        <c:if test="${comment.isPin() ==true}">
                            <i class="fa-solid fa-thumbtack"></i>
                            <br>
                        </c:if>
                        <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.role_id == 2 }">
                            <a href="pin-comment?taskId=${task.taskId}&operation=taskDetail&commentId=${comment.id}" ><button type="button" class=" btn-primary" >Pin</button></a>
                        </c:if>


                    </div>
                    <!----------item------------>
                </c:forEach>
            </c:if>


            <div class="task-detail-cmt">
                <form action="add-comment" method="post">
                    <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                    <input name="taskId" type="text" value="${task.taskId}" hidden="">
                    <input name="operation" type="text" value="subTaskDetail" hidden="">
                    <input name="content" class="input-cmt" type="text" placeholder="Bình luận....">
                    <button class="btn btn-primary">Gửi</button>
                </form>
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