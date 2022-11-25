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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
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
                <h3>${project.projectName}</h3>
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <select style="border-radius: 5px; padding: 6px;">
                        <option class="btn btn-secondary">Đang thực hiện</option>
                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>
                    </select>
                </div>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                <%--                <c:if test="${pageContext.page==summary.jsp}">--%>
                        style="background: blue"
                <%--                </c:if>--%>
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement/requirement-for-leader?id=${project.id}">
                    <input class="btn btn-secondary"
                           type="button"
                           value="Yêu cầu của khách hàng">
                </a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/project/member?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <div class="summary-main">
            <div class="main-Quickview">
                <div class="summary-main-header">
                    <h4>Sơ lược công trình</h4>
                </div>
                <table class="table table-borderless">
                    <tr>
                        <td>Chủ nhà:</td>
                        <td>${project.cusName}</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td>${project.cusPhone}</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ công trình:</td>
                        <td>${project.cusAddress}</td>
                    </tr>
                    <tr>
                        <td>Loại công trình:</td>
                        <c:if test="${project.type==1}">
                            <td>Thiết kế ngoại thất</td>
                        </c:if>
                        <c:if test="${project.type==2}">
                            <td>Thiết kế nội thất</td>
                        </c:if>
                        <c:if test="${project.type==3}">
                            <td>Thiết kế ngoại thất + Thiết kế nội thất</td>
                        </c:if>
                    </tr>
                    <tr>
                        <td>Diện tích xây dựng:</td>
                        <td>${project.constructionArea}m<sup>2</sup></td>
                    </tr>
                    <tr>
                        <td>Chi phí thiết kế:</td>
                        <td>${project.expectedCost}</td>
                    </tr>
                    <tr>
                        <td>Thời gian bắt đầu:</td>
                        <td>${project.startDate}</td>
                    </tr>
                    <tr>
                        <td>Thời gian dự kiến kết thúc:</td>
                        <td>${project.closureDate}</td>
                    </tr>
                    <tr>
                        <td>Thời gian kết thúc:</td>
                        <td>${project.endDate}</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ công trình:</td>
                        <td>${project.cusAddress}</td>
                    </tr>
                    <tr>
                        <td>Mô tả:</td>
                        <td>${project.detail}</td>
                    </tr>
                    <tr>
                        <td>Hiển thị file:</td>
                        <td><div id="fileInput" class="container js-file-list"></div></td>
                    </tr>
                </table>
            </div>
            <div style="display: flex; justify-content: space-between">
                <div></div>
                <a href="${pageContext.request.contextPath}/edit_summary?id=${project.id}">
                    <button class="btn" style="background-color: royalblue; color: white">
                        Chỉnh sửa
                    </button>
                </a>
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
<script>
    $(document).ready(function () {
        $('#fileInput').on('change', function () {
            var files = $(this)[0].files;

            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var fileReader = new FileReader();
                fileReader.onload = (function (fileParams) {
                    return function (event) {
                        var str = '<div class="col-md-2">' +
                            '<span id="upload" class="js-file-name"></span><br>' +

                            '<span class="js-file-size"></span> (Byte)<br>' +
                            '<img class="img-thumbnail js-file-image" style="width: 100%; height: 100%">' +
                            '</div>';
                        $('.js-file-list').append(str);

                        var imageSrc = event.target.result;
                        var fileName = fileParams.name;

                        var fileSize = fileParams.size;

                        $('.js-file-name').last().text(fileName);

                        $('.js-file-size').last().text(fileSize);
                        $('.js-file-image').last().attr('src', imageSrc);


                    };
                })(file);
                fileReader.readAsDataURL(file);
            }
        });
    });
</script>
</body>
</html>