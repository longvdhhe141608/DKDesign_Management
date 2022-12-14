<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${task.taskName} - Chi tiết công việc</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/task_detail.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/task-details.js"/>"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>${task.projectName}</h3>
                <form style="display: flex;" action="${pageContext.request.contextPath}/project/change-status"
                      method="post">
                    <input type="text" name="projectId" value="${project.id}" hidden="">
                    <div class="btn project-detail" style="margin: 0;padding: 0px 6px 0px 10px;">
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
                                <button type="submit" class="btn btn-primary" disabled>Lưu</button>
                            </c:if>
                        </c:if>
                    </div>
                </form>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${task.projectId}"><input
                        class="btn btn-secondary" type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        style="background: blue;" value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Duyệt công việc"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/requirement/requirement-for-leader?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           value="Yêu cầu của khách hàng">
                </a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/project/member?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <div class="task-details-main">
            <div>
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
                <c:if test="${task.taskStatus == 5 || task.taskStatus == 7}">
                    <div class="alert alert-danger" role="alert" style="width: 250px;">
                        <h2 style="color:#842029;font-size: 20px; margin: 0; padding: 0;">Hủy bỏ</h2>
                    </div>
                </c:if>
            </div>
            <table class="table table-borderless" style="border: 0;">
                <tr>
                    <h4>${task.taskName}</h4>
                </tr>
                <tr>
                    <td class="col-6">Nhiệm vụ:</td>
                    <td class="col-6">${task.assignToName}</td>
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
                        <div class="name-input" style="width: 150px;">
                            <fmt:formatDate value="${task.startDate}" var="std" pattern="dd/MM/yyyy"/>
                            ${std}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <fmt:formatDate value="${task.deadline}" var="dl" pattern="dd/MM/yyyy"/>
                            ${dl}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <fmt:formatDate value="${task.endDate}" var="ed" pattern="dd/MM/yyyy"/>
                            ${ed}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td>${totalSubmitFile} / ${totalFile}</td>
                </tr>
                <tr>
                    <td>Tiến độ:</td>
                    <td>${progressPercent} %</td>
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
                        <c:if test="${task.taskStatus == 6}">
                            Đã xóa
                        </c:if>
                        <c:if test="${task.taskStatus == 7}">
                            Đã hủy
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Kế hoạch của công việc:</td>
                    <td>
                        <div>
                            <c:if test="${project.status == 1}">
                                <c:if test="${task.taskStatus != 7}">
                                    <div class="">
                                        <button onclick="modallistproject('#myBtn-add-project','#myModal-add','#close1')"
                                                id="myBtn-add-project"
                                                class="btn btn-primary">+ Thêm công việc phụ
                                        </button>
                                        <div id="myModal-add" class="modal">
                                            <!-- Modal content -->
                                            <div class="modal-content" style=" width: 50%;height: 100%;">
                                                <span id="close1" class="close">&times;</span>
                                                <div class="project-add-task">
                                                    <form id="add-sub-task" action="add-sub-task" method="post">
                                                        <div class="popup__content">
                                                            <div class="title">
                                                                <h4><input class="info-text" type="text" name="name"
                                                                           value="" placeholder="Tên công việc phụ">
                                                                    <div class="text-danger error"></div>
                                                                </h4>
                                                            </div>
                                                            <div class="info">
                                                                <input type="text" name="projectId" hidden=""
                                                                       value="${task.projectId}">
                                                                <input type="text" name="sectionId" hidden=""
                                                                       value="${task.sectionId}">
                                                                <input type="text" name="taskId" hidden=""
                                                                       value="${task.taskId}">
                                                                <table class="table table-borderless">
                                                                    <tr>
                                                                        <td>Nhiệm vụ:</td>
                                                                        <td>
                                                                                ${task.assignToName}
                                                                            <input type="text" name="assignTo" hidden=""
                                                                                   value="${task.assignToId}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Thời gian bắt đầu<label
                                                                                class="text-danger">*</label>:
                                                                        </td>
                                                                        <td><input id="inputstartdate" class="info-text"
                                                                                   name="startDate" type="date">
                                                                            <div class="text-danger error"></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Thời gian dự kiến kết thúc<label
                                                                                class="text-danger">*</label>:
                                                                        </td>
                                                                        <td><input id="inputenddate" class="info-text"
                                                                                   name="deadline" type="date">
                                                                            <div class="text-danger error"></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Vị trí của yêu cầu<label
                                                                                class="text-danger">*</label>:
                                                                        </td>
                                                                        <td>
                                                                            <div class="dropdown">
                                                                                <select name="requirementId"
                                                                                        class="btn btn-secondary dropdown-toggle">
                                                                                    <c:forEach
                                                                                            items="${listRequirement}"
                                                                                            var="requirement">
                                                                                        <c:if test="${requirement.status != 3}">
                                                                                            <option value="${requirement.id}"> ${requirement.requirementName}</option>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Số lượng file<label
                                                                                class="text-danger">*</label>:
                                                                        </td>
                                                                        <td><input class="info-text" type="number"
                                                                                   name="fileNumber" value="">
                                                                            <div class="text-danger error"></div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="" style="display: flex;justify-content: end">
                                                                <div></div>
                                                                <div class="btn_cancel" style="margin-right: 5px">
                                                                    <button type="button"
                                                                            class="btn btn-secondary close_popup">Hủy
                                                                        bỏ
                                                                    </button>
                                                                </div>
                                                                <div class="btn_ok">
                                                                    <button onclick="return checkvalidate('#add-sub-task')"
                                                                            type="submit" class="btn btn-primary">Lưu
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </div>
                        <div>
                            <c:forEach items="${task.listSubTask}" var="subTask">
                                <c:if test="${subTask.taskStatus != 5}">
                                    <c:if test="${subTask.taskStatus != 1}">
                                        <a href="${pageContext.request.contextPath}/subtask?taskId=${subTask.taskId}">${subTask.taskName}</a>
                                        <br>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <c:if test="${task.showFullIcon == true}">
            <div style=" text-align: end; margin-left: 10px;">
                <c:if test="${project.status == 1}">
                    <c:if test="${task.listSubTask.size() == 0}">
                        <a href="${pageContext.request.contextPath}/edit-task?taskId=${task.taskId}">
                            <button class="btn btn-primary">
                                Chỉnh sửa
                            </button>
                        </a>
                    </c:if>
                </c:if>
            </div>
            <c:if test="${project.status == 1}">
                <div>
                    <a href="task/delete?taskId=${task.taskId}">
                        <button type="button" style="border-radius: 5px" class="btn btn-danger">Xóa</button>
                    </a>
                </div>
            </c:if>
        </c:if>
        <div class="task-cmt-details">
            <p style="font-size: 20px;">Bình luận</p>
            <div class="task-cmt-details-main">
                <form style="display: flex" action="add-comment" method="post">
                    <img class="img_avatar" src="${sessionScope.loginUser.avatar_url}"/>
                    <input name="taskId" type="text" value="${task.taskId}" hidden="">
                    <input name="operation" type="text" value="taskDetail" hidden="">
                    <input style="width: 900px; margin-right: 10px" name="content" class="input-cmt"
                           type="text"
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
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<script>
    var mess = '${mess}'
    if (mess != '') {
        alert(mess);
    }
    // const show = document.querySelector("#show-member");
    //
    // const popup = document.querySelector(".popup");
    // let close = document.querySelector('.close_popup');
    // close.addEventListener('click', function () {
    //     popup.classList.add("hide__popup");
    // });
    //
    // show.addEventListener('click', function () {
    //     popup.classList.remove("hide__popup");
    // })
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