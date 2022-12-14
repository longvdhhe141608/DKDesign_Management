<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Yêu Cầu Của Khách Hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/requirement.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/design/header.jsp"/>
<div class="body_page">
    <jsp:include page="/WEB-INF/views/design/nav_left.jsp"/>
    <div class="requiment summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>
                <%--                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">--%>
                <%--                    <select style="border: none; padding: 6px;">--%>
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

                <%--                </c:if>--%>
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Công việc"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Trạng thái"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        style="background: blue"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test"
                   href="${pageContext.request.contextPath}/design/project/member-active?project-id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/design/dashboard?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <h4>Thông tin yêu cầu của khách hàng</h4>


        <%--        <div class="add" id="show-member">--%>

        <%--            <button class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm yêu cầu</button>--%>
        <%--        </div>--%>

        <div class="table_content requiment-main ">
            <div class=" requiment-main-left">
                <table class="table table-bordered ">
                    <thead>
                    <tr>
                        <th scope="col" class="col-2">Vị trí</th>
                        <th scope="col" class="col-5">Yêu cầu</th>
                        <th scope="col" class="col-3">Ngày tạo</th>
                        <th scope="col" class="col-2">Trạng thái</th>
                        <%--                        <th scope="col"></th>--%>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requirements}" var="i">
                        <c:if test="${i.status != 3}">
                            <tr>
                                <td>${i.requirementName}</td>
                                <td>${i.requirementDetail}</td>
                                <td>
                                    <fmt:formatDate value="${i.requirementDate}" var="crd" pattern="dd/MM/yyyy"/>
                                        ${crd}
                                </td>
                                <td>
                                    <c:if test="${i.status != 3}">${i.statusName}</c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="pagination">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${page != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${projectId}&page=${page-1}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a class="page-link"
                                                         href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${projectId}&page=${i}">${i}</a></li>
                            </c:forEach>

                            <c:if test="${page != endPage}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${projectId}&page=${page+1}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
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
                    <th scope="col">Ngày chỉnh sửa</th>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
<script>

</script>


</body>

</html>