<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="/src/main/webapp/resources/assets/css/headerHome.css"/>
    <link rel="stylesheet" type="text/css" href="/src/main/webapp/resources/assets/css/bodyAdmin.css"/>
    <link rel="stylesheet" type="text/css" href="/src/main/webapp/resources/assets/css/footerPage.css"/>
    <link rel="stylesheet" type="text/css" href="/src/main/webapp/resources/assets/css/summary.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="/src/main/webapp/resources/assets/JS/summary.js"></script>
</head>

<body>
<div id="header-include"></div>
<div class="body_page">
    <div id="narbar_menu"></div>
    <div class="summary">
        <div class="top-details">
            <div class="list-top">
                <h1>Biệt thự nhà dân</h1>
                <a class="project-detail"><select>
                    <option>Đang thực hiện</option>
                    <option>Đã hoàn thành</option>

                </select></a>
            </div>
            <div class="list-task-head">
                <a class="project-detail" href="summary.html"><input type="button" value="Sơ lược"></a>
                <a class="list" href="list-task.html"><input type="button" value="Danh sách"></a>
                <a class="calendar" href="calendar.html"><input type="button" value="Lịch"></a>
                <a class="customer-request" href="requirement.html"><input type="button"
                                                                           value="Yêu cầu của khách hàng"></a>
                <a class="project-progress" href="progress.html"><input type="button" value="Tiến độ"></a>
                <a class="project-member" href="member.html"><input type="button" value="Thành viên"></a>
                <a class="statistic" href="dashboard.html"><input type="button" value="Thống kê"></a>
            </div>
        </div>

        <div class="summary-main">
            <div class="main-Quickview">
                <table class="table table-borderless">
                    <tr>
                        <td>
                            <h4>Sơ lược công trình</h4>
                        </td>
                        <td>
                            <button class="btn-update">Cập nhật</button>
                        </td>
                    </tr>
                    <tr>
                        <td>Chủ nhà:</td>
                        <td>Nguyễn Văn A</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td>0123345678</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ công trình:</td>
                        <td>xóm 1, thôn tân xã,huyện thạch thất, hà nội</td>
                    </tr>
                    <tr>
                        <td>Loại công trình:</td>
                        <td>Ngoại thất</td>
                    </tr>
                    <tr>
                        <td>Diện tích xây dựng:</td>
                        <td>500m2</td>
                    </tr>
                    <tr>
                        <td>Thời gian bắt đầu:</td>
                        <td>
                            <div class="name-input" style="width: 150px;">
                                <input class="form-control" formControlName="dob" type="date">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian dự kiến kết thúc:</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Thời gian kết thúc:</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ công trình:</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Mô tả:</td>
                        <td>-</td>
                    </tr>
                </table>
            </div>

            <div class="main-file">
                <a>Hồ sơ thi công</a>
                <a><i class="fa-solid fa-paperclip"></i></a>
            </div>
            <div class="main-file">
                <a>Hình vẽ 3D </a>
                <a><i class="fa-solid fa-paperclip"></i></a>
            </div>
            <form>
                Hồ sơ thi công <input type="file" id="user_picture" onchange="update_image()">
            </form>

            <div id="meme_picture"><img src="" height="200" width="300"></div>

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
    $(function () {
        $("#header-include").load("header.html");
        $("#narbar_menu").load("nav-left.html");
    });
</script>
</body>


</html>