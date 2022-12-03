<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 003,12/3/2022
  Time: 1:13 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/task-details.js"/>"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="body_page">
    <jsp:include page="/WEB-INF/views/nav_left.jsp"/>
    <div class="summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>Tên dự án</h3>
                <form style="display: flex;" action="#"
                      method="post">
<%--                    <input type="text" name="projectId" value="${project.id}" hidden="">--%>
                    <div class="btn project-detail" style="margin: 0;padding: 0px 6px 0px 10px;">
                        <select name="statusId" class="btn btn-secondary dropdown-toggle" style="padding-bottom: 10px">
<%--                            <c:forEach items="${listStatus}" var="status">--%>
<%--                                <option value="${status.id}" ${status.id== project.status ? 'selected' : ''} > ${status.statusProject}</option>--%>
<%--                            </c:forEach>--%>
                        </select>
                    </div>
                    <div>
<%--                        <c:if test="${sessionScope.loginUser.role_id == 2}">--%>
<%--                            <c:if test="${project.status != 3 }">--%>
<%--                                <button type="submit" class="btn btn-primary">Lưu</button>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${project.status == 3 }">--%>
<%--                                <button type="submit" class="btn btn-primary" disabled>Lưu</button>--%>
<%--                            </c:if>--%>
<%--                        </c:if>--%>
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
            <table class="table table-borderless" style="border: 0;">
                <tr>
                    <h4>Đây là tên công việc</h4>
                </tr>
                <tr>
                    <td class="col-6">Nhiệm vụ:</td>
                    <td class="col-6">Tên acc người được giao</td>
                </tr>
                <tr>
                    <td>Công trình:</td>
                    <td>Đây là têm công trình</td>
                </tr>
                <tr>
                    <td>Thời gian bắt đầu:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            Đây là thời gian bắt đầu
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            Thời gian dự kiến kết thúc
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            Thời gian kết thúc
                        </div>
                    </td>
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
                    </td>
                </tr>
            </table>
        </div>
        <div style=" text-align: end; margin-left: 10px;">
            <c:if test="${project.status == 1}">
                <a href="${pageContext.request.contextPath}/edit-task?taskId=${task.taskId}">
                    <button class="btn btn-primary">
                        Chỉnh sửa
                    </button>
                </a>
            </c:if>
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
