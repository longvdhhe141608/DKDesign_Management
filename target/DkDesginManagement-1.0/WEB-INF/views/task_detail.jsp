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
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>

<body>
<jsp:include page="header.jsp"/>
<jsp:include page="nav_left.jsp"/>
<div id="header-include"></div>
<div class="body_page">
    <div id="narbar_menu"></div>
    <div class="project-task-details" style="margin-left: 250px;">
        <div class="task-details-main">
            <table class="table table-borderless" style="border: 0;">
                <tr>
                    <h1>Thiết kế mặt bằng cấp điện</h1>
                </tr>
                <tr>
                    <td>Nhiệm vụ</td>
                    <td>huonghuong</td>
                </tr>
                <tr>
                    <td>Công trình</td>
                    <td>Biệt thự nhà dân</td>
                </tr>
                <tr>
                    <td>Đầu mục công việc</td>
                    <td>Thiết kế bản vẽ</td>
                </tr>
                <tr>
                    <td>Thời hạn</td>
                    <td>20/9-22/9</td>
                </tr>
                <tr>
                    <td>Số lượng file</td>
                    <td>50/50</td>
                </tr>
                <tr>
                    <td>Tiến độ</td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td>Ghi chú</td>
                    <td>-</td>
                </tr>
            </table>
            <div>
                <a>Kế hoạch công việc:</a>
                <button class="btn-add-task">+Thêm công việc phụ</button>
            </div>
            <div>
                <a href="#">Cấp điện chiếu sáng tầng 2></a><br>
                <a href="#">Cấp điện ổ cắm tầng 1></a>
            </div>
        </div>
        <div class="task-cmt-details">
            <div class="task-cmt-details-main">
                <img class="img_avatar" src=""/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-cmt-details-main">
                <img class="img_avatar" src=""/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-cmt-details-main">
                <img class="img_avatar" src=""/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-detail-cmt">
                <img class="img_avatar" src=""/>
                <input class="input-cmt" type="text" placeholder="Bình luận....">
                <button>Gửi</button>
            </div>
            <div class="task-detail-cmt">
                <img class="img_avatar" src=""/>
                <input class="input-cmt" type="text" placeholder="Bình luận....">
            </div>
            <div class="task-detail-cmt">
                <img class="img_avatar" src=""/>
                <input class="input-cmt" type="text" placeholder="Bình luận....">
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
<%--<script>--%>
<%--    $(function () {--%>
<%--        $("#header-include").load("header.jsp");--%>
<%--        $("#narbar_menu").load("nav-left.jsp");--%>
<%--    });--%>
<%--</script>--%>

</body>

</html>