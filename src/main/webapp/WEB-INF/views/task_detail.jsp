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
                <a class="test" href="${pageContext.request.contextPath}/calendar?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Lịch"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <c:if test="${task.taskStatus == 3}" >
            <div>
                <h4>Bạn có muốn phê duyệt không (FE sửa hộ)</h4>
                <button type="button" class="btn btn-primary">Đồng ý</button>
                <button type="button" class="btn btn-primary">Không đồng ý</button>
            </div>

        </c:if>


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
                    <td>Ghi chú:</td>
                    <td>${task.description}</td>
                </tr>
                <tr>
                    <td>Kế hoạch của công việc:</td>
                    <td>${task.taskfName}</td>
                </tr>
            </table>
            <div>
                <p>Danh sách công việc phụ :</p>
                <div class="add" id="show-member">
                    <button class="btn btn-primary">+ Thêm công việc phụ</button>
                </div>
            </div>
            <div>
               <c:forEach items="${task.listSubTask}" var="subTask" >
                   <a href="subtask?taskId=${subTask.taskId}">${subTask.taskName}</a> <br>
               </c:forEach>
            </div>

        </div>
        <div style=" text-align: end; margin-left: 10px;">
            <form action="${pageContext.request.contextPath}/editTaskDetail">
                <a href="">
                    <button class="btn btn-primary">
                        Chỉnh sửa
                    </button>
                </a>
            </form>
        </div>

        <div class="task-cmt-details" style="margin-top: 20px; margin-left: 10px;">
            <div class="task-cmt-details-main">
                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-cmt-details-main">
                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-cmt-details-main">
                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-detail-cmt">
                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                <input class="input-cmt" type="text" placeholder="Bình luận....">
                <button class="btn btn-primary">Gửi</button>
            </div>
        </div>
    </div>
</div>
<div class="popup hide__popup">
    <div class="popup__content">
        <div class="title">
            <h4>Thêm công việc phụ</h4>
        </div>
        <div class="info">
            <table class="table table-borderless">
                <tr>
                    <td>Thời gian bắt đầu:</td>
                    <td><input class="info-text" type="text" style="width: 500px;"></td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td><input class="info-text" type="text" style="width: 500px;"></td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td><input class="info-text" type="number"></td>
                </tr>
            </table>
        </div>
        <div class="button_click">
            <div></div>
            <div class="btn_cancel">
                <button type="button" class="btn btn-secondary close_popup">
                    Hủy bỏ
                </button>
            </div>
            <div class="btn_ok">
                <button type="button" class="btn btn-primary">Lưu</button>
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