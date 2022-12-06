<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <title>Trang Chủ</title>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <jsp:include page="/WEB-INF/views/design/header.jsp"/>
    <div class="body_page">
        <jsp:include page="/WEB-INF/views/design/nav_left.jsp"/>
        <div class="summary">
            <div class="title">
                <div>
                    <h2 style=" margin-top: 50px;">Xin chào, ${sessionScope.loginUser.username}</h2>
                </div>
                <div>
                    <%--                <h4>Tất cả công trình</h4>--%>
                </div>
            </div>
            <div class="">
                <%--starting tìm kiếm công trình--%>
                <div style="display: flex; justify-content: end; margin-bottom: 20px">
                    <form action="${pageContext.request.contextPath}/design/project/view-all-project" method="get"
                          style="display: flex; justify-content: end;">
                        <div style="margin-right: 10px">
                            <div class="dropdown">
                                <%--                            <form action="${pageContext.request.contextPath}/design/project/search-by-year"--%>
                                <%--                                  method="post">--%>
                                <select style="height: 38px" name="date" class="btn btn-secondary dropdown-toggle"
                                        name="date">
                                    <option ${status == 0 ? "selected":""} value="default">Tất cả</option>
                                    <option ${status == 2022 ? "selected":""} value="2022">2022</option>
                                    <option ${status == 2021 ? "selected":""} value="2021">2021</option>
                                    <option ${status == 2020 ? "selected":""} value="2020">2020</option>
                                    <option ${status == 2019 ? "selected":""} value="2019">2019</option>
                                </select>
                            </div>
                        </div>
                        <div class="">
                            <div class="function_search">
                                <%--                            <form action="${pageContext.request.contextPath}/design/project/search-by-name"--%>
                                <%--                                  method="post">--%>
                                <div class="wap_search">
                                    <input style="margin-right: 2px;" type="text" class="search_term"
                                           name="textSearch" placeholder="Tên công trình">
                                    <button type="submit" class="btn btn-primary"> Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <%--ending tìm kiếm công trình--%>

            </div>
            <div class="table_content">
                <div class=" table-responsive-sm">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col" class="col-4">Tên công trình</th>
                            <th scope="col" class="col-2">Loại công trình</th>
                            <th scope="col" class="col-1">Thời gian bắt đầu</th>
                            <th scope="col" class="col-1">Thời gian dự kiến kết thúc</th>
                            <th scope="col" class="col-1">Thời gian kết thúc</th>
                            <th scope="col" class="col-1">Tiến độ</th>
                            <th scope="col" class="col-2">Trạng thái</th>
                        </tr>

                        </thead>
                        <tbody class="list-project">
                        <c:forEach var="i" items="${listAllProject}">
                            <tr class="each-project">
                                <td class="name-and-link">

                                        <div class="name-project col-8">
                                                ${i.projectName}
                                        </div>
                                        <div class="links col-4">
                                            <a class="link-detail"
                                               href="${pageContext.request.contextPath}/design/project/summary?id=${i.id}">
                                                <button class="btn-chi-tiet">Chi tiết</button>
                                            </a>
                                        </div>

                                </td>

                                <td>
                                    <c:if test="${i.type == 1}">
                                        Thiết kế ngoại thất
                                    </c:if>
                                    <c:if test="${i.type == 2}">
                                        Thiết kế nội thất
                                    </c:if>
                                    <c:if test="${i.type == 3}">
                                        Thiết kế ngoại thất + Thiết kế nội thất
                                    </c:if>
                                </td>

                                <td>
                                    <div class="name-input">
                                        <fmt:formatDate value="${i.startDate}" var="std" pattern="dd/MM/yyyy"/>
                                            ${std}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input">
                                        <fmt:formatDate value="${i.closureDate}" var="cld" pattern="dd/MM/yyyy"/>
                                            ${cld}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input">
                                        <fmt:formatDate value="${i.endDate}" var="dl" pattern="dd/MM/yyyy"/>
                                            ${dl}
                                    </div>
                                </td>
                                <td>
                                    <div class="name-input">

                                    </div>
                                </td>
                                <td>
                                    <c:if test="${i.status == 2}">
                                        Đang bàn giao
                                    </c:if>
                                    <c:if test="${i.status == 1}">
                                        Đang thực hiện
                                    </c:if>
                                    <c:if test="${i.status == 3}">
                                        Đã hoàn thành
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="pagination" style="display: flex;justify-content: end">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${page != 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/design/project/view-all-project?page=${page-1}&date=${date}&textSearch=${textSearch}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item"><a class="page-link"
                                                         href="${pageContext.request.contextPath}/design/project/view-all-project?page=${i}&date=${date}&textSearch=${textSearch}">${i}</a></li>
                            </c:forEach>

                            <c:if test="${page != endPage}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/design/project/view-all-project?page=${page+1}&date=${date}&textSearch=${textSearch}"
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
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>


<script src="<c:url value="/resources/assets/js/pagination-all-project.js"/>"></script>
<%--<script>--%>
<%--    const show = document.querySelector("#show");--%>

<%--    const popup = document.querySelector(".popup");--%>
<%--    let close = document.querySelector('.close_popup');--%>
<%--    close.addEventListener('click', function () {--%>
<%--        popup.classList.add("hide__popup");--%>
<%--    });--%>

<%--    show.addEventListener('click', function () {--%>
<%--        popup.classList.remove("hide__popup");--%>
<%--    })--%>
<%--    var mess = '${mess}'--%>
<%--    if (mess != '') {--%>
<%--        alert(mess);--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>