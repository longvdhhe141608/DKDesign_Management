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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        ${mess}
        <div class="task-details-main">
            <table class="table table-borderless" style="border: 0;">
                <tr>
                    <h4>${tasks.taskName}</h4>
                </tr>
                <tr>
                    <td>Nhiệm vụ:</td>
                    <td>huonghuong</td>
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
                            ${tasks.startingDate}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            ${tasks.deadline}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            ${tasks.endedDate}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td>${tasks.numberOfFile}</td>
                </tr>
                <tr>
                    <td>Tiến độ:</td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td>Ghi chú:</td>
                    <td>-</td>
                </tr>
            </table>
            <div>
                <p>Kế hoạch công việc:</p>
                <div class="add" id="show-member">
                    <button class="btn btn-primary">+ Thêm công việc phụ</button>
                </div>

            </div>
            <div>
                <c:forEach items="${subTasksList}" var="i">
                    <a href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${project.id}&section-id=${section.sectionId}&task-id=${i.taskID}&sub-task-id=${i.id}">${i.taskName}</a><br>
                </c:forEach>
            </div>
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
<div class="popup hide__popup">

    <form action="${pageContext.request.contextPath}/design/task/insert-sub-task?project-id=${project.id}&section-id=${section.sectionId}&task-id=${tasks.id}" method="post">
        <div class="popup__content">
            <div class="title">
                <h4>Thêm công việc phụ</h4>
                <p>Biệt thự nhà dân</p>
                <p>Thiết kế mặt bằng cấp điện</p>
                <input type="text" placeholder="Tên công việc con" name="sub-task-name">
            </div>
            <div class="info">
                <table class="table table-borderless">
                    <tr>
                        <td>nhiệm vụ:</td>
                        <td>${sessionScope.loginUser.username}</td>
                    </tr>
                    <tr>
                        <td>Thời gian bắt đầu:</td>
                        <td><input name="startDate" class="info-text" type="date"></td>
                    </tr>
                    <tr>
                        <td>Thời gian dự kiến kết thúc:</td>
                        <td><input class="info-text" type="date" name="endDate"></td>
                    </tr>
                    <tr>
                        <td>Yêu cầu của khách hàng:</td>
                        <td>
                            <select name="requirementID" id="">
                                <c:forEach items="${requirements}" var="i">
                                    <option value="${i.id}">${i.requirementName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Số lượng file:</td>
                        <td><input class="info-text" type="number" name="numberOfFile"></td>
                    </tr>
                </table>
            </div>
            <div class="button_click">
                <div></div>
                <div class="btn_cancel">
                    <button type="button" class="btn btn-secondary close_popup">Hủy
                        bỏ
                    </button>
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
    const show = document.querySelector("#show-member");

    const popup = document.querySelector(".popup");
    let close = document.querySelector('.close_popup');
    close.addEventListener('click', function () {
        popup.classList.add("hide__popup");
    });

    show.addEventListener('click', function () {
        popup.classList.remove("hide__popup");
    })

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