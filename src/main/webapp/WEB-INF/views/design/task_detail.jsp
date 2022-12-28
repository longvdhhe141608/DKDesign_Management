<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Chi tiết Công Việc</title>
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
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="<c:url value="/resources/assets/js/task-details.js"/>"></script>
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
            <div>
                <c:if test="${tasks.status == 2}">
                    <div class="alert alert-success" role="alert" style="width: 250px;">
                        <h2 style="color:#0f5132;font-size: 20px; margin: 0; padding: 0;">Đang thực hiện</h2>
                    </div>
                </c:if>
                <c:if test="${tasks.status == 3}">
                    <div class="alert alert-warning" role="alert" style="width: 250px;">
                        <h2 style="color:#664d03;font-size: 20px; margin: 0; padding: 0;">Chờ phê duyệt</h2>
                    </div>
                </c:if>
                <c:if test="${tasks.status == 4}">
                    <div class="alert alert-info" role="alert" style="width: 250px;">
                        <h2 style="color:#055160;font-size: 20px; margin: 0; padding: 0;">Đã hoàn thành</h2>
                    </div>
                </c:if>
                <c:if test="${tasks.status == 5 || tasks.status == 7}">
                    <div class="alert alert-danger" role="alert" style="width: 250px;">
                        <h2 style="color:#842029;font-size: 20px; margin: 0; padding: 0;">Hủy bỏ</h2>
                    </div>
                </c:if>
            </div>
            <table class="table table-borderless">
                <tr>
                    <h4>${tasks.taskName}</h4>
                </tr>
                <tr>
                    <td class="col-6">Nhiệm vụ:</td>
                    <td class="col-6">${tasks.nameEmployee}</td>
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
                        <div class="name-input" style="width: 150px;">
                            <fmt:formatDate value="${tasks.startingDate}" var="std" pattern="dd/MM/yyyy"/>
                            ${std}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <fmt:formatDate value="${tasks.deadline}" var="dl" pattern="dd/MM/yyyy"/>
                            ${dl}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <fmt:formatDate value="${tasks.endedDate}" var="ed" pattern="dd/MM/yyyy"/>
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
                    <td><p>Kế hoạch công việc:</p></td>
                    <td>
                        <div style="margin-left: 10px">
                            <div>
                                <c:if test="${project.status == 1}">
                                    <c:if test="${tasks.status != 7}">
                                        <button onclick="modallistproject('#myBtn-add-project','#myModal-add','#close1')"
                                                id="myBtn-add-project"
                                                class="btn btn-primary">+ Thêm công việc phụ
                                        </button>
                                    </c:if>
                                </c:if>
                                <div id="myModal-add" class="modal">
                                    <!-- Modal content -->
                                    <div class="modal-content" style=" width: 50%;height: 100%;">
                                        <span id="close1" class="close">&times;</span>
                                        <div class="project-add-task">
                                            <form id="add-sub-task"
                                                  action="${pageContext.request.contextPath}/design/task/insert-sub-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}"
                                                  method="post">
                                                <div class="popup__content">
                                                    <div class="title">
                                                        <h4>
                                                            <input class="info-text" type="text"
                                                                   placeholder="Thêm công việc phụ"
                                                                   name="sub-task-name">
                                                            <div class="text-danger error"></div>
                                                        </h4>
                                                    </div>
                                                    <div class="info">
                                                        <table class="table table-borderless">
                                                            <tr>
                                                                <td>Nhiệm vụ:</td>
                                                                <td>${sessionScope.loginUser.username}</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Thời gian bắt đầu<label
                                                                        class="text-danger">*</label>:
                                                                </td>
                                                                <td><input id="inputstartdate" name="startDate"
                                                                           class="info-text" type="date">
                                                                    <div class="text-danger error"></div>
                                                            </tr>
                                                            <tr>
                                                                <td>Thời gian dự kiến kết thúc<label
                                                                        class="text-danger">*</label>:
                                                                </td>
                                                                <td><input id="inputenddate" class="info-text"
                                                                           type="date" name="endDate">
                                                                    <div class="text-danger error"></div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Vị trí của yêu cầu<label
                                                                        class="text-danger">*</label>:
                                                                </td>
                                                                <td>
                                                                    <select class="btn btn-secondary"
                                                                            name="requirementID" id="">
                                                                        <c:forEach items="${requirements}" var="i">
                                                                            <option value="${i.id}">${i.requirementName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Số lượng file<label class="text-danger">*</label>:
                                                                </td>
                                                                <td><input class="info-text" type="number"
                                                                           name="numberOfFile">
                                                                    <div class="text-danger error"></div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="" style="display: flex;justify-content: end">
                                                        <div></div>
                                                        <div class="btn_cancel" style="margin-right: 5px">
                                                            <button type="button" class="btn btn-secondary close_popup">
                                                                Hủy
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
                        </div>
                        <div style="margin-left: 10px">
                            <c:forEach items="${subTasksList}" var="i">
                                <a href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${project.id}&section-id=${section.sectionId}&task-id=${i.taskID}&sub-task-id=${i.id}">${i.taskName}</a><br>
                            </c:forEach>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <div class="task-cmt-details">
            <p style="font-size: 20px;">Bình luận</p>
            <div class="task-cmt-details-main">
                <form style="display: flex" action="${pageContext.request.contextPath}/add-comment" method="post">
                    <img class="img_avatar" src="${sessionScope.loginUser.avatar_url}"/>
                    <input name="taskId" type="text" value="${tasks.id}" hidden="">
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
</script>
<script>

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

    function onClickBtn() {
        Swal.fire({
            title: 'Do you want to save the changes?',
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: 'Save',
            denyButtonText: `Don't save`,
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                Swal.fire('Saved!', '', 'success')
            } else if (result.isDenied) {
                Swal.fire('Changes are not saved', '', 'info')
            }
        })
    }
</script>
</body>
</html>