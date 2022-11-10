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
        <form action="edit_summary/edit_project" method="post">
            <div class="top-details">
                <div class="list-top">
                    <h3>Biệt thự nhà dân</h3>
                    <select class="btn project-detail" name="status">
                        <option value="1" class="btn btn-secondary">Đang thực hiện</option>
                        <option value="2" class="btn btn-secondary">Đã hoàn thành</option>
                    </select>
                </div>


                <div class="list-task-head">
                    <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                            class="btn btn-secondary"
                            type="button"
                            value="Sơ lược"></a>
                    <a class="test" href="${pageContext.request.contextPath}/list_task"><input class="btn btn-secondary"
                                                                                               type="button"
                                                                                               value="Công việc"></a>
                    <a class="test" href="${pageContext.request.contextPath}/plan_approval"><input
                            class="btn btn-secondary"
                            type="button"
                            value="Duyệt công việc"></a>
                    <a class="test" href="${pageContext.request.contextPath}/calendar"><input class="btn btn-secondary"
                                                                                              type="button"
                                                                                              value="Lịch"></a>
                    <a class="test" href="${pageContext.request.contextPath}/requirement"><input
                            class="btn btn-secondary"
                            type="button"
                            value="Yêu cầu của khách hàng"></a>
                    <a class="test" href="${pageContext.request.contextPath}/progress"><input class="btn btn-secondary"
                                                                                              type="button"
                                                                                              value="Tiến độ"></a>
                    <a class="test" href="${pageContext.request.contextPath}/project/member"><input
                            class="btn btn-secondary"
                            type="button"
                            style="background: blue;"
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
                    <input type="text" class="" name="idProject" value="${profile.id}" hidden>
                    <table class="table table-borderless">
                        <tr>
                            <td>Tên dự án:</td>
                            <td><input type="text" name="name" value="${profile.project_name}"></td>
                        </tr>
                        <tr>
                            <td>Chủ nhà:</td>
                            <td><input type="text" name="customerName" value="${profile.cusName}"></td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td><input type="text" name="phone" value="${profile.cusPhone}"></td>
                        </tr>
                        <tr>
                            <td>Địa chỉ công trình:</td>
                            <td><input type="text" name="address" value="${profile.cusAddress}"></td>
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
                            <td>Diện tích xây dựng (m2):</td>
                            <td><input type="text" name="constructionArea" value="${profile.construction_area}"></td>
                        </tr>
                        <tr>
                            <td>Thời gian bắt đầu:</td>
                            <td>
                                <input type="date" name="startDate" value="${profile.start_date}">
                            </td>
                        </tr>
                        <tr>
                            <td>Thời gian dự kiến kết thúc:</td>
                            <td><input type="date" name="closureDate" value="${profile.closure_date}"></td>
                        </tr>
                        <tr>
                            <td>Thời gian kết thúc:</td>
                            <td><input type="date" name="endDate" value="${profile.end_date}"></td>
                        </tr>
                        <tr>
                            <td>Mô tả:</td>
                            <td>
                                <input type="text" name="detail" value="${profile.detail}">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="main-file">
                    <a>Hình vẽ 3D </a>
                    <a><i class="fa-solid fa-paperclip"></i></a>
                </div>
                Hồ sơ thi công <input type="file" id="user_picture" onchange="update_image()">
                <div id="meme_picture"><img src="" height="200" width="300"></div>
                <div class="btn-update-summary">
                    <a href="allProject">
                        <button type="button" class="btn-update btn btn-secondary">Hủy bỏ</button>
                    </a>
                    <button type="submit" class="btn-update btn btn-primary">Lưu</button>
                </div>
            </div>
        </form>
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