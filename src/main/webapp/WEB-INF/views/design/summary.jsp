<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%--                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">--%>
<%--                    <select style="border-radius: 5px; padding: 6px;">--%>
<%--                        <option class="btn btn-secondary">Đang thực hiện</option>--%>
<%--                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/design/project/summary?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                <%--                <c:if test="${pageContext.page==summary.jsp}">--%>
                        style="background: blue"
                <%--                </c:if>--%>
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Trạng thái"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/project/member-active?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
                <a class="test"><input
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
                        <td class="col-6">Chủ nhà:</td>
                        <td class="col-6">${project.cusName}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Số điện thoại:</td>
                        <td class="col-6">${project.cusPhone}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Địa chỉ công trình:</td>
                        <td class="col-6">${project.cusAddress}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Loại công trình:</td>
                        <c:if test="${project.type==1}">
                            <td class="col-6">Ngoại thất</td>
                        </c:if>
                        <c:if test="${project.type==2}">
                            <td class="col-6">Nội thất</td>
                        </c:if>
                    </tr>
                    <tr>
                        <td class="col-6">Diện tích xây dựng:</td>
                        <td class="col-6">${project.constructionArea}m<sup>2</sup></td>
                    </tr>
                    <tr>
                        <td class="col-6">Chi phí xây dựng:</td>
                        <td class="col-6">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${project.expectedCost}"/> VNĐ
                        </td>
                    </tr>
                    <tr>
                        <td class="col-6">Thời gian bắt đầu:</td>
                        <td class="col-6">${project.startDate}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Thời gian dự kiến kết thúc:</td>
                        <td class="col-6">${project.closureDate}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Thời gian kết thúc:</td>
                        <td class="col-6">${project.endDate}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Địa chỉ công trình:</td>
                        <td class="col-6">${project.cusAddress}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Mô tả:</td>
                        <td class="col-6">${project.detail}</td>
                    </tr>
                    <tr>
                        <td class="col-6">Hiển thị file:</td>
                        <td class="col-6">
                            <div class="container js-file-list"></div>
                        </td>
                    </tr>
                </table>
                <div>
                    <div>
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
                        <tr>
                            <td>
                                1
                            </td>
                            <td>
                                Diện tích xây dựng 200m2-300m2
                            </td>
                            <td>
                                20/12/2022
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                </div>
            </div>
<%--            <div style="display: flex; justify-content: space-between">--%>
<%--                <div></div>--%>
<%--                <a href="${pageContext.request.contextPath}/edit_summary?id=${project.id}">--%>
<%--                    <button class="btn" style="background-color: royalblue; color: white">--%>
<%--                        Chỉnh sửa--%>
<%--                    </button>--%>
<%--                </a>--%>
<%--            </div>--%>
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