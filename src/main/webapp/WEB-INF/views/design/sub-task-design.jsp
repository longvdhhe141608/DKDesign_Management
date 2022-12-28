<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Công Việc Phụ</title>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
    <style>
        .custom_image {
            width: 800px;
            height: 550px;
            background-size: cover;
            object-fit: contain;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/design/header.jsp"/>
<div class="body_page">
    <jsp:include page="/WEB-INF/views/design/nav_left.jsp"/>
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
                <c:if test="${subTask.status == 5 || subTask.status == 7}">
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
                        <fmt:formatDate value="${subTask.startingDate}" var="std" pattern="dd/MM/yyyy"/>
                        ${std}
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <fmt:formatDate value="${subTask.deadline}" var="dl" pattern="dd/MM/yyyy"/>
                        ${dl}
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <c:if test="${subTask.endedDate != null}">
                            <fmt:formatDate value="${subTask.endedDate}" var="ed" pattern="dd/MM/yyyy"/>
                            ${ed}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td>${totalFile} / ${subTask.numberOfFile}</td>
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
                    <td>Ghi chú:</td>
                    <td>${subTask.description}</td>
                </tr>
                <c:if test="${progressPercent == 100 && subTask.status == 3 || subTask.status == 4}">
                    <tr>
                        <td>Hiển thị file:</td>
                        <td>
                            <div class="container">
                                <c:forEach items="${listImages}" var="image">
                                    <button type="button" style="border-radius: 5px"
                                            onclick="showImage(this.getAttribute('data-url'))"
                                            data-url="${image.fileUrl}">
                                        <img src="<c:url value="${image.fileUrl}"/>" alt=""
                                             style="max-height: 100px; min-height: 100px;
                                                  max-width: 100px; min-width: 100px; object-fit: cover;">
                                    </button>
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${progressPercent < 100 && subTask.status == 2 && subTask.assignedTo == loginUser.id}">
                    <tr>
                        <td>Tải file lên:</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/design/sub-task/update-file-sub-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}&sub-task-id=${subTask.id}"
                                  class="update_file" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="file" class="form-control" id="fileInput" multiple name="file"
                                           accept="image/*">
                                </div>
                                    <%--                                <div class="container js-file-list"></div>--%>
                                <div>
                                    <input class="btn btn-primary" type="submit" value="Cập nhật file">
                                </div>
                            </form>
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
                </c:if>
                <c:if test="${progressPercent <= 100 && subTask.status == 2 && subTask.assignedTo == loginUser.id && progressPercent > 0}">
                    <tr>
                        <td>Hiển thị file</td>
                        <td>
                            <form id="add-sub-task"
                                  action="${pageContext.request.contextPath}/design/sub-task/delete-file"
                                  method="get">
                                <input type="text" value="${project.id}" hidden name="projectId">
                                <input type="text" value="${subTask.id}" hidden name="sub-task-id">
                                <input type="text" value="${subTask.taskID}" hidden name="task-id">
                                <input type="text" value="${subTask.sectionID}" hidden
                                       name="section-id">
                                <div class="container">
                                    <c:forEach items="${listImages}" var="image">
                                        <input type="checkbox" value="${image.id}"
                                               name="listFile">
                                        <button type="button" style="border-radius: 5px"
                                                onclick="showImage(this.getAttribute('data-url'))"
                                                data-url="${image.fileUrl}">
                                            <img src="<c:url value="${image.fileUrl}"/>" alt=""
                                                 style="max-height: 100px; min-height: 100px;
                                                  max-width: 100px; min-width: 100px; object-fit: cover;">
                                        </button>
                                    </c:forEach>
                                </div>
                                <div class="btn_ok" style="padding-top: 15px;">
                                    <button type="submit" class="btn btn-primary">Xóa File
                                    </button>
                                </div>
                            </form>
                        </td>
                    </tr>
                </c:if>
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
        <div class="task-cmt-details">
            <p style="font-size: 20px;">Bình luận</p>
            <c:if test="${subTask.status != 1}">
                <div class="task-cmt-details-main">
                    <form style="display: flex" action="${pageContext.request.contextPath}/add-comment" method="post">
                        <img class="img_avatar" src="${sessionScope.loginUser.avatar_url}"/>
                        <input name="taskId" type="text" value="${subTask.id}" hidden="">
                        <input name="operation" type="text" value="subTaskDetail" hidden="">
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
                                    <img class="img_avatar" src="${comment.avatarUrl}"/>
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
            </c:if>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                            // '<span id="upload" class="js-file-name"></span><br>' +

                            // '<span class="js-file-size"></span> (Byte)<br>' +
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

    function modallistproject(idbtn, idmodal, closemain) {
        // Get the modal
        var modal = document.querySelector(idmodal);

        // Get the button that opens the modal
        var btn = document.querySelector(idbtn);

        // Get the <span> element that closes the modal
        var span = document.querySelector(closemain);
        // span.addEventListener('click', event){
        //     event.style.display = "none";
        // }
        // When the user clicks the button, open the modal

        modal.style.display = "block";

        span.addEventListener("click", function () {
            modal.style.display = "none";
        });

        // When the user clicks on <span> (x), close the modal


        // When the user clicks anywhere outside of the modal, close it
        let close = document.querySelector('.close_popup');
        close.addEventListener('click', function () {
            modal.style.display = "none";
        });
    }
</script>
</body>
</html>