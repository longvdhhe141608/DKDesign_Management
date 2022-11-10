<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Trang chủ</title>
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
                <h3>${project.project_name}</h3>
                <a class="btn project-detail"><select>
                    <option class="btn btn-secondary">Đang thực hiện</option>
                    <option class="btn btn-secondary" ${project.status==2?"selected":""}>Đã hoàn thành</option>
                </select></a>
            </div>
            <%-- list link in project           --%>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        style="background: blue;" value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/calendar?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Lịch"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thống kê"></a>
            </div>
            <%--end of link in project--%>
        </div>
        <%--end of task head--%>

        <%--        start of task main--%>
        <div class="list-task-main">

            <%--button add big task--%>
            <button onclick="modallistproject('#myBtn','#myModal','#close1')"
                    id="myBtn"
                    class="btn btn-primary add-work">+Thêm công việc
            </button>
            <%--end of button add--%>

            <!-- The Modal -->
            <div id="myModal" class="modal">
                <!-- Modal content -->
                <div class="modal-content">
                    <span id="close1" class="close">&times;</span>
                    <div class="project-add-task">
                        <form class="form-inline my-2 my-lg-0">
                            <input style="width: 30rem;" class="form-control mr-sm-2" type="text"
                                   placeholder="Tên công việc" aria-label="Text"/>
                            <table class="table table-borderless">
                                <tr>
                                    <td>Nhiệm vụ:</td>
                                    <td>Chưa phân công</td>
                                </tr>
                                <tr>
                                    <td>Công trình:</td>
                                    <td>Biệt thự nhà dân</td>
                                </tr>
                                <tr>
                                    <td>Đầu mục công việc:</td>
                                    <td>Chọn đầu mục công việc</td>
                                </tr>
                                <tr>
                                    <td>Thời gian bắt đầu:</td>
                                    <td>
                                        <div class="name-input" style="width: 150px;">
                                            <input class="form-control" formControlName="dob" type="datetime"
                                                   value="20/10/2022">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thời gian dự kiến kết thúc:</td>
                                    <td>
                                        <div class="name-input" style="width: 150px;">
                                            <input class="form-control" formControlName="dob" type="datetime"
                                                   value="20/10/2022">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ghi chú:</td>
                                    <td>-</td>
                                </tr>
                                <tr>
                                    <td>Kế hoạch công việc:</td>
                                    <td>
                                        <button class="btn btn-primary">+Thêm công việc phụ</button>
                                    </td>
                                </tr>
                            </table>
                            <div class="add-btn-work">
                                <button class="btn btn-secondary btn-canel">Hủy bỏ</button>
                                <button class="btn btn-primary btn-add">Thêm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--end of modal--%>

            <%--Table Task--%>
            <div class="">

                <%--table header--%>
                <div class="row list-task-detail">
                    <div class="col-4 list-task-header">Công việc</div>
                    <div class="col-2 list-task-header">Phân công</div>
                    <div class="col-3 list-task-header">Thời gian bắt đầu</div>
                    <div class="col-3 list-task-header">Thời gian dự kiến kết thúc</div>
                </div>
                <%--end table header--%>

                <%--big task list--%>
                <details>
                    <summary>
                        <span>Thiết kế bản vẽ</span>
                    </summary>


                    <div class="row " style="background: rgba(0, 0, 0, 0.2);">
                        <div class="col-4" style="border: 1px solid gray;">
                            <div class="">
                                <button onclick="myFunction('.sub-task-detail')"><i
                                        class="fa-solid fa-caret-down"></i></button>
                                Thiết kế mặt sàn
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>

                    <div id="" class="row sub-task-detail">
                        <div class="col-4" style="border: 1px solid gray;">
                            <a class="" style="display: flex; justify-content: space-between;"
                               href="${pageContext.request.contextPath}/task_detail?id=${task.id}">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </a>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>


                    <div id="" class="row sub-task-detail">
                        <div class="col-4" style="border: 1px solid gray;">
                            <a class="" style="display: flex; justify-content: space-between;"
                               href="${pageContext.request.contextPath}/task_detail?id=${task.idPhase}">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </a>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>

                    <c:forEach items="${taskList}" var="task">
                    <div class="row " style="background: rgba(0, 0, 0, 0.2);">
                        <div class="col-4" style="border: 1px solid gray;">
                            <div class="">
                                <button onclick="myFunction('.sub-task-detail-main')"><i
                                        class="fa-solid fa-caret-down"></i></button>
                                Thiết kế mặt sàn
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">${task.assignTo}</div>
                        <div class="col-3" style="border: 1px solid gray;">${task.startDate}</div>
                        <div class="col-3" style="border: 1px solid gray;">${task.deadline}</div>
                    </div>

                        <%--task list in big task--%>
                    <div id="" class="row sub-task-detail-main">
                        <div class="col-4" style="border: 1px solid gray;">
                            <form class="" style="display: flex; justify-content: space-between;"
                                  action="${pageContext.request.contextPath}/task_detail?id=${task.idPhase}">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail-main">
                        <div class="col-4" style="border: 1px solid gray;">
                            <form class="" style="display: flex; justify-content: space-between;"
                                  action="${pageContext.request.contextPath}/task_detail">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                </details>
                </c:forEach>


                <details>
                    <summary>
                        <span>Lên hình ảnh 3D</span>
                    </summary>
                    <div class="row " style="background: rgba(0, 0, 0, 0.2);">
                        <div class="col-4" style="border: 1px solid gray;">
                            <div class="">
                                <button onclick="myFunction('.sub-task-detail')"><i
                                        class="fa-solid fa-caret-down"></i></button>
                                Thiết kế mặt sàn
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="1" class="row sub-task-detail">
                        <div class="col-4" style="border: 1px solid gray;">
                            <form class="" style="display: flex; justify-content: space-between;"
                                  action="${pageContext.request.contextPath}/task_detail">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail">
                        <div class="col-4" style="border: 1px solid gray;">
                            <form class="" style="display: flex; justify-content: space-between;"
                                  action="${pageContext.request.contextPath}/task_detail">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div class="row " style="background: rgba(0, 0, 0, 0.2);">
                        <div class="col-4" style="border: 1px solid gray;">
                            <div class="">
                                <button onclick="myFunction('.sub-task-detail-main')"><i
                                        class="fa-solid fa-caret-down"></i></button>
                                Thiết kế mặt sàn
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail-main">
                        <div class="col-4" style="border: 1px solid gray;">
                            <form class="" style="display: flex; justify-content: space-between;"
                                  action="${pageContext.request.contextPath}/task_detail">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail-main">
                        <div class="col-4" style="border: 1px solid gray;">
                            <form class="" style="display: flex; justify-content: space-between;"
                                  action="${pageContext.request.contextPath}/task_detail">
                                <div class="">
                                    Biệt thự nhà dân
                                </div>
                                <div>
                                    <button class="btn btn-primary">Chi tiết</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                </details>
            </div>
            <div class="bot">
                <button onclick="modallistproject('#myBtn-project','#myModal-footer','#close2')" id="myBtn-project"
                        class="btn btn-primary add-work">+Thêm đầu mục công việc
                </button>
                <!-- The Modal -->
                <div id="myModal-footer" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <span id="close2" class="close">&times;</span>
                        <div class="project-add-task">
                            <form class="form-inline my-2 my-lg-0">
                                <input style="width: 30rem;" class="form-control mr-sm-2" type="text"
                                       placeholder="Tên đầu mục công việc" aria-label="Text"/>
                                <table class="table table-borderless">
                                    <tr>
                                        <td>Công trình:</td>
                                        <td>Biệt thự nhà dân</td>
                                    </tr>
                                </table>
                                <div class="add-btn-work">
                                    <button class="btn btn-secondary btn-canel">Hủy bỏ</button>
                                    <button class="btn btn-primary btn-add">Thêm</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- end of Modal content -->

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
</script>
</body>
</html>