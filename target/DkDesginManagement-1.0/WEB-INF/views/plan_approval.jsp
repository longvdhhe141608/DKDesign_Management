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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="list-task body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary ">
        <div class="top-details">
            <div class="list-top">
                <h3>Biệt thự nhà dân</h3>
                <a class="btn project-detail"><select>
                    <option class="btn btn-secondary">Đang thực hiện</option>
                    <option class="btn btn-secondary">Đã hoàn thành</option>
                </select></a>
            </div>
            <div class="list-task-head">
                <a class="test" href="${pageContext.request.contextPath}/summary"><input class="btn btn-secondary " type="button"
                                                           value="Sơ lược"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task"><input class="btn btn-secondary" type="button"
                                                             value="Công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/list_task"><input class="btn btn-secondary" type="button"
                                                             style="background: blue;" value="Duyệt công việc"></a>
                <a class="test" href="${pageContext.request.contextPath}/calendar"><input class="btn btn-secondary" type="button"
                                                            value="Lịch"></a>
                <a class="test" href="${pageContext.request.contextPath}/requirement"><input class="btn btn-secondary" type="button"
                                                               value="Yêu cầu của khách hàng"></a>
                <a class="test" href="${pageContext.request.contextPath}/progress"><input class="btn btn-secondary" type="button"
                                                            value="Tiến độ"></a>
                <a class="test" href="${pageContext.request.contextPath}/member"><input class="btn btn-secondary" type="button"
                                                          value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard"><input class="btn btn-secondary" type="button"
                                                             value="Thống kê"></a>
            </div>
        </div>
        <div class="plan">
            <div class="title">
                <h4>Phê duyệt công việc</h4>
            </div>
            <div class="my-task-search">
                <div class="my-task-search-name" style="margin-right:10px ;">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                           aria-expanded="false">
                            Tìm kiếm tên
                        </a>
                        <div class=" dropdown-menu">
                            <a class="dropdown-item" href="#">Nguyễn Như Huấn</a>
                            <a class=" dropdown-item" href="#">Hoàng Thị Thu Hương</a>
                            <a class=" dropdown-item" href="#">Vũ Đình Hoàng Long</a>
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
            <div class="table_content">
                <div class="">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">Công việc</th>
                            <th scope="col">Người thực hiện</th>
                            <th scope="col">Thời gian bắt đầu</th>
                            <th scope="col">Thời gian dự kiến kết thúc</th>
                            <th scope="col">Số lượng file</th>
                            <th scope="col">Phê duyệt</th>
                            <th scope="col">Ghi chú</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;justify-content: space-between;">
                                <button
                                        class="btn btn-primary">Đồng ý
                                </button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;">
                                <button class="btn btn-primary">Đồng ý</button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;">
                                <button class="btn btn-primary">Đồng ý</button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;">
                                <button class="btn btn-primary">Đồng ý</button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;">
                                <button class="btn btn-primary">Đồng ý</button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;">
                                <button class="btn btn-primary">Đồng ý</button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;">
                                <button class="btn btn-primary">Đồng ý</button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td style="justify-content: center;">
                                <form class="form-name-project" action="">
                                    <div class="name-project">
                                        Biệt thự nhà dân Biệt thự nhà dân Biệt
                                        thự
                                        nhà dân Biệt thự nhà
                                        dân Biệt thự nhà dân Biệt thự nhà dân
                                    </div>
                                </form>
                            </td>
                            <td>Nguyễn Như Huấn</td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/10/2022">
                                </div>
                            </td>
                            <td>
                                <div class="name-input" style="width: 150px;">
                                    <input class="form-control" formControlName="dob" type="datetime"
                                           value="20/11/2022">
                                </div>
                            </td>
                            <td>2</td>
                            <td style="display: flex;">
                                <button class="btn btn-primary">Đồng ý</button>
                                <button class="btn btn-secondary">Hủy bỏ</button>
                            </td>
                            <td><input type="text"></td>
                        </tr>
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