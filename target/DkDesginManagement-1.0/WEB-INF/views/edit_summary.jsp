<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Sơ lược công việc</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary_edit.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary">
        <div class="top-details">
            <div class="list-top">
                <h3>Biệt thự nhà dân</h3>
                <a class="btn project-detail"><select>
                    <option class="btn btn-secondary">Đang thực hiện</option>
                    <option class="btn btn-secondary">Đã hoàn thành</option>
                </select></a>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/summary"><input class="btn btn-secondary"
                                                                                         style="background: blue;"
                                                                                         type="button" value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task"><input class="btn btn-secondary"
                                                                                           type="button"
                                                                                           value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval"><input class="btn btn-secondary"
                                                                                               type="button"
                                                                                               value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/calendar"><input class="btn btn-secondary"
                                                                                          type="button"
                                                                                          value="Lịch"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement"><input class="btn btn-secondary"
                                                                                             type="button"
                                                                                             value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress"><input class="btn btn-secondary"
                                                                                          type="button"
                                                                                          value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member"><input class="btn btn-secondary"
                                                                                        type="button"
                                                                                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard"><input class="btn btn-secondary"
                                                                                           type="button"
                                                                                           value="Thống kê"></a>
            </div>
        </div>
        <div class="summary-main">
            <div class="main-Quickview">
                <div class="summary-main-header">
                    <h4>Chỉnh sửa sơ lược công trình</h4>
                </div>
                <table class="table table-borderless">
                    <tr>
                        <td>Chủ nhà:</td>
                        <td><input type="text" value="Nguyễn Văn A"></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td><input type="text" value="0123345678"></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ công trình:</td>
                        <td><input type="text" value="xóm 1, thôn tân xã,huyện thạch thất, hà nội"></td>
                    </tr>
                    <tr>
                        <td>Loại công trình:</td>
                        <td>
                            <div class="dropdown">
                                <a class="btn btn-primary dropdown-toggle" href="#" role="button"
                                   data-toggle="dropdown" aria-expanded="false">
                                    Nội thất
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Nội thất</a>
                                    <a class="dropdown-item" href="#">Ngoại thất</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Diện tích xây dựng:</td>
                        <td><input type="text" value="500m2"></td>
                    </tr>
                    <tr>
                        <td>Thời gian bắt đầu:</td>
                        <td>
                            <input type="datetime" value="20/10/2022">
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian dự kiến kết thúc:</td>
                        <td><input type="datetime" value="20/11/2022"></td>
                    </tr>
                    <tr>
                        <td>Thời gian kết thúc:</td>
                        <td>-</td>
                    </tr>
                    <tr>
                        <td>Mô tả:</td>
                        <td>-</td>
                    </tr>
                </table>
            </div>
            <div class="main-file">
                <a>Hình vẽ 3D </a>
                <a><i class="fa-solid fa-paperclip"></i></a>
            </div>
            <form>
                Hồ sơ thi công <input type="file" id="user_picture" onchange="update_image()">
            </form>
            <div id="meme_picture"><img src="" height="200" width="300"></div>
            <div class="btn-update-summary">
                <form action="${pageContext.request.contextPath}/summary">
                    <button class="btn-update btn btn-secondary">Hủy bỏ</button>
                </form>
                <form action="${pageContext.request.contextPath}/summary">
                    <button class="btn-update btn btn-primary">Lưu</button>
                </form>
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