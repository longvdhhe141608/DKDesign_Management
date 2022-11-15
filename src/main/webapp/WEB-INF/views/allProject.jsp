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
    <title>Tất cả công trình</title>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <jsp:include page="header.jsp"/>
    <div class="container_content body_page">
        <jsp:include page="nav_left.jsp"/>
        <div class="summary  content_first">
            <div class="title">
                <h4>Tất cả công trình</h4>
            </div>
            <div class="content-function">
                <div>
                    <div class="function-one">
                        <div class="add" id="show" style="display: flex">
                            <button class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm công trình</button>
                        </div>
                    </div>
                    <div></div>
                </div>
                <form action="allProject" method="get"
                      style="display: flex; justify-content: space-evenly; margin-left: 28%">
                    <div class="function-two">
                        <div class="dropdown">
                            <select style="height: 38px" name="date" class="btn btn-secondary dropdown-toggle">
                                <option value="default">Default</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                            </select>
                        </div>
                    </div>
                    <div class="function-thir">
                        <div class="function_search">
                            <div class="wap_search">
                                <input style="margin-right: 2px;" type="text" class="search_term"
                                       name="textSearch" placeholder="Tên công trình">
                                <button type="submit" class="btn btn-primary"> Tìm kiếm</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="table_content">
                <div class=" table-responsive-sm">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Tên công trình</th>
                            <th scope="col">Loại công trình</th>
                            <th scope="col">Thời gian bắt đầu</th>
                            <th scope="col">Thời gian kết thúc</th>
                            <th scope="col">Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody class="list-project">
                        <c:forEach var="i" items="${listAllProject}">
                            <tr class="each-project">
                                <td class="name-and-link">
                                    <div class="name-project">
                                            ${i.projectName}
                                    </div>
                                    <input type="text" id="projectid" name="projectid" value="${i.id}" hidden>
                                    <div class="links">
                                        <a class="link-detail"
                                           href="${pageContext.request.contextPath}/project/summary?id=${i.id}">
                                            <button class="btn-chi-tiet">Chi tiết</button>
                                        </a>
                                    </div>
                                </td>
                                <c:if test="${i.type == 1}">
                                    <td>
                                        Ngoại thất
                                    </td>
                                </c:if>
                                <c:if test="${i.type == 2}">
                                    <td>
                                        Nội thất
                                    </td>
                                </c:if>
                                <td>
                                    <div class="name-input" style="width: 150px;">
                                            ${i.startDate}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input" style="width: 150px;">
                                            ${i.endDate}
                                    </div>
                                </td>
                                <c:if test="${i.status == 2}">
                                    <td>
                                        Đã hoàn thành
                                    </td>
                                </c:if>
                                <c:if test="${i.status == 1}">
                                    <td>
                                        Đang thực hiện
                                    </td>
                                </c:if>
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
</div>
<div class="popup hide__popup">
    <div class="popup__content">
        <div>
            <h4>Tạo công trình mới</h4>
        </div>
        <div class="info">
            <form method="post" action="allProject/add">
                <table class="table table-borderless">
                    <tr>
                        <td>Tên công trình:</td>
                        <td><input required="" class="info-text" name="name" type="text"></td>
                    </tr>
                    <tr>
                        <td>Loại công trình:</td>
                        <td>
                            <div class="dropdown">
                                <select name="categoryId" class="btn btn-secondary dropdown-toggle">
                                    <c:forEach items="${listCategory}" var="category">
                                        <option value="${category.id}"> ${category.category_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngày bắt đầu:</td>
                        <td><input required="" name="startDate" class="info-text" type="date"></td>
                    </tr>
                    <tr>
                        <td>Ngày dự kiến kết thúc:</td>
                        <td><input required="" name="closureDate" class="info-text" type="date"></td>
                    </tr>
                    <tr>
                        <td>Tên khách hàng:</td>
                        <td><input required="" class="info-text" name="customerName" type="text"></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ:</td>
                        <td><input required="" class="info-text" name="address" type="text"></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td><input required="" class="info-text" name="phone" type="text"></td>
                    </tr>
                    <tr>
                        <td>Diện tích</td>
                        <td><input required="" class="info-text" name="constructionArea" type="number"> m<sup>2</sup>
                        </td>
                    </tr>
                    <tr>
                        <td>Mô tả</td>
                        <td>
                            <%--                            <input required="" class="info-text" name="detail" type="text">--%>
                            <textarea name="detail" style="height: 32px" cols="35" wrap="soft"></textarea>
                        </td>
                    </tr>

                </table>
                <div class="button_click">
                    <div></div>
                    <div class="btn_cancel">
                        <button type="button" class="btn btn-secondary close_popup">Hủy
                            bỏ
                        </button>
                    </div>
                    <div class="btn_ok">
                        <button type="submit" class="btn btn-primary">Tạo</button>
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
    const show = document.querySelector("#show");

    const popup = document.querySelector(".popup");
    let close = document.querySelector('.close_popup');
    close.addEventListener('click', function () {
        popup.classList.add("hide__popup");
    });

    show.addEventListener('click', function () {
        popup.classList.remove("hide__popup");
    })
    var mess = '${mess}'
    if (mess != '') {
        alert(mess);
    }
</script>
</body>
</html>