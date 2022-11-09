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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
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
    <div class="summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>Biệt thự nhà dân</h3>
                <a class="btn project-detail"><select>
                    <option class="btn btn-secondary">Đang thực hiện</option>
                    <option class="btn btn-secondary">Đã hoàn thành</option>
                </select></a>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/summary"><input class="btn btn-secondary" type="button"
                                                           value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task"><input class="btn btn-secondary" type="button"
                                                             style="background: blue;" value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval"><input class="btn btn-secondary" type="button"
                                                                 value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/calendar"><input class="btn btn-secondary" type="button"
                                                            value="Lịch"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement"><input class="btn btn-secondary" type="button"
                                                               value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress"><input class="btn btn-secondary" type="button"
                                                            value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member"><input class="btn btn-secondary" type="button"
                                                          value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard"><input class="btn btn-secondary" type="button"
                                                             value="Thống kê"></a>
            </div>
        </div>
        <div class="task-details-main">
            <h4>Cấp điện chiếu sáng tầng 1</h4>
            <a style="font-size: 25px;" href="${pageContext.request.contextPath}/list_task">Biệt thự nhà dân></a><br>
            <a style="font-size: 20px;" href="${pageContext.request.contextPath}/task_detail">Thiết kế mặt bằng cấp điện></a><br>
            <a href="${pageContext.request.contextPath}/subtask">Cấp điện chiếu sáng tầng 1></a>
            <table class="table table-borderless" style="border: 0;">
                <tr>
                    <td>Nhiệm vụ:</td>
                    <td>huonghuong</td>
                </tr>
                <tr>
                    <td>Công trình:</td>
                    <td>Biệt thự nhà dân</td>
                </tr>
                <tr>
                    <td>Đầu mục công việc:</td>
                    <td>Thiết kế bản vẽ</td>
                </tr>
                <tr>
                    <td>Thời gian bắt đầu:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/10/2022">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian dự kiến kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Thời gian kết thúc:</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Số lượng file:</td>
                    <td>50/50</td>
                </tr>
                <tr>
                    <td>Tiến độ:</td>
                    <td>100%</td>
                </tr>
                <tr>
                    <td>Yêu cầu khách hàng:</td>
                    <td>Tầng 1</td>
                </tr>
                <tr>
                    <td>Ghi chú:</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>
                        Hiển thị file:
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
        <div class="task-cmt-details">
            <div class="task-cmt-details-main">
                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-cmt-details-main">
                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-cmt-details-main">
                <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                <a class="name-avatar">Nam</a>
                <a> 4 phút trước</a></br>
                <p>ok đấy</p>
            </div>
            <div class="task-detail-cmt">
                <div>
                    <img class="img_avatar" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png"/>
                    <input class="input-cmt" type="text" placeholder="Bình luận....">
                </div>
                <button class="btn btn-primary">Gửi</button>
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
</body>
</html>