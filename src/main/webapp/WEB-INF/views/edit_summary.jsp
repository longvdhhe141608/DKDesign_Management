<jsp:useBean id="project" scope="request" type="DkDesignManagement.Entity.Project"/>
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
    <script src="<c:url value="/resources/assets/js/summary-edit.js"/>"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary">
        <form id="addProject" action="edit_summary/edit_project" method="post" enctype="multipart/form-data">
            <div class="top-details">
                <div class="list-top">
                    <h3>${project.projectName}</h3>
                    <form style="display: flex;" action="${pageContext.request.contextPath}/project/change-status"
                          method="post">
                        <input type="text" name="projectId" value="${project.id}" hidden="">
                        <div class="btn project-detail" style="margin: 0; padding: 0px 6px 0px 10px; ">
                            <select name="statusId" class="btn btn-secondary dropdown-toggle"
                                    style="padding-bottom: 10px">
                                <c:forEach items="${listStatus}" var="status">
                                    <option value="${status.id}" ${status.id== project.status ? 'selected' : ''} > ${status.statusProject}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <c:if test="${sessionScope.loginUser.role_id == 2}">
                                <c:if test="${project.status != 3 }">
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </c:if>
                                <c:if test="${project.status == 3 }">
                                    <button type="submit" class="btn btn-primary" disabled>Lưu</button>
                                </c:if>
                            </c:if>
                        </div>
                    </form>
                </div>
                <div class="list-task-head">
                    <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                            class="btn btn-secondary"
                            type="button"
                            style="background: blue;"
                            value="Sơ lược"></a>
                    <a class="test" href="${pageContext.request.contextPath}/list_task?id=${project.id}"><input
                            class="btn btn-secondary"
                            type="button"

                            value="Công việc"></a>
                    <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                            class="btn btn-secondary"
                            type="button"
                            value="Duyệt công việc"></a>
                    <a class="test"
                       href="${pageContext.request.contextPath}/requirement/requirement-for-leader?id=${project.id}">
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
                        <h4>Chỉnh sửa sơ lược công trình</h4>
                    </div>
                    <input type="text" class="" name="idProject" value="${project.id}" hidden>
                    <table class="table table-borderless">
                        <tr>
                            <td class="col-6">Tên công trình:</td>
                            <td class="col-6"><input class="info-text" type="text" name="name"
                                                     value="${project.projectName}"
                                                     style="width: 50%">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Chủ nhà:</td>
                            <td><input class="info-text" type="text" name="customerName" value="${project.cusName}"
                                       style="width: 50%">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Số điện thoại:</td>
                            <td><input class="info-text" type="text" name="phone" value="${project.cusPhone}"
                                       style="width: 50%">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Địa chỉ công trình:</td>
                            <td><input class="info-text" type="text" name="address" value="${project.cusAddress}"
                                       style="width: 50%">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Diện tích xây dựng:</td>
                            <td><input class="info-text" type="text" name="constructionArea"
                                       value="${project.constructionArea}" style="width: 50%"> m<sup>2</sup>
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Chi phí thiết kế:</td>
                            <td><input class="info-text" type="text" name="expectedCost"
                                       value="${project.expectedCost}" style="width: 50%"> đồng
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Loại công trình:</td>
                            <td>
                                <div class="dropdown">
                                    <select name="categoryId" class="btn btn-secondary dropdown-toggle"
                                            style="width: 50%">
                                        <c:forEach items="${listCategory}" var="category">
                                            <c:if test="${category.id == project.type}">
                                                <option value="${category.id}"
                                                        selected> ${category.category_name}</option>
                                            </c:if>
                                            <c:if test="${category.id != project.type}">
                                                <option value="${category.id}"> ${category.category_name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>Thời gian bắt đầu:</td>
                            <td>
                                <input class="info-text" id="inputstartdate" type="date" name="startDate"
                                       value="${project.startDate}">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Thời gian dự kiến kết thúc:</td>
                            <td><input class="info-text" id="inputenddate" type="date" name="closureDate"
                                       value="${project.closureDate}">
                                <div class="text-danger error"></div>
                            </td>
                        </tr>

                        <tr>
                            <td>Mô tả:</td>
                            <td>
                                <textarea class="info-text" name="detail" cols="30"
                                          rows="3" style="width: 50%">${project.detail}</textarea>

                                <div class="text-danger error"></div>
                            </td>
                        </tr>
                        <tr>
                            <td>Upload thị file:</td>
                            <td>
                                <form>
                                    <div class="form-group">
                                        <input type="file" class="form-control" id="fileInput" multiple
                                               style="width: 50%" name="file">
                                    </div>
                                </form>
                                <div class="container js-file-list"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btn-update-summary">
                    <button type="button" class="btn-update btn btn-secondary" onclick="history.back()">Hủy bỏ</button>
                    <button onclick="return checkvalidate('#addProject')"
                            type="submit" class="btn-update btn btn-primary">Lưu
                    </button>
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
    <script>
        // function modallistproject(idbtn, idmodal, closemain) {
        //     // Get the modal
        //     var modal = document.querySelector(idmodal);
        //
        //     // Get the button that opens the modal
        //     var btn = document.querySelector(idbtn);
        //
        //     // Get the <span> element that closes the modal
        //     var span = document.querySelector(closemain);
        //     // span.addEventListener('click', event){
        //     //     event.style.display = "none";
        //     // }
        //     // When the user clicks the button, open the modal
        //
        //     modal.style.display = "block";
        //
        //     span.addEventListener("click", function () {
        //         modal.style.display = "none";
        //     });
        //
        //
        //
        // }
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