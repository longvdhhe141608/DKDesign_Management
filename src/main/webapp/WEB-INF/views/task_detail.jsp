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
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <select style="border: none; padding: 6px;">
                        <option class="btn btn-secondary">Đang thực hiện</option>
                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>
                    </select>
                </div>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${task.projectId}"><input
                        class="btn btn-secondary" type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/task/list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        style="background: blue;" value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement/requirement-for-leader?id=${project.id}">
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
            <table class="table table-borderless" style="border: 0;">
                <tr>
                    <h4>${task.taskName}</h4>
                </tr>
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
                        <div class="name-input" style="width: 150px;">
                            ${task.startDate}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            ${task.deadline}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            ${task.endDate}
                        </div>
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
                    <td>Ghi chú:</td>
                    <td>${task.description}</td>
                </tr>
                <tr>
                    <td>Kế hoạch của công việc:</td>
                </tr>
            </table>
            <div>
                <p>Danh sách công việc phụ :</p>
                <div class="add" id="show-member">
                    <button class="btn btn-primary">+ Thêm công việc phụ</button>
                </div>
            </div>
            <div>
                <c:forEach items="${task.listSubTask}" var="subTask">
                    <a href="subtask?taskId=${subTask.taskId}">${subTask.taskName}</a> <br>
                </c:forEach>
            </div>

        </div>
        <div style=" text-align: end; margin-left: 10px;">
                <a href="edit-task?taskId=${task.taskId}">
                    <button class="btn btn-primary">
                        Chỉnh sửa
                    </button>
                </a>
        </div>
        <p style="font-size: 20px;">Bình luận</p>
        <div class="task-cmt-details" style="margin-top: 20px; margin-left: 10px;">
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
                    <input name="operation" type="text" value="taskDetail" hidden="">
                    <input name="content" class="input-cmt" type="text" placeholder="Bình luận....">
                    <button class="btn btn-primary">Gửi</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="popup hide__popup">
    <form action="add-sub-task" method="post">
    <div class="popup__content">
        <div class="title">
            <h4><input class="info-text" type="text" name="name" value="" placeholder="Tên công việc phụ"></h4>
        </div>
        <div class="info">
            <input type="text" name="projectId" hidden="" value="${task.projectId}" >
            <input type="text" name="sectionId" hidden="" value="${task.sectionId}" >
            <input type="text" name="taskId" hidden="" value="${task.taskId}" >
            <table class="table table-borderless">
                <tr>
                    <td>Nhiệm vụ:</td>
                    <td>
                        ${task.assignToName}
                        <input type="text" name="assignTo" hidden="" value="${task.assignToId}" >
                    </td>
                </tr>
                <tr>
                    <td>Thời gian bắt đầu:</td>
                    <td> <input class="info-text" name="startDate" type="date"></td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td> <input class="info-text" name="deadline" type="date"></td>
                </tr>
                <tr>
                    <td>Yêu cầu của khách hàng:</td>
                    <td>
                        <div class="dropdown">
                            <select name="requirementId" class="btn btn-secondary dropdown-toggle">
                                <c:forEach items="${listRequirement}" var="requirement">
                                    <option value="${requirement.id}"> ${requirement.requirementName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td> <input type="number" name="fileNumber" value=""></td>
                </tr>
            </table>
        </div>
        <div class="button_click">
            <div></div>
            <div class="btn_cancel">
                <button type="button" class="btn btn-secondary close_popup">Hủy
                    bỏ</button>
            </div>
            <div class="btn_ok">
                <button type="submit" class="btn btn-primary">Lưu</button>
            </div>
        </div>
    </div>
  </form>
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
    var mess = '${mess}'
    if (mess != '') {
        alert(mess);
    }
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