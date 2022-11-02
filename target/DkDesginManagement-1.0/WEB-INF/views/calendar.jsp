<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/calendar.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>

<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="container py-5" style="margin-left: 300px;">
        <div class="top">
            <div class="list-top">
                <h1>Biệt thự nhà dân</h1>
                <a class="project-detail"><select>
                    <option>Đang thực hiện</option>
                    <option>Đã hoàn thành</option>

                </select></a>
            </div>
            <div class="list-task-head">

                <a class="project-detail" href="summary.jsp"><input type="button" value="Sơ lược"></a>
                <a class="list" href="list_task.jsp"><input type="button" value="Danh sách"></a>
                <a class="calendar" href="calendar.jsp"><input type="button" value="Lịch"></a>
                <a class="customer-request" href="requirement.jsp"><input type="button"
                                                                           value="Yêu cầu của khách hàng"></a>
                <a class="project-progress" href="progress.jsp"><input type="button" value="Tiến độ"></a>
                <a class="project-member" href="member.jsp"><input type="button" value="Thành viên"></a>
                <a class="statistic" href="dashboard.jsp"><input type="button" value="Thống kê"></a>
            </div>
        </div>
        <!-- For Demo Purpose -->
        <header class="text-center text-white mb-5">
            <h1 class="display-4"></h1>

        </header>

        <div class="calendar shadow bg-white p-5">
            <div class="d-flex align-items-center"><i class="fa fa-calendar fa-3x mr-3"></i>
                <h2 class="month font-weight-bold mb-0 text-uppercase">Tháng 11 Năm 2022</h2>
            </div>
            <p class="font-italic text-muted mb-5">Không Có Sự Kiện Trong Ngày Hôm Nay.</p>
            <ol class="day-names list-unstyled">
                <li class="font-weight-bold text-uppercase">Chủ Nhật</li>
                <li class="font-weight-bold text-uppercase">Thứ Hai</li>
                <li class="font-weight-bold text-uppercase">Thứ Ba</li>
                <li class="font-weight-bold text-uppercase">Thứ Tư</li>
                <li class="font-weight-bold text-uppercase">Thứ Năm</li>
                <li class="font-weight-bold text-uppercase">Thứ Sáu</li>
                <li class="font-weight-bold text-uppercase">Thứ Bảy</li>
            </ol>

            <ol class="days list-unstyled">
                <li>
                    <div class="date">1</div>
                    <div class="event bg-success">Sự Kiện 1</div>
                </li>
                <li>
                    <div class="date">2</div>
                </li>
                <li>
                    <div class="date">3</div>
                </li>
                <li>
                    <div class="date">4</div>
                </li>
                <li>
                    <div class="date">5</div>
                </li>
                <li>
                    <div class="date">6</div>
                </li>
                <li>
                    <div class="date">7</div>
                </li>
                <li>
                    <div class="date">8</div>
                </li>
                <li>
                    <div class="date">9</div>
                </li>
                <li>
                    <div class="date">10</div>
                </li>
                <li>
                    <div class="date">11</div>
                </li>
                <li>
                    <div class="date">12</div>
                </li>
                <li>
                    <div class="date">13</div>
                    <div class="event all-day begin span-2 bg-warning">Sự Kiện 2</div>
                </li>
                <li>
                    <div class="date">14</div>
                </li>
                <li>
                    <div class="date">15</div>
                    <div class="event all-day end bg-success">Sự Kiện 3</div>
                </li>
                <li>
                    <div class="date">16</div>
                </li>
                <li>
                    <div class="date">17</div>
                </li>
                <li>
                    <div class="date">18</div>
                </li>
                <li>
                    <div class="date">19</div>
                </li>
                <li>
                    <div class="date">20</div>
                </li>
                <li>
                    <div class="date">21</div>
                    <div class="event bg-primary">Sự Kiện 4</div>
                    <div class="event bg-success">Sự Kiện 5</div>
                </li>
                <li>
                    <div class="date">22</div>
                    <div class="event bg-info">Sự Kiện 6</div>
                </li>
                <li>
                    <div class="date">23</div>
                </li>
                <li>
                    <div class="date">24</div>
                </li>
                <li>
                    <div class="date">25</div>
                </li>
                <li>
                    <div class="date">26</div>
                </li>
                <li>
                    <div class="date">27</div>
                </li>
                <li>
                    <div class="date">28</div>
                </li>
                <li>
                    <div class="date">29</div>
                </li>
                <li>
                    <div class="date">30</div>
                </li>
                <li>
                    <div class="date">31</div>
                </li>
                <li class="outside">
                    <div class="date">1</div>
                </li>
                <li class="outside">
                    <div class="date">2</div>
                </li>
                <li class="outside">
                    <div class="date">3</div>
                </li>
                <li class="outside">
                    <div class="date">4</div>
                </li>
            </ol>
        </div>
    </div>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
<script>
    $(function () {
        $("#header-include").load("header.jsp");
        $("#narbar_menu").load("nav_left.jsp");
    });
</script>

</html>