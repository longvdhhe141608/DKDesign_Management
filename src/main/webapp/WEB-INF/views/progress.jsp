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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
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
                <h3>${project.projectName}</h3>
                <div class="btn project-detail" style="margin: 0; padding: 3px 6px 6px 10px">
                    <select style="border: none; padding: 6px;">
                        <option class="btn btn-secondary">Đang thực hiện</option>
                        <option class="btn btn-secondary" ${project.status==1?"selected":""}}>Đã hoàn thành</option>
                    </select>
                </div>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/project/summary?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}list_task?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/plan_approval?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        style="background: blue;" value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary" type="button"
                        value="Thống kê"></a>
            </div>
        </div>
        <div>
            <h4>Tiến độ công trình</h4>
            <div class="my-task-search">
                <div class="my-task-search-name" style="margin-right:10px ;">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            Tìm kiếm
                        </a>
                        <div class=" dropdown-menu">
                            <a class="dropdown-item" href="#">tên công trình</a>
                            <a class=" dropdown-item" href="#">thời gian</a>
                            <a class=" dropdown-item" href="#">loại công trình</a>
                        </div>
                    </div>
                </div>
                <div class="">
                    <div class="function_search">
                        <form action="">
                            <div class="wap_search">
                                <input style="margin-right: 10px;" type="text" class="search_term"
                                       placeholder="tên công việc">
                                <button type="submit" class="btn btn-primary"> tìm kiếm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <table class="table table-bordered">
                <tr>
                    <th scope="col">Công việc</th>
                    <th scope="col">Người thực hiện</th>
                    <th scope="col">Ngày bắt đầu</th>
                    <th scope="col">Ngày dự kiến kết thúc</th>
                    <th scope="col">Ngày kết thúc</th>
                    <th scope="col">Tiến độ</th>
                    <th scope="col">Trạng thái</th>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/10/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>90%</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 2</td>
                    <td>Nguyễn như huấn</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/10/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>100%</td>
                    <td style="display: flex; justify-content: center;">
                        <button class="btn btn-primary">Đồng
                            ý
                        </button>
                        <button class="btn btn-secondary">Hủy bỏ</button>
                    </td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>90%</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>90%</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Thiết kế mặt sàn tầng 1</td>
                    <td>Nguyễn như huấn</td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>
                        <div class="name-input" style="width: 150px;">
                            <input class="form-control" formControlName="dob" type="datetime" value="20/11/2022">
                        </div>
                    </td>
                    <td>90%</td>
                    <td></td>
                </tr>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
</body>
</html>