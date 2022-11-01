<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/calendar.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
    <script src="<c:url value="/resources/assets/js/bodyAdmin.js"/>"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
><div class="body_page">
    <div id="narbar_menu"></div>
    <div style="margin-left: 300px;">
        <div class="top">
            <div class="list-top">
                <h1>Biệt thự nhà dân</h1>
                <a class="project-detail">
                    <select>
                        <option>Đang thực hiện</option>
                        <option>Đã hoàn thành</option>
                    </select></a>
            </div>
            <div class="list-task-head">

                <a class="project-detail" href="summary.jsp"><input type="button" value="Sơ lược"></a>
                <a class="list" href="list_task.jsp"><input type="button" value="Danh sách"></a>
                <a class="calendar" href="calendar.jsp"><input type="button" value="Lịch"></a>
                <a class="customer-request" href="requirement.jsp"><input type="button"
                                                                           value="Yêu cầu của khách hàng"></a>
                <a class="project-progress" href="progress.jsp"><input type="button" value="Tiến độ"></a>
                <a class="project-member" href="member.jsp"><input type="button" value="Thành viên"></a>
                <a class="statistic" href="dashboard.jsp"><input type="button" value="Thống kê"></a>
            </div>
        </div>
        <h1>Thành viên dự án</h1>
        <div class="all-member">

            <button type="button" class="btn btn-primary btn-add-member" data-toggle="modal"
                    data-target="#exampleModal">
                +thêm thành viên
            </button>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thêm thành viên</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="text">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                            <button type="button" class="btn btn-primary">Thêm</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="search-member">
                <input class="search-all-member-name" type="search" placeholder="Tìm kiếm">
                <input type="button" class="search-all-member-soft" value="sort by name"></input>
            </div>
        </div>
        <div>
            <table class="table table-bordered">
                <tr>

                    <td>Tên</td>
                    <td>Chức danh</td>
                    <td>Số điện thoại</td>
                    <td>Email</td>
                    <td>địa chỉ</td>
                    <td>trạng thái</td>
                </tr>
                <c:forEach items="${requestScope.memberList}" var="member">
                    <tr>
                        <td>${member.memberName}</td>
                        <td>${member.memberRole}</td>
                        <td>${member.memberPhone}</td>
                        <td>${member.memberMail}</td>
                        <td>${member.memberAddress}</td>
                        <td>${member.memberStatus}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<jsp:include page=""></jsp:include>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>

</html>