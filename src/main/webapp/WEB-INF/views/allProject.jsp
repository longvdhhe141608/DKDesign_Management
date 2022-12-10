<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <script src="<c:url value="/resources/assets/js/allProject.js"/>"></script>
    <title>Trang Chủ</title>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <jsp:include page="header.jsp"/>
    <div class="body_page">
        <jsp:include page="nav_left.jsp"/>
        <div class="summary ">
            <div class="title">
                <div>
                    <h2 style=" margin-top: 50px;">Xin chào , ${sessionScope.loginUser.username}</h2>
                </div>
                <div>
                    <%--                <h4>Tất cả công trình</h4>--%>
                </div>
            </div>

            <div class="all-project-header">
                <div>
                    <div>
                        <div>
                            <button onclick="modallistproject('#myBtn1','#myModal1','#close1')" id="myBtn1"
                                    class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm công trình
                            </button>
                            <div id="myModal1" class="modal">
                                <!-- Modal content -->
                                <div class="modal-content" style="width: 60%;">
                                    <span id="close1" class="close">&times;</span>
                                    <div class="project-add-task">
                                        <form method="post" action="allProject/add" id="addProject">
                                            <div class="title">
                                                <h4>Tạo công trình mới</h4>
                                            </div>
                                            <div class="info">
                                                <table class="table table-borderless">
                                                    <tr>
                                                        <td>Tên Công trình <label class="text-danger">*</label>:</td>
                                                        <td><input class="info-text" type="text" name="name"
                                                                   style="width: 47%">
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Chủ nhà<label class="text-danger">*</label>:</td>
                                                        <td><input name="customerName" class="info-text" type="text"
                                                                   style="width: 47%">
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Số điện thoại<label class="text-danger">*</label>:</td>
                                                        <td><input class="info-text" name="phone" type="text"
                                                                   style="width: 47%">
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Địa chỉ công trình<label class="text-danger">*</label>:</td>
                                                        <td><input class="info-text" type="text" name="address"
                                                                   style="width: 47%">
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Diện tích xây dựng<label class="text-danger">*</label>:</td>
                                                        <td><input name="constructionArea" class="info-text"
                                                                   type="text" style="width: 47%"> m<sup>2</sup>
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Chi phí thiết kế<label class="text-danger">*</label>:</td>
                                                        <td><input class="info-text" type="text" name="expectedCost"
                                                                   style="width: 47%"> đồng
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Loại công trình<label class="text-danger">*</label>:</td>
                                                        <td>
                                                            <div class="dropdown">
                                                                <select name="categoryId"
                                                                        class="btn btn-secondary dropdown-toggle">
                                                                    <c:forEach items="${listCategory}" var="category">
                                                                        <option value="${category.id}"> ${category.category_name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ngày bắt đầu<label class="text-danger">*</label>:</td>
                                                        <td><input name="startDate" id="inputstartdate"
                                                                   class="info-text" type="date">
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ngày dự kiến kết thúc<label class="text-danger">*</label>:
                                                        </td>
                                                        <td><input name="closureDate" id="inputenddate"
                                                                   class="info-text" type="date">
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Mô tả<label class="text-danger">*</label>:</td>
                                                        <td> <textarea name="detail" class="info-text" cols="60"
                                                                       rows="3"></textarea>
                                                            <div class="text-danger error"></div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="button_click" style="display: flex;justify-content: end">
                                                <div class="btn_cancel" style="margin-right: 10px">
                                                    <button type="button" class="btn btn-secondary close_popup">
                                                        Hủy bỏ
                                                    </button>
                                                </div>
                                                <div class="btn_ok">
                                                    <button onclick="return checkvalidate('#addProject')" type="submit"
                                                            class="btn btn-primary">Tạo
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Tìm Kiếm Công Trình--%>
                <form action="allProject" method="get" class="all-project-header-right">
                    <div style="margin-right: 20px;">
                        <div class="dropdown">
                            <select style="height: 38px" name="date" class="btn btn-secondary dropdown-toggle">
                                <option value="default">Tất cả</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                            </select>
                        </div>
                    </div>
                    <div>
                        <div class="function_search">
                            <div class="wap_search">
                                <input style="margin-right: 2px;" type="text" class="search_term"
                                       name="textSearch" placeholder="Tên công trình">
                                <button type="submit" class="btn btn-primary"> Tìm kiếm</button>
                            </div>
                        </div>
                    </div>
                </form>
                <%--Kết Thúc Tìm Kiếm Công Trình--%>
            </div>

            <div class="table_content">
                <div class=" table-responsive-sm">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col" class="col-4">Tên công trình</th>
                            <th scope="col" class="col-1">Loại công trình</th>
                            <th scope="col" class="col-1">Thời gian bắt đầu</th>
                            <th scope="col" class="col-1">Thời gian dự kiến kết thúc</th>
                            <th scope="col" class="col-1">Thời gian kết thúc</th>
                            <th scope="col" class="col-1">Tiến độ</th>
                            <th scope="col" class="col-1">Trạng thái</th>
                            <th scope="col" class="col-1"></th>
                        </tr>
                        </thead>
                        <tbody class="list-project">
                        <c:forEach var="i" items="${listAllProject}">
                            <tr class="each-project">
                                <td class="name-and-link">
                                    <div class="name-project col-8">
                                            ${i.projectName}
                                    </div>

                                    <input type="text" id="projectid" name="projectid" value="${i.id}" hidden>
                                    <div class="links col-4">
                                        <a class="link-detail"
                                           href="${pageContext.request.contextPath}/project/summary?id=${i.id}">
                                            <button class="btn-chi-tiet">Chi tiết</button>
                                        </a>
                                    </div>
                                </td>
                                <td>
                                    <c:if test="${i.type == 1}">
                                        Thiết kế ngoại thất
                                    </c:if>
                                    <c:if test="${i.type == 2}">
                                        Thiết kế nội thất
                                    </c:if>
                                    <c:if test="${i.type == 3}">
                                        Thiết kế ngoại thất + Thiết kế nội thất
                                    </c:if>
                                </td>
                                <td>
                                    <div class="name-input">
                                            ${i.startDate}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input">
                                            ${i.closureDate}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input">
                                            ${i.endDate}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input">
                                        <c:if test="${i.status == 3}">
                                            100%
                                        </c:if>
                                    </div>
                                </td>
                                <td>
                                    <c:if test="${i.status == 2}">
                                        Đang bàn giao
                                    </c:if>
                                    <c:if test="${i.status == 1}">
                                        Đang thực hiện
                                    </c:if>
                                    <c:if test="${i.status == 3}">
                                        Đã hoàn thành
                                    </c:if>
                                </td>
                                <td>
                                    <div style="display: flex; justify-content: space-between;">
                                        <c:if test="${i.status == 1}">
                                            <a href="${pageContext.request.contextPath}/edit_summary?id=${i.id}">
                                                <button><i class="fa-regular fa-pen-to-square"></i></button>
                                            </a>
                                        </c:if>
                                        <c:if test="${i.status != 1}">
                                            <a href="${pageContext.request.contextPath}/project/summary?id=${i.id}">
                                                <button><i class="fa-regular fa-pen-to-square"></i></button>
                                            </a>
                                        </c:if>
                                        <button onclick="modallistproject('#myBtn','#myModal','#close')" id="myBtn"><i
                                                class="fa-regular fa-trash-can"></i></button>
                                        <div id="myModal" class="modal">
                                            <!-- Modal content -->
                                            <div class="modal-content" style="width: 50%; height: 200px;">
                                                <span id="close" class="close">&times;</span>
                                                <div class="project-add-task">
                                                    <form id="add-project1" class="">
                                                        <p>Bạn chắc chắn muốn xóa dữ liệu này!</p>
                                                        <div class="add-btn-work">
                                                            <button class="btn btn-secondary close_popup">Hủy bỏ
                                                            </button>
                                                            <button
                                                                    onclick="return checkvalidatenumber('#add-project1')"
                                                                    type="submit" class="btn btn-primary">Lưu
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="pagination" style="display: flex;justify-content: end">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${page != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="allProject?page=${page-1}&date=${date}&textSearch=${textSearch}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a class="page-link"
                                                         href="allProject?page=${i}&date=${date}&textSearch=${textSearch}">${i}</a></li>
                            </c:forEach>

                            <c:if test="${page != endPage}">
                                <li class="page-item">
                                    <a class="page-link" href="allProject?page=${page+1}&date=${date}&textSearch=${textSearch}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
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


        let close = document.querySelector('.close_popup');
        close.addEventListener('click', function () {
            modal.style.display = "none";
        });

    }
</script>
</body>
</html>