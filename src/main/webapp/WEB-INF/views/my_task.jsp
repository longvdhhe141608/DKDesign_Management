<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <script src="<c:url value="/resources/assets/js/my-task.js"/>"></script>
    <title>Tất cả công việc cá nhân</title>
</head>
<body>

<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary">

        <div class="title">
            <h4>Công việc cá nhân</h4>
        </div>
        <div style="display: flex;justify-content: space-between; margin-bottom: 20px;">
            <div>
                <div>
                    <button onclick="modallistproject('#myBtn','#myModal','#close')" id="myBtn"
                            class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm công việc
                    </button>
                </div>
            </div>
            <div style="display: flex;">
                <div style="margin-right: 10px;">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            Tìm kiếm tên
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Biệt thự nhà dân</a>
                            <a class="dropdown-item" href="#">Biệt thự nhà dân 1</a>
                            <a class="dropdown-item" href="#">Biệt thự nhà dân 2</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="function_search">
                        <form action="">
                            <div class="wap_search">
                                <input style="margin-right: 10px;" type="text" class="search_term"
                                       placeholder="Tên công việc">
                                <button type="submit" class="btn btn-primary"> Tìm kiếm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="table_content">
            <div class=" table-responsive-sm">
                <table class="table table-bordered">
                    <thead>
                    <tr>

                        <th scope="col" class="col-4">Công việc</th>

                        <th scope="col" class="col-1">Thời gian bắt đầu</th>
                        <th scope="col" class="col-1">Thời gian dự kiến kết thúc</th>
                        <th scope="col" class="col-1">Thời gian kết thúc</th>
                        <th scope="col" class="col-4">Tên công trình</th>
                        <th scope="col" class="col-1"></th>

                    </tr>
                    </thead>
                    <tbody class="my-task-for-leader">
                    <c:forEach items="${myTask}" var="i">
                        <tr>
                            <td>
                                <div style="display: flex; justify-content: space-between">
                                    <div class="name-project">
                                            ${i.subTaskName}
                                    </div>
                                    <div>
                                        <a href="${pageContext.request.contextPath}/task_detail?taskId=${i.taskID}">
                                            <button class="btn btn-primary summary-detail-all" style="float: right;">
                                                Chi tiết
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </td>
                            <td>
                                    ${i.startDate}
                            </td>
                            <td>
                                    ${i.deadline}
                            </td>
                            <td>
                                    ${i.endDate}
                            </td>
                            <td> ${i.projectName}</td>
                            <td>
                                <div style="display: flex; justify-content: space-between;">
                                    <button><i class="fa-regular fa-pen-to-square"></i></button>

                                    <button><i class="fa-regular fa-trash-can"></i></button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content" style="width: 60%;height: 100%; ">
        <span id="close" class="close">&times;</span>
        <div class="project-add-task">
            <form id="my-task" action="">
                <div class="title">
                    <h4><input id="inputaddname" class="info-text" type="text" value=""
                               placeholder="Tên công việc mới">
                        <div class="text-danger error"></div>
                    </h4>

                </div>
                <div class="info">
                    <table class="table table-borderless">

                        <tr>
                            <td>Công trình <label class="text-danger">*</label>:</td>
                            <td>
                                <div class="dropdown">
                                    <a class="btn btn-secondary dropdown-toggle" href="#"
                                       role="button" data-toggle="dropdown"
                                       aria-expanded="false">
                                        Biệt thự vườn lài
                                    </a>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#"> Biệt thự nhà dân</a>
                                        <a class="dropdown-item" href="#">Tủ bếp Anh Túc</a>

                                    </div>
                                </div>
                            </td>
                        </tr>


                        <tr>
                            <td>Ngày bắt đầu<label class="text-danger">*</label>:</td>
                            <td><input id="inputstartdate" class="info-text" type="date">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Ngày dự kiến kết thúc<label class="text-danger">*</label>:</td>
                            <td><input id="inputenddate" class="info-text" type="date">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="button_click" style="display: flex;justify-content: end;">

                    <div class="btn_cancel" style="margin-right: 10px;">
                        <button type="submit" class="btn btn-secondary close_popup">Hủy
                            bỏ
                        </button>
                    </div>
                    <div class="btn_ok">
                        <button onclick="return checkvalidate('#my-task')" type="button"
                                class="btn btn-primary">Tạo
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
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
        let  close = document.querySelector('.close_popup');
        close.addEventListener('click',function (){
            modal.style.display = "none";
        });
        // When the user clicks on <span> (x), close the modal


        // When the user clicks anywhere outside of the modal, close it

    }
</script>
</body>
</html>