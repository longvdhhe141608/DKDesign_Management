<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/task_detail.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>

<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div style="margin-left: 300px;">
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
        <div>
            <h1>Tiến độ công trình</h1>
            <input type="search" placeholder="Tìm kiếm">

        </div>
        <div>
            <table class="table table-bordered">
                <tr>
                    <td>Công việc</td>
                    <td>Người thực hiện</td>
                    <td>Ngày bắt đầu</td>
                    <td>Ngày dự kiến kết thúc</td>
                    <td>Ngày kết thúc</td>
                    <td>Tiến độ</td>
                    <td>Trạng thái</td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>01/10/2022</td>
                    <td>8/10/2022</td>
                    <td>09/10/2022</td>
                    <td>90%</td>
                    <td>Phê duyệt</td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>01/10/2022</td>
                    <td>8/10/2022</td>
                    <td>09/10/2022</td>
                    <td>90%</td>
                    <td>Phê duyệt</td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>01/10/2022</td>
                    <td>8/10/2022</td>
                    <td>09/10/2022</td>
                    <td>90%</td>
                    <td>Phê duyệt</td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>01/10/2022</td>
                    <td>8/10/2022</td>
                    <td>09/10/2022</td>
                    <td>90%</td>
                    <td>Phê duyệt</td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>01/10/2022</td>
                    <td>8/10/2022</td>
                    <td>09/10/2022</td>
                    <td>90%</td>
                    <td>Phê duyệt</td>
                </tr>

            </table>
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
<%--<script>--%>
<%--    $(function () {--%>
<%--        $("#header-include").load("header.jsp");--%>
<%--        $("#narbar_menu").load("nav_left.jsp");--%>
<%--    });--%>
<%--</script>--%>


</html>