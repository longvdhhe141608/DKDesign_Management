<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Tất cả công việc cá nhân</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class=" body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary  " style="margin-top: 20px;">
        <div class="title">
            <h4>Tất cả công công việc cá nhân</h4>
        </div>
        <div class="content-function">
            <div style="display: flex; justify-content: end; margin-bottom: 20px;">
                <div class="function-two" style="margin-right: 20px;">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            Tìm kiếm
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Biệt thự nhà dân</a>
                            <a class="dropdown-item" href="#">Biệt thự nhà dân 1</a>
                            <a class="dropdown-item" href="#">Biệt thự nhà dân 2</a>
                        </div>
                    </div>
                </div>
                <div class="function-thir">
                    <div class="function_search">
                        <form action="">
                            <div class="wap_search">
                                <input style="margin-right: 10px;" type="text" class="search_term"
                                       placeholder="tên công việc">
                                <button type="submit" class="btn btn-primary"> tìm kiếm</button>
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
                        <th scope="col">Công việc phụ</th>
                        <th scope="col">Thời gian bắt đầu</th>
                        <th scope="col">Thời gian dự kiến kết thúc</th>
                        <th scope="col">Thời gian kết thúc</th>
                        <th scope="col">Tên công trình</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach begin="1" end="10">
                        <tr class="tung-hang">
                            <td class="tung-o">
                                <div class="name-project">
                                    Đây là tên công việc
                                </div>
                                <div class="block-link">
                                    <div></div>
                                    <div class="links">
                                        <a href="#"
                                           class="link-cong-viec">
                                            <button class="btn-chi-tiet">
                                                Chi tiết
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    20/10/2022
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    20/10/2022
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    20/11/2022
                                </div>
                            </td>
                            <td> Đây là tên dự án chứa công việc này</td>
                            <td>
                                <div style="display: flex; justify-content: space-between;">
                                    <button><i class="fa-regular fa-pen-to-square"></i></button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>
                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>
                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>
                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <form action="sub-task-Designer.html"--%>
                    <%--                                  style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </form>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <%--                    <tr>--%>
                    <%--                        <td style="justify-content: center;">--%>

                    <%--                            <form class="form-name-project" action="sub-task.html">--%>
                    <%--                                <div class="name-project">--%>
                    <%--                                    thiết kế phòng ngủ--%>

                    <%--                                </div>--%>
                    <%--                                <div>--%>
                    <%--                                    <button class="btn btn-primary summary-detail-all" style="float: right;">Chi--%>
                    <%--                                        tiết--%>
                    <%--                                    </button>--%>
                    <%--                                </div>--%>
                    <%--                            </form>--%>

                    <%--                        </td>--%>

                    <%--                        <td>--%>
                    <%--                            20/10/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td>--%>
                    <%--                            20/11/2022--%>
                    <%--                        </td>--%>
                    <%--                        <td> Biệt thự nhà dân</td>--%>
                    <%--                        <td>--%>
                    <%--                            <div style="display: flex; justify-content: space-between;">--%>
                    <%--                                <button><i--%>
                    <%--                                        class="fa-regular fa-pen-to-square"></i></button>--%>

                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    </tbody>
                </table>
            </div>
            <div class="pagination" style="display: flex; justify-content: end;">
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
    // $(function () {
    //     $("#header-include").load("header.html");
    //     $("#narbar_menu").load("nav-left.html");
    // });
    const show = document.querySelector("#show");

    const popup = document.querySelector(".popup");
    let close = document.querySelector('.close_popup');
    close.addEventListener('click', function () {
        popup.classList.add("hide__popup");
    });

    show.addEventListener('click', function () {
        popup.classList.remove("hide__popup");
    })
</script>
</body>
</html>