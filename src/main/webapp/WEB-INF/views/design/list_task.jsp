<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Danh sách công việc</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="list-task body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary ">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
<%--                    <select style="border-radius: 5px; padding: 6px;">--%>
<%--                        <option class="btn btn-secondary">Đang thực hiện</option>--%>
<%--                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>--%>
<%--                    </select>--%>
                </div>
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
                <a class="test" href="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Trạng thái"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/project/member-active?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
            </div>
        </div>
        <div class="list-task-main">
            <div class="">
                <div class="row list-task-detail">
                    <div class="col-4 list-task-header">Công việc</div>
                    <div class="col-1 list-task-header">Phân công</div>
                    <div class="col-2 list-task-header">Thời gian bắt đầu</div>

                    <div class="col-2 list-task-header">Thời gian dự kiến kết thúc</div>
                    <div class="col-2 list-task-header">Thời gian kết thúc</div>
                    <div class="col-1 list-task-header">Trạng thái</div>

                </div>
                <c:forEach items="${taskDtoList}" var="i">
                    <details>
                        <summary>
                            <span>${i.sectionName}</span>
                        </summary>
                        <c:forEach items="${i.tasksList}" var="t">
<%--                            <c:if test="${ t.assignedTo == sessionScope.loginUser.id}">--%>
                                <div class="row " style="background: rgba(0, 0, 0, 0.2); height: 40px">
                                    <div class="col-4 row-task" style="display: flex;justify-content: space-between;border: 1px solid gray;">
                                        <div class="name-project">
                                            <button style="border: none; background-color: #cccccc; justify-self: start;"
                                                    onclick="myFunction('.sub-task-detail')">
                                                <i class="fa-solid fa-caret-down"
                                                   style="border: none; background-color: #cccccc; justify-self: start;"></i>${t.taskName}</button>
                                        </div>
                                            <div>
                                            <a href="${pageContext.request.contextPath}/design/task/view-detail-task?project-id=${project.id}&section-id=${i.sectionID}&task-id=${t.id}"
                                               class="chi-tiet-cong-viec" style="justify-self: end;">
                                                <button class="btn btn-primary link-row-task">Chi tiết</button>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-1" style="border: 1px solid gray;">${t.nameEmployee}</div>
                                    <div class="col-2" style="border: 1px solid gray;">${t.startingDate}</div>
                                    <div class="col-2" style="border: 1px solid gray;">${t.endedDate}</div>
                                    <div class="col-2" style="border: 1px solid gray;"></div>
                                    <div class="col-1" style="border: 1px solid gray;"></div>
                                </div>
<%--                            </c:if>--%>
                            <c:forEach items="${i.subTasksList}" var="s">
                                <c:if test="${s.taskID == t.id}">
                                    <div id="" class="row sub-task-detail" >
                                        <div class="col-4 link-chi-tiet-cong-viec"
                                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                                            <div class="name-project">
                                                    ${s.taskName}
                                            </div>
                                            <div>
                                                <a href="${pageContext.request.contextPath}/design/sub-task/view-sub-task-detail?project-id=${project.id}&section-id=${i.sectionID}&task-id=${t.id}&sub-task-id=${s.id}"
                                                   class="chi-tiet-cong-viec">
                                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-1" style="border: 1px solid gray;">${s.nameEmployee}</div>
                                        <div class="col-2" style="border: 1px solid gray;">${s.startingDate}</div>
                                        <div class="col-2" style="border: 1px solid gray;">${s.startingDate}</div>
                                        <div class="col-2" style="border: 1px solid gray;"></div>
                                        <div class="col-1" style="border: 1px solid gray;">đồng ý</div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </details>
                </c:forEach>

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
    // function modallistproject(idbtn, idmodal, closemain) {
    //     // Get the modal
    //     var modal = document.querySelector(idmodal);
    //     // Get the button that opens the modal
    //     var btn = document.querySelector(idbtn);
    //     // Get the <span> element that closes the modal
    //     var span = document.querySelector(closemain);
    //     // span.addEventListener('click', event){
    //     //     event.style.display = "none";
    //     // }
    //     // When the user clicks the button, open the modal
    //     modal.style.display = "block";
    //     span.addEventListener("click", function () {
    //         modal.style.display = "none";
    //     });
    //     // When the user clicks on <span> (x), close the modal
    //     // When the user clicks anywhere outside of the modal, close it
    // }

    function myFunction(task) {
        var x = document.querySelectorAll(task);
        for (let index = 0; index < x.length; index++) {
            if (x[index].style.display === "none") {
                x[index].style.display = "flex";
            } else {
                x[index].style.display = "none";
            }
        }
    }
</script>
</body>
</html>