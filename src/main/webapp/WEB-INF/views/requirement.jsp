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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/requirement.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/requirement.js"/>"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
            integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>

<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>
                <form style="display: flex" action="${pageContext.request.contextPath}/project/change-status"
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
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}">
                    <input class="btn btn-secondary" type="button" value="Sơ lược">
                </a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           value="Công việc">
                </a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           value="Duyệt công việc">
                </a>
                <a class="test"
                   href="${pageContext.request.contextPath}/requirement/requirement-for-leader?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           style="background: blue;"
                           value="Yêu cầu của khách hàng">
                </a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           value="Tiến độ">
                </a>
                <a class="test" href="${pageContext.request.contextPath}/project/member?id=${project.id}">
                    <input
                            class="btn btn-secondary"
                            type="button"
                            value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           value="Thống kê">
                </a>
            </div>
        </div>
        <h4>Thông tin yêu cầu của khách hàng</h4>
        <div>
            <c:if test="${project.status == 1}">
                <button onclick="modallistproject('#myBtn-add-project','#myModal-add','#close1')" id="myBtn-add-project"
                        class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm yêu cầu
                </button>
            </c:if>
            <div id="myModal-add" class="modal">
                <!-- Modal content -->
                <div class="modal-content" style=" width: 50%;height: 65%;">
                    <span id="close1" class="close">&times;</span>
                    <div class="project-add-task">
                        <form id="add-project2" class=""
                              action="${pageContext.request.contextPath}/requirement/add-new-requirement?id=${project.id}"
                              method="post">
                            <table class="table table-borderless">
                                <tr>
                                    <td>Vị trí<label class="text-danger">*</label>:</td>
                                    <td>
                                        <input style="width: 500px;" id="inputaddname" class="info-text" type="text"
                                               value="" name="ten-vi-tri">
                                        <div class="text-danger error"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Yêu cầu<label class="text-danger">*</label>:</td>
                                    <td>
                                        <textarea class="info-text" name="noi-dung-yeu-cau" cols="60"
                                                  rows="3"></textarea>
                                        <div class="text-danger error"></div>
                                    </td>
                                </tr>

                            </table>
                            <div class="add-btn-work" style="display: flex; justify-content: end">
                                <button type="button" class="btn btn-secondary close_popup" style="margin-right: 5px">
                                    Hủy bỏ
                                </button>
                                <button onclick="return checkvalidatenumber('#add-project2')" type="submit"
                                        class="btn btn-primary">Thêm
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="table_content requiment-main ">
            <div class=" requiment-main-left">
                <table class="table table-bordered ">

                    <thead>
                    <tr>
                        <th scope="col" class="col-2">Vị trí</th>
                        <th scope="col" class="col-6">Yêu cầu</th>
                        <th scope="col" class="col-1">Thời gian</th>
                        <th scope="col" class="col-2">Trạng thái</th>

                        <th scope="col" class="col-1"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requirements}" var="requirement">
                        <!-------item------------------------>
                        <c:if test="${requirement.status != 3}">
                            <tr>
                                <td class="col-2">${requirement.requirementName}</td>
                                <td class="col-6">${requirement.requirementDetail}</td>
                                <td class="col-1"></td>
                                <td class="col-2">
                                    <c:if test="${requirement.status == 1}">
                                        Đang xử lý
                                    </c:if>
                                    <c:if test="${requirement.status == 2}">
                                        Đã đáp ứng
                                    </c:if>
                                    <c:if test="${requirement.status == 4}">
                                        Chưa được đáp ứng
                                    </c:if>
                                </td>
                                <td class="col-1">
                                    <div style="display: flex; ">
                                        <button onclick="showPopUp(this.getAttribute('data-id'), this.getAttribute('data-place'), this.getAttribute('data-detail'))"
                                                id="myBtn-project" data-id="${requirement.id}"
                                                data-place="${requirement.requirementName}"
                                                data-detail="${requirement.requirementDetail}"><i
                                                class="fa-regular fa-pen-to-square"></i></button>
                                        <button onclick="onClickDelete(this.getAttribute('data-id'))"
                                                data-id="${requirement.id}" data-project-id="${requirement.projectId}">
                                            <i class="fa-regular fa-trash-can"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                        <!-------item------------------------>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagination" style="display: flex; justify-content: end">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            <c:forEach items="${requestScope.lsPage}" var="page">
                                <li class="page-item ${requestScope.page == page ? "active" : ""}">
                                    <a class="page-link"
                                       href="requirement-for-leader?id=${project.id}&pageNo=${page}">${page}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div>
            <div style="margin-bottom: 10px">
                <button class="btn btn-primary">Lịch sử</button>
            </div>
            <div>
                <table class="table table-bordered">
                    <thead>
                    <th scope="col">Requirement ID</th>
                    <th scope="col">Lần</th>
                    <th scope="col">Nội dung</th>
                    <th scope="col">Thời gian</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${listHistory}" var="history">
                        <tr>
                            <td>
                                    ${history.table_id}
                            </td>
                            <td>
                                    ${history.revision_no}
                            </td>
                            <td>
                                    ${history.revision_detail}
                            </td>
                            <td>
                                    ${history.dateString}
                            </td>
                        </tr>

                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div id="myModal-footer" class="modal">
    <!-- Modal content -->
    <div class="modal-content" style=" width: 50%;height: 70%;">
        <span id="close2" class="close">&times;</span>
        <div id="showHtml" class="project-add-task">
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
    let modalFooter = document.querySelector("#myModal-footer");
    var span = document.querySelector("#close2");
    span.addEventListener("click", function () {
        modalFooter.style.display = "none";
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