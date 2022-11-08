<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/myTask.css"/>"/>

    <title>Hello, world!</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
    </script>

</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="container_content body_page">
    <jsp:include page="nav_left.jsp"></jsp:include>

    <div class="content_first">
        <div class="top">
            <div class="list-top">
                <h1>Biệt thự nhà dân</h1>
                <a class="project-detail"><select>
                    <option>Đang thực hiện</option>
                    <option>Đã hoàn thành</option>

                </select></a>
            </div>
            <div class="list-task-head">
                <a class="project-detail" href="${pageContext.request.contextPath}/summary"><input type="button" value="Sơ lược"></a>
                <a class="list" href="${pageContext.request.contextPath}/Task/list_task"><input type="button" value="Danh sách"></a>
                <a class="calendar" href="${pageContext.request.contextPath}/calendar"><input type="button" value="Lịch"></a>
                <a class="customer-request" href="${pageContext.request.contextPath}/requirement"><input type="button"
                                                                       value="Yêu cầu của khách hàng"></a>
                <a class="project-progress" href="${pageContext.request.contextPath}/progress"><input type="button" value="Tiến độ"></a>
                <a class="project-member" href="${pageContext.request.contextPath}/member"><input type="button" value="Thành viên"></a>
                <a class="statistic" href="${pageContext.request.contextPath}/dashboard"><input type="button" value="Thống kê"></a>
            </div>
        </div>
        <div class="title">
            <h2>Công việc của tôi</h2>
        </div>
        <div class="content-function">
            <div></div>
            <div class="function-one">
                <a href="">
                    <svg width="33" height="32" viewBox="0 0 33 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_448_5554)">
                            <path
                                    d="M26.125 17.3333H17.875V25.3333H15.125V17.3333H6.875V14.6667H15.125V6.66667H17.875V14.6667H26.125V17.3333Z"
                                    fill="black"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_448_5554">
                                <rect width="33" height="32" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                    Thêm công việc
                </a>
            </div>
            <div class="function-two">
                <div class="dropdown show">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown link
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </div>
            </div>
            <div class="function-thir">
                <div class="dropdown show">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink1"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown link
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="table_content">
            <div class="table-responsive-sm">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Công việc</th>
                        <th scope="col"></th>
                        <th scope="col">Thời hạn</th>
                        <th scope="col">Tên công trình</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <svg width="24" height="26" viewBox="0 0 24 26" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_448_5318)">
                                    <path d="M12 4.33333C16.41 4.33333 20 8.2225 20 13C20 17.7775 16.41 21.6667 12 21.6667C7.59 21.6667 4 17.7775 4 13C4 8.2225 7.59 4.33333 12 4.33333ZM12 2.16666C6.48 2.16666 2 7.02 2 13C2 18.98 6.48 23.8333 12 23.8333C17.52 23.8333 22 18.98 22 13C22 7.02 17.52 2.16666 12 2.16666ZM12 16.25L8 11.9167H16L12 16.25Z"
                                          fill="black"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_448_5318">
                                        <rect width="24" height="26" rx="10" fill="white"/>
                                    </clipPath>
                                </defs>
                            </svg>
                            Gặp khách hàng
                        </td>
                        <td>
                            <div class="detail">
                                <a href="">Chi tiết

                                    <svg width="8" height="12" viewBox="0 0 8 12" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M1.75 10.5L6.25 6L1.75 1.5" stroke="#979797" stroke-width="2"
                                              stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>

                                </a>
                            </div>

                        </td>
                        <td>10/10/2022</td>
                        <td>Biet thu nha dan</td>
                    </tr>
                    <c:forEach items="${requestScope.myTaskList}" var="task">
                        <tr>
                            <td>
                                <svg width="24" height="26" viewBox="0 0 24 26" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_448_5318)">
                                        <path d="M12 4.33333C16.41 4.33333 20 8.2225 20 13C20 17.7775 16.41 21.6667 12 21.6667C7.59 21.6667 4 17.7775 4 13C4 8.2225 7.59 4.33333 12 4.33333ZM12 2.16666C6.48 2.16666 2 7.02 2 13C2 18.98 6.48 23.8333 12 23.8333C17.52 23.8333 22 18.98 22 13C22 7.02 17.52 2.16666 12 2.16666ZM12 16.25L8 11.9167H16L12 16.25Z"
                                              fill="black"/>
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_448_5318">
                                            <rect width="24" height="26" rx="10" fill="white"/>
                                        </clipPath>
                                    </defs>
                                </svg>
                                ${task.taskName}
                            </td>
                            <td>
                                <div class="detail">
                                    <a href="">Chi tiết

                                        <svg width="8" height="12" viewBox="0 0 8 12" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path d="M1.75 10.5L6.25 6L1.75 1.5" stroke="#979797" stroke-width="2"
                                                  stroke-linecap="round" stroke-linejoin="round"/>
                                        </svg>

                                    </a>
                                </div>

                            </td>
                            <td>${task.deadline}</td>
                            <td>${task.projectName}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

</body>

</html>