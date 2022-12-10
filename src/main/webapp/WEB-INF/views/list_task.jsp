<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Công Việc</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <script src="<c:url value="/resources/assets/js/list-task.js"/>"></script>
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

                <form style="display: flex;" action="${pageContext.request.contextPath}/project/change-status"
                      method="post">
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
                                <button type="submit" class="btn btn-primary" disabled>Lưu</button>
                            </c:if>
                        </c:if>
                    </div>
                </form>

            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        style="background: blue;"
                        value="Công việc"></a>
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
        <div class="list-task-main">
            <c:if test="${project.status == 1}">
                <button onclick="modallistproject('#myBtn','#myModal','#close1')" id="myBtn"
                        class="btn btn-primary add-work">
                    +Thêm công việc
                </button>
            </c:if>
            <!-- The Modal -->
            <div id="myModal" class="modal">
                <!-- Modal content -->
                <div class="modal-content" style="width: 60% ; height: 100%;">
                    <span id="close1" class="close">&times;</span>
                    <div class="project-add-task">
                        <form id="add-project" action="add-task" method="post">
                            <h4>
                                <input class="info-text" type="text"
                                       name="name" placeholder="Tên công việc" aria-label="Text"/>
                                <div class="text-danger error"></div>
                            </h4>
                            <table class="table table-borderless">
                                <tr>
                                    <td>Nhiệm vụ<label class="text-danger">*</label>:</td>
                                    <td>
                                        <select name="assignId" class="btn btn-secondary dropdown-toggle">
                                            <c:forEach items="${listAccount}" var="account">
                                                <option value="${account.id}"> ${account.username}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Công trình:</td>
                                    <td>
                                        ${project.projectName}
                                        <input type="text" class="" name="projectId" value="${project.id}" hidden>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Đầu mục công việc<label class="text-danger">*</label>:</td>
                                    <td>
                                        <select name="sectionId" class="btn btn-secondary dropdown-toggle">
                                            <c:forEach items="${listBigTask}" var="section">
                                                <option value="${section.id}"> ${section.section_name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thời gian bắt đầu<label class="text-danger">*</label>:</td>
                                    <td>
                                        <div class="name-input" style="width: 150px;">
                                            <input id="inputstartdate" class="info-text" formControlName="dob"
                                                   type="date"
                                                   name="startDate" value="20/10/2022">
                                            <div class="text-danger error"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thời gian dự kiến kết thúc<label class="text-danger">*</label>:</td>
                                    <td>
                                        <div class="name-input" style="width: 150px;">
                                            <input id="inputenddate" class="info-text" formControlName="dob" type="date"
                                                   name="deadline" value="20/10/2022">
                                            <div class="text-danger error"></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div class="add-btn-work">
                                <button type="button" class="btn btn-secondary btn-canel close_popup"
                                        style="margin-right: 10px;">
                                    Hủy bỏ
                                </button>
                                <button onclick="return checkvalidate('#add-project')"
                                        type="submit" class="btn btn-primary">Thêm
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="">
                <div class="row list-task-detail">
                    <div class="col-4 list-task-header">Công việc</div>
                    <div class="col-1 list-task-header">Phân công</div>
                    <div class="col-2 list-task-header">Thời gian bắt đầu</div>
                    <div class="col-2 list-task-header">Thời gian dự kiến kết thúc</div>
                    <div class="col-2 list-task-header">Thời gian kết thúc</div>
                    <div class="col-1 list-task-header"></div>
                </div>
                <c:forEach items="${listBigTask}" var="bigTask">
                    <!------big task item------>
                    <details>
                        <summary style="display:block;">
                            <div style="display: flex; justify-content: space-between;">
                                <div>
                            <span><i class="fa-solid fa-caret-down"></i> ${bigTask.section_name}</span>
                                </div>
                                <div>
                            <button onclick="showPopUpSection(this.getAttribute('data-id'), this.getAttribute('data-pid'), this.getAttribute('data-name'))"
                                    id="myBtn-section" data-id="${bigTask.id}" data-name="${bigTask.section_name}"
                                    data-pid="${bigTask.project_id}">
                                <i class="fa-regular fa-pen-to-square"></i>
                            </button>
                            <button onclick="modallistproject('#myBtn1','#myModal1','#close4')" id="myBtn1"><i
                                    class="fa-regular fa-trash-can"></i></button>
                            <div id="myModal1" class="modal">
                                <!-- Modal content -->
                                <div class="modal-content" style="width: 60%;height: 30%;">
                                    <span id="close4" class="close">&times;</span>
                                    <div class="project-add-task">
                                            <p style="text-align: center">Bạn chắc chắn muốn xóa dữ liệu này!</p>
                                            <div class="add-btn-work" style="display: flex;justify-content: end">
                                                <button style="margin-right: 10px" class="btn btn-secondary ">Hủy bỏ
                                                </button>
                                                <a href="delete_section?sectionId=${bigTask.id}" >
                                                    <button
                                                            onclick="return checkvalidatenumber('#add-project2')"
                                                            type="submit" class="btn btn-primary">Lưu
                                                    </button>
                                                </a>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                                </div>
                        </summary>
                        <c:forEach items="${bigTask.listTask}" var="task">
                            <!------task item------>
                            <div class="row " style="background: rgba(0, 0, 0, 0.2);height: 40px">
                                <div class="col-4 row-task"
                                     style="display: flex;justify-content: space-between; border: 1px solid gray;">
                                    <div class="name-project col-8">
                                        <button onclick="myFunction('.sub-task-detail')"
                                                style="border: none; background-color: #cccccc; justify-self: start;">
                                            <i class="fa-solid fa-caret-down"></i>
                                        </button>
                                            ${task.taskName}
                                    </div>
                                    <div class="col-4">
                                        <a href="${pageContext.request.contextPath}/task_detail?taskId=${task.taskId}">
                                            <button class="btn btn-primary link-row-task">Chi tiết</button>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-1" style="border: 1px solid gray;">${task.assignToName}</div>
                                <div class="col-2" style="border: 1px solid gray;">${task.startDate}</div>
                                <div class="col-2" style="border: 1px solid gray;">${task.deadline}</div>
                                <div class="col-2" style="border: 1px solid gray;">${task.endDate}</div>
                                <div class="col-1" style="border: 1px solid gray;">
                                    <div style="display: flex; justify-content: space-between;">
                                        <c:if test="${task.listSubTask.size() == 0}">
                                            <a href="${pageContext.request.contextPath}/edit-task?taskId=${task.taskId}">
                                                <button><i class="fa-regular fa-pen-to-square"></i></button>
                                            </a>
                                        </c:if>
                                        <c:if test="${task.listSubTask.size() != 0}">
                                            <button onclick="onUnavailable()"><i
                                                    class="fa-regular fa-pen-to-square"></i></button>
                                        </c:if>
                                        <a href="task/delete?taskId=${task.taskId}" >
                                        <button><i class="fa-regular fa-trash-can"></i></button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!------task item------>
                            <c:forEach items="${task.listSubTask}" var="subTask">
                                <!--------list sub task------------>
                                <c:if test="${subTask.taskStatus != 5 && subTask.taskStatus != 1}">
                                    <div id="" class="row sub-task-detail">
                                        <div class="col-4 link-chi-tiet-cong-viec"
                                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                                            <div class="name-project col-8">
                                                    ${subTask.taskName}
                                            </div>
                                            <div class="col-4">
                                                <a href="${pageContext.request.contextPath}/subtask?taskId=${subTask.taskId}"
                                                   class="chi-tiet-cong-viec">
                                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-1" style="border: 1px solid gray;">${subTask.assignToName}</div>
                                        <div class="col-2" style="border: 1px solid gray;">${subTask.startDate}</div>
                                        <div class="col-2" style="border: 1px solid gray;">${subTask.deadline}</div>
                                        <div class="col-2" style="border: 1px solid gray;">${subTask.endDate}</div>
                                        <div class="col-1" style="border: 1px solid gray;">
                                            <div style="display: flex; justify-content: space-between;">
                                                <button>
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </button>
                                                <a href="sub-task/delete?subTaskId=${subTask.taskId}" >
                                                    <button>
                                                        <i class="fa-regular fa-trash-can"></i>
                                                    </button>
                                                </a>

                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <!--------list sub task------------>
                            </c:forEach>
                        </c:forEach>
                    </details>
                    <!------big task item------>
                </c:forEach>
            </div>
            <div class="bot">
                <c:if test="${project.status == 1}">
                    <button onclick="modallistproject('#myBtn-project','#myModal-footer','#close2')" id="myBtn-project"
                            class="btn btn-primary add-work">+Thêm đầu mục công việc
                    </button>
                </c:if>
                <!-- The Modal -->
                <div id="myModal-footer" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content" style="width: 60%; height: 60%">
                        <span id="close2" class="close">&times;</span>
                        <div class="project-add-task">
                            <form id="add-project3" action="add_section" method="post">
                                <h4><input class="info-text" type="text"
                                           name="name" placeholder="Tên đầu mục công việc" aria-label="Text"/>
                                    <div class="text-danger error"></div>
                                </h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td>Công trình:</td>
                                        <td>
                                            ${project.projectName}
                                            <input type="text" class="" name="projectId" value="${project.id}" hidden>
                                        </td>
                                    </tr>
                                </table>
                                <div class="add-btn-work">
                                    <button style="margin-right: 10px" type="button"
                                            class="btn btn-secondary btn-canel" onclick="onClickClose()">
                                        Hủy bỏ
                                    </button>
                                    <button onclick="return checkvalidatenumber('#add-project3')" type="submit"
                                            class="btn btn-primary btn-add">Thêm
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="myModal-editSection" class="modal">
    <!-- Modal content -->
    <div class="modal-content" style="height: 60%;width: 60%">
        <span id="close3" class="close">&times;</span>
        <div id="showEditHtml" class="project-add-task">
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

    function onClickClose() {
        let modalA = document.querySelector("#myModal-footer");
        modalA.style.display = "none";
    }
    let modalB = document.querySelector("#myModal-editSection");
    var span = document.querySelector("#close3");
    span.addEventListener("click", function () {
        modalB.style.display = "none";
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
        let close = document.querySelector('.close_popup');
        close.addEventListener('click', function () {
            modal.style.display = "none";
        });
    }

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

    var mess = '${mess}'
    if (mess != '') {
        alert(mess);
    }
</script>
</body>
</html>
