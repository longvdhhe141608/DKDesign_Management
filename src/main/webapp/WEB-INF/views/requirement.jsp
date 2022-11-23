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
</head>

<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="requiment summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>Biệt thự nhà dân</h3>
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <select style="border: none; padding: 6px;">
                        <option class="btn btn-secondary">Đang thực hiện</option>
                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>
                    </select>
                </div>
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


        <div class="add" id="show-member">

            <button onclick="modallistproject('#myBtn-add-project','#myModal-add','#close1')" id="myBtn-add-project"
            class="btn btn-primary"><i class="fa-solid fa-plus"></i>Thêm yêu cầu</button>
            <div id="myModal-add" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span id="close1" class="close">&times;</span>
                    <div class="project-add-task">
                        <form  id="add-project1" class="">

                            <table class="table table-borderless">
                                <tr>
                                    <td>Vị trí:</td>
                                    <td>
                                        <input style="width: 500px;"  class="info-text" type="text"
                                               value="">
                                        <div class="text-danger error"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Yêu cầu:</td>
                                    <td>
                                        <textarea name=""  cols="60" rows="3"></textarea>
                                        <div class="text-danger error"></div>
                                    </td>
                                </tr>

                            </table>
                            <div class="add-btn-work">
                                <button class="btn btn-secondary ">Hủy bỏ</button>
                                <button onclick="return checkvalidatenumber('#add-project1')" type="submit"
                                        class="btn btn-primary">Thêm</button>
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
                        <th scope="col">Vị trí</th>
                        <th scope="col">Yêu cầu</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requirements}" var="requirement">
                        <!-------item------------------------>
                        <c:if test="${requirement.status == 3}">
                            <tr style="display: none">
                                <td>${requirement.requirementName}</td>
                                <td>${requirement.requirementDetail}</td>
                                <td>
                                    <c:if test="${requirement.status == 1}">
                                        Đang xử lý
                                    </c:if>
                                    <c:if test="${requirement.status == 2}">
                                        Đã đáp ứng
                                    </c:if>
                                </td>
                                <td>
                                    <div style="display: flex; justify-content: space-between;">
                                        <button onclick="modallistproject('#myBtn-project','#myModal-footer','#close2')"
                                                id="myBtn-project"><i class="fa-regular fa-pen-to-square"></i></button>
                                        <div id="myModal-footer" class="modal">

                                        <!-- Modal content -->
                                        <div class="modal-content">
                                            <span id="close2" class="close">&times;</span>
                                            <div class="project-add-task">
                                                <form id="add-project2" class="">

                                                    <table class="table table-borderless">
                                                        <tr>
                                                            <td>Vị trí:</td>
                                                            <td>
                                                                <input style="width: 500px;"
                                                                       class="info-text" type="text" value="Tầng1">
                                                                <div class="text-danger error"></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Yêu cầu:</td>
                                                            <td>
                                                                    <textarea name="" id="" cols="60"
                                                                              rows="3">1 Phòng khách: diện tích 20m2 , sơn trắng , sàn gạch . 2 phòng ngủ : 10m2 , trần thạch cao .</textarea>
                                                                <div class="text-danger error"></div>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                    <div class="add-btn-work">
                                                        <button class="btn btn-secondary ">Hủy bỏ</button>
                                                        <button
                                                                onclick="return checkvalidatenumber('#add-project2')"
                                                                type="submit" class="btn btn-primary">Lưu</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>

                                    </div>

                                        <a href="${pageContext.request.contextPath}/requirement/delete-requirement-by-leader?id=${requirement.id}&project-id=${requirement.projectId}">
                                            <button onclick="modallistproject('#myBtn','#myModal','#close')" id="myBtn"><i
                                                    class="fa-regular fa-trash-can"></i></button>
                                            <div id="myModal" class="modal">

                                                <!-- Modal content -->
                                                <div class="modal-content">
                                                    <span id="close" class="close">&times;</span>
                                                    <div class="project-add-task">
                                                        <form id="add-project3" class="">

                                                            <p>Bạn chắc chắn muốn xóa dữ liệu này!</p>
                                                            <div class="add-btn-work">
                                                                <button class="btn btn-secondary ">Hủy bỏ</button>
                                                                <button
                                                                        onclick="return checkvalidatenumber('#add-project3')"
                                                                        type="submit" class="btn btn-primary">Lưu</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${requirement.status != 3}">
                            <tr>
                                <td>${requirement.requirementName}</td>
                                <td>${requirement.requirementDetail}</td>
                                <td>
                                    <c:if test="${requirement.status == 1}">
                                        Đang xử lý
                                    </c:if>
                                    <c:if test="${requirement.status == 2}">
                                        Đã đáp ứng
                                    </c:if>
                                </td>
                                <td>
                                    <div style="display: flex; justify-content: space-between;">
                                        <button><i class="fa-regular fa-pen-to-square"></i></button>
                                        <a href="${pageContext.request.contextPath}/requirement/delete-requirement-by-leader?requirement-id=${requirement.id}&project-id=${requirement.projectId}">
                                            <button><i class="fa-regular fa-trash-can"></i></button>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                        <!-------item------------------------>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagination">
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
    </div>
</div>
<div class="popup hide__popup">
    <form action="${pageContext.request.contextPath}/requirement/add-new-requirement?id=${project.id}" method="post">
        <div class="popup__content">
            <div class="title">
                <h4>Thêm yêu cầu của khách hàng</h4>
            </div>
            <div class="info">
                <table class="table table-borderless">
                    <tr>
                        <td>Vị trí:</td>
                        <td><input class="info-text" type="text" style="width: 500px;" name="ten-vi-tri"></td>
                    </tr>
                    <tr>
                        <td>Yêu cầu:</td>
                        <td><textarea class="info-text" type="text" style="width: 500px;"
                                      name="noi-dung-yeu-cau"></textarea>
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

    }
</script>


</body>

</html>