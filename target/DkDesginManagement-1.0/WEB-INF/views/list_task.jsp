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
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <select style="border: none; border-radius: 15px; height: 23px; background-color: #b7bacb">
                        <option class="btn btn-secondary">Đang thực hiện</option>
                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>
                    </select>
                </div>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task"><input class="btn btn-secondary"
                                                                                           type="button"
                                                                                           style="background: blue;"
                                                                                           value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval"><input class="btn btn-secondary"
                                                                                               type="button"
                                                                                               value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/calendar"><input class="btn btn-secondary"
                                                                                          type="button"
                                                                                          value="Lịch"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement"><input class="btn btn-secondary"
                                                                                             type="button"
                                                                                             value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress"><input class="btn btn-secondary"
                                                                                          type="button"
                                                                                          value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member"><input class="btn btn-secondary"
                                                                                        type="button"
                                                                                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard"><input class="btn btn-secondary"
                                                                                           type="button"
                                                                                           value="Thống kê"></a>
            </div>
        </div>
        <div class="list-task-main">
            <button onclick="modallistproject('#myBtn','#myModal','#close1')" id="myBtn"
                    class="btn btn-primary add-work">
                +Thêm công việc
            </button>
            <!-- The Modal -->
            <div id="myModal" class="modal">
                <!-- Modal content -->
                <div class="modal-content" style="width: 60%">
                    <span id="close1" class="close">&times;</span>
                    <div class="project-add-task">
                        <form class="form-inline my-2 my-lg-0">
                            <input style="width: 30rem;" class="form-control mr-sm-2" type="text"
                                   placeholder="Tên công việc" aria-label="Text"/>
                            <table class="table table-borderless">
                                <tr>
                                    <td>Người nhận nhiệm vụ</td>
                                    <td>
                                        <select>
                                            <option>Chưa được giao</option>
                                            <option>Nam</option>
                                            <option>Huấn</option>
                                            <option>Hương</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Công trình:</td>
                                    <td>Biệt thự nhà dân</td>
                                </tr>
                                <tr>
                                    <td>Đầu mục công việc:</td>
                                    <td>
                                        <select>
                                            <option>List đầu mục công việc</option>
                                            <option>Công việc 1</option>
                                            <option>Công việc 2</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thời gian bắt đầu:</td>
                                    <td>
                                        <div class="name-input" style="width: 150px;">
                                            <input class="form-control" formControlName="dob" type="date"
                                                   value="20/10/2022">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Thời gian dự kiến kết thúc:</td>
                                    <td>
                                        <div class="name-input" style="width: 150px;">
                                            <input class="form-control" formControlName="dob" type="date"
                                                   value="20/10/2022">
                                        </div>
                                    </td>
                                </tr>
                                <%--                                <tr>--%>
                                <%--                                    <td>Ghi chú:</td>--%>
                                <%--                                    <td></td>--%>
                                <%--                                </tr>--%>
                            </table>
                            <div class="add-btn-work">
                                <button class="btn btn-secondary btn-canel">Hủy bỏ</button>
                                <button class="btn btn-primary btn-add">Thêm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="">
                <div class="row list-task-detail">
                    <div class="col-4 list-task-header">Công việc</div>
                    <div class="col-2 list-task-header">Phân công</div>
                    <div class="col-3 list-task-header">Thời gian bắt đầu</div>
                    <div class="col-3 list-task-header">Thời gian dự kiến kết thúc</div>
                </div>
                <details>
                    <summary>
                        <span>Thiết kế bản vẽ</span>
                    </summary>
                    <div class="row " style="background: rgba(0, 0, 0, 0.2);">
                        <div class="col-4" style="border: 1px solid gray;">
                            <div class="">
                                <button onclick="myFunction('.sub-task-detail')">
                                    <i class="fa-solid fa-caret-down"></i></button>
                                Thiết kế mặt sàn
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail">
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail">
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
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
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail-main">
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                </details>
                <details>
                    <summary>
                        <span>Lên hình ảnh 3D</span>
                    </summary>
                    <div class="row " style="background: rgba(0, 0, 0, 0.2);">
                        <div class="col-4" style="border: 1px solid gray;">
                            <div class="">
                                <button onclick="myFunction('.sub-task-detail')">
                                    <i class="fa-solid fa-caret-down"></i></button>
                                Thiết kế mặt sàn
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail">
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail">
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
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
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
                        </div>
                        <div class="col-2" style="border: 1px solid gray;">huonghoang</div>
                        <div class="col-3" style="border: 1px solid gray;">25/09/2022</div>
                        <div class="col-3" style="border: 1px solid gray;">25/10/2022</div>
                    </div>
                    <div id="" class="row sub-task-detail-main">
                        <div class="col-4 link-chi-tiet-cong-viec"
                             style="border: 1px solid gray; display: flex; justify-content: space-between; ">
                            <div class="">
                                Biệt thự nhà dân
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/task_detail" class="chi-tiet-cong-viec">
                                    <button class="btn btn-primary chi-tiet">Chi tiết</button>
                                </a>
                            </div>
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
                    <div class="modal-content" style="width: 60%;">
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