<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${project.projectName} - Sơ Lược Công Trình</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="sweetalert2.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
    <style>
        .swal-wide {
            width: 850px !important;
        }
        .custom_image {
            width: 800px;
            height: 550px;
            background-size: cover;
            object-fit: contain;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="body_page">

    <jsp:include page="nav_left.jsp"/>

    <div class="summary">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>


                <form style="display: flex;" action="${pageContext.request.contextPath}/project/change-status"
                      method="post">
                    <input type="text" name="projectId" value="${project.id}" hidden="">
                    <div class="btn project-detail" style="margin: 0; padding: 0px 6px 0px 10px; ">
                        <select name="statusId" class="btn btn-secondary dropdown-toggle" style="padding-bottom: 10px">
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
                    <h4>Sơ lược công trình</h4>
                </div>
                <table class="table table-borderless"  style="border: 0;">
                    <tr>
                        <td class="col-6">Chủ nhà:</td>
                        <td class="col-6">${project.cusName}</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td id="phone">${project.cusPhone}</td>
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
                        <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${project.expectedCost}"/>
                            VNĐ
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian bắt đầu:</td>
                        <td>
                            <fmt:formatDate value="${project.startDate}" var="std" pattern="dd/MM/yyyy"/>
                            ${std}
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian dự kiến kết thúc:</td>
                        <td>
                            <fmt:formatDate value="${project.closureDate}" var="cld" pattern="dd/MM/yyyy"/>
                            ${cld}
                        </td>
                    </tr>
                    <tr>
                        <td>Thời gian kết thúc:</td>
                        <td>
                            <fmt:formatDate value="${project.endDate}" var="ed" pattern="dd/MM/yyyy"/>
                            ${ed}
                        </td>
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
                        <td>
                            <div id="fileInput" class="container js-file-list">
                                <c:forEach items="${listImage}" var="image">
                                    <button type="button" style="border-radius: 5px"
                                            onclick="showImage(this.getAttribute('data-url'))"
                                            data-url="${image.fileUrl}">
                                        <img src="<c:url value="${image.fileUrl}"/>" alt=""
                                             style="max-height: 150px; min-height: 150px; max-width: 150px; min-width: 150px">
                                    </button>
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="display: flex; justify-content: end">

                <c:if test="${project.status == 1}">
                    <a style="margin-right: 5px"
                       href="${pageContext.request.contextPath}/allProject/delete_project?projectId=${project.id}">
                        <button class="btn btn-danger">
                            Xóa
                        </button>
                    </a>
                    <a href="${pageContext.request.contextPath}/edit_summary?id=${project.id}">
                        <button class="btn btn-primary">
                            Chỉnh sửa
                        </button>
                    </a>
<%--                    <c:if test="${listImage.size() > 0}">--%>
<%--                        <div>--%>
<%--                            <button style="margin-left: 5px"; onclick="modallistproject('#myBtn-add-project','#myModal-add','#close1')"--%>
<%--                                    id="myBtn-add-project"--%>
<%--                                    class="btn btn-primary"> Xóa file--%>
<%--                            </button>--%>
<%--                            <div id="myModal-add" class="modal">--%>
<%--                                <!-- Modal content -->--%>
<%--                                <div class="modal-content" style=" width: 50%;height: 100%;">--%>
<%--                                    <span id="close1" class="close">&times;</span>--%>
<%--                                    <div class="project-add-task">--%>
<%--                                        <form id="add-sub-task"--%>
<%--                                              action="${pageContext.request.contextPath}/project/delete-file"--%>
<%--                                              method="get">--%>
<%--                                            <input type="text" value="${project.id}" hidden name="projectId">--%>
<%--                                            <div class="popup__content">--%>
<%--                                                <div class="title">--%>
<%--                                                    <h4>--%>
<%--                                                        <div>Danh sách file</div>--%>
<%--                                                        <div class="text-danger error"></div>--%>
<%--                                                    </h4>--%>
<%--                                                </div>--%>
<%--                                                <div class="info">--%>
<%--                                                    <table class="table table-borderless">--%>
<%--                                                        <c:forEach items="${listImage}" var="image">--%>
<%--                                                            <tr>--%>
<%--                                                                <td><input type="checkbox" value="${image.id}"--%>
<%--                                                                           name="listFile"></td>--%>
<%--                                                                <td>--%>
<%--                                                                    <img style="width: 100px; height: 100px;"--%>
<%--                                                                         src="${image.fileUrl}" alt="">--%>
<%--                                                                </td>--%>
<%--                                                            </tr>--%>
<%--                                                        </c:forEach>--%>
<%--                                                    </table>--%>
<%--                                                </div>--%>
<%--                                                <div class="" style="display: flex;justify-content: end">--%>
<%--                                                    <div></div>--%>
<%--                                                    <div class="btn_cancel" style="margin-right: 5px">--%>
<%--                                                        <button type="button" class="btn btn-secondary close_popup">--%>
<%--                                                            Hủy bỏ--%>
<%--                                                        </button>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="btn_ok">--%>
<%--                                                        <button type="submit" class="btn btn-primary">Xóa File--%>
<%--                                                        </button>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:if>--%>
                </c:if>
            </div>
            <div>
                <div style="margin-bottom: 10px">
                    <button class="btn btn-primary">Lịch sử</button>
                </div>
                <div>
                    <table class="table table-bordered">
                        <thead>
                        <th scope="col">Lần</th>
                        <th scope="col">Nội dung</th>
                        <th scope="col">Thời gian</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${listHistory}" var="history">
                            <tr>
                                <td>
                                        ${history.revision_no}
                                </td>
                                <td>
                                        ${history.revision_detail}
                                </td>
                                <td>
                                    <fmt:formatDate value="${history.revision_date}" var="rvd" pattern="dd/MM/yyyy"/>
                                        ${rvd}
                                </td>
                            </tr>

                        </c:forEach>


                        </tbody>
                    </table>
                </div>
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

<script>
    var mess = '${mess}'
    if (mess != '') {
        alert(mess);
    }
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

    function modallistproject(idbtn, idmodal, closemain) {
        // Get the modal
        var modal = document.querySelector(idmodal);

        // Get the button that opens the modal
        var btn = document.querySelector(idbtn);

        // Get the <span> element that closes the modal
        var span = document.querySelector(closemain);
        // span.addEventListener('click', event){
        //     event.style.display = "none";
        // }
        // When the user clicks the button, open the modal

        modal.style.display = "block";

        span.addEventListener("click", function () {
            modal.style.display = "none";
        });

        // When the user clicks on <span> (x), close the modal


        // When the user clicks anywhere outside of the modal, close it
        let close = document.querySelector('.close_popup');
        close.addEventListener('click', function () {
            modal.style.display = "none";
        });
    }
</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.15/dist/sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<%--<script>--%>
<%--    var el = document.getElementById('phone');--%>
<%--    phone.innerText = phone.innerText.replace(/^(\d{4})/, '($1) ');--%>
<%--</script>--%>
</body>
</html>