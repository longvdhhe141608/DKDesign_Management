<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/all_project.css"/>"/>

    <title>Tất cả công trình</title>
</head>

<body>

<jsp:include page="header.jsp"/>


<div class="container_content body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="content_first">

        <div class="title">
            <h2>Tất cả công trình</h2>
        </div>
        <div class="content-function">
            <div class="function-one">
                <div class="add" id="show">
                    <svg width="33" height="32" viewBox="0 0 33 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_448_5554)">
                            <path
                                    d="M26.125 17.3333H17.875V25.3333H15.125V17.3333H6.875V14.6667H15.125V6.66667H17.875V14.6667H26.125V17.3333Z"
                                    fill="black"></path>
                        </g>
                        <defs>
                            <clipPath id="clip0_448_5554">
                                <rect width="33" height="32" fill="white"></rect>
                            </clipPath>
                        </defs>
                    </svg>
                    Thêm công trình
                </div>
            </div>
            <div></div>
            <div class="function-two">
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                       aria-expanded="false">
                        Search
                    </a>

                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">tên công trình</a>
                        <a class="dropdown-item" href="#">thời gian</a>
                        <a class="dropdown-item" href="#">loại công trình</a>
                    </div>
                </div>
            </div>
            <div class="function-thir">
                <div class="function_search">
                    <form action="">
                        <div class="wap_search">
                            <div class="search_box">
                                <button type="submit" class="search_button">
                                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path
                                                d="M21.4408 18.8679H20.0858L19.6055 18.4048C21.2864 16.4494 22.2985 13.9108 22.2985 11.1492C22.2985 4.99142 17.307 0 11.1492 0C4.99142 0 0 4.99142 0 11.1492C0 17.307 4.99142 22.2985 11.1492 22.2985C13.9108 22.2985 16.4494 21.2864 18.4048 19.6055L18.8679 20.0858V21.4408L27.4443 30L30 27.4443L21.4408 18.8679ZM11.1492 18.8679C6.87822 18.8679 3.43053 15.4202 3.43053 11.1492C3.43053 6.87822 6.87822 3.43053 11.1492 3.43053C15.4202 3.43053 18.8679 6.87822 18.8679 11.1492C18.8679 15.4202 15.4202 18.8679 11.1492 18.8679Z"
                                                fill="black"></path>
                                    </svg>
                                </button>
                                <input type="text" class="search_term" placeholder="Tìm kiếm">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="table_content">
            <div class=" table-responsive-sm">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">Công việc</th>
                        <th scope="col">Loại công trình</th>
                        <th scope="col">Thời gian bắt đầu</th>
                        <th scope="col">Thời gian kết thúc</th>
                        <th scope="col">Trạng thái</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div>
                                <form action="summary.jsp">
                                    <a>Biệt thự nhà dân</a>
                                    <button class="btn btn-outline-primary" style="float: right;">Chi
                                        tiết
                                    </button>
                                </form>
                            </div>
                        </td>
                        <td>
                            ngoại thất

                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>Đang thực hiện</td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <a>Biệt thự nhà dân</a>
                                <button class="btn btn-outline-primary" style="float: right;">Chi tiết</button>
                            </div>
                        </td>
                        <td>
                            ngoại thất

                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>Đang thực hiện</td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <a>Biệt thự nhà dân</a>
                                <button class="btn btn-outline-primary" style="float: right;">Chi tiết</button>
                            </div>
                        </td>
                        <td>
                            ngoại thất

                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>Đang thực hiện</td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <a>Biệt thự nhà dân</a>
                                <button class="btn btn-outline-primary" style="float: right;">Chi tiết</button>
                            </div>
                        </td>
                        <td>
                            ngoại thất

                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>Đang thực hiện</td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <a>Biệt thự nhà dân</a>
                                <button class="btn btn-outline-primary" style="float: right;">Chi tiết</button>
                            </div>
                        </td>
                        <td>
                            ngoại thất

                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>Đã hoàn thành</td>
                    </tr>
                    <tr>
                        <td>
                            <div>
                                <a>Biệt thự nhà dân</a>
                                <button class="btn btn-outline-primary" style="float: right;">Chi tiết</button>
                            </div>
                        </td>
                        <td>
                            ngoại thất

                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                        <td>Đang thực hiện</td>
                    </tr>

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

<div class="popup hide__popup">
    <div class="popup__content">
        <div class="title">
            <h2>Tạo công trình mới</h2>
        </div>
        <div class="info">
            <div class="name">
                <div class="name-title">
                    <h4>Tên Công trình</h4>
                </div>
                <div class="name-input">
                    <input type="text" aria-label="Last name" class="form-control">
                </div>
            </div>
            <div class="name">
                <div class="name-title">
                    <h4>Loại công trình</h4>
                </div>
                <div class="name-input">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false" style="background-color: #ccc;">
                            Nội thất
                        </a>

                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Phòng ngủ</a>
                            <a class="dropdown-item" href="#">Phòng khách</a>
                            <a class="dropdown-item" href="#">Phòng ăn</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="name">
                <div class="name-title">
                    <h4>Ngày bắt đầu</h4>
                </div>
                <div class="name-input" style="width: 150px;">
                    <input class="form-control" formControlName="dob" type="date">
                </div>
            </div>
            <div class="name">
                <div class="name-title">
                    <h4>Ngày dự kết thúc</h4>
                </div>
                <div class="name-input" style="width: 150px;">
                    <input class="form-control" formControlName="dob" type="date">
                </div>
            </div>
            <div class="name">
                <div class="name-title">
                    <h4>Thêm thành viên</h4>
                </div>
                <div class="name-input" style="width: 100%;">
                    <div class="dropdown" style="width: 100%;">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false" style="width: 100%;text-align: end; background-color: #fff;">

                        </a>

                        <div class="dropdown-menu" style="width: 100%;">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="button_click">
            <div></div>
            <div class="btn_cancel">
                <button type="button" class="btn btn-light close_popup" style="border: 1px solid #ccc;">Hủy
                    bỏ
                </button>
            </div>
            <div class="btn_ok">
                <button type="button" class="btn btn-primary">Tạo</button>
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
    //     $("#header-include").load("header.jsp");
    //     $("#narbar_menu").load("nav-left.jsp");
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