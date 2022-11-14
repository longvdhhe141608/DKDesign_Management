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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/member.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

</head>

<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary" style="margin-left: 20%;">


        <h4>Thành viên công ty</h4>
        <div class="all-member">

            <div class="content-function-member">
                <div class="function-one">
                    <a href="${pageContext.request.contextPath}/admin/createAccount">
                        <button class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm thành viên</button>
                    </a>
                </div>

                <div style="display: flex;">
                    <%--start searching by role--%>
                    <div class="function-two" style="margin-right:20px ;">
                        <div class="dropdown">
                            <a class="btn btn-secondary dropdown-toggle" href="#" role="button"
                               data-toggle="dropdown" aria-expanded="false">
                                Tìm kiếm
                            </a>

                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">thiết kế</a>
                                <a class="dropdown-item" href="#">trưởng nhóm</a>
                            </div>
                        </div>
                    </div>
                    <%--end searching by role--%>

                    <%--start searching member by name--%>
                    <div class="function-thir">
                        <div class="function_search">
                            <form action="#findMember" method="post">
                                <div class="wap_search">
                                    <input style="margin-right: 10px;" type="text" class="search_term"
                                           placeholder="tên thành viên">
                                    <input type="submit" class="btn btn-primary" value="tìm kiếm">
                                </div>
                            </form>
                        </div>
                    </div>
                    <%--end seearching member by name--%>

                </div>
            </div>
        </div>

        <%-- start member list in table--%>
        <div>
            <table class="table table-bordered">
                <tr>
                    <th scope="col">Tên</th>
                    <th scope="col">Chức danh</th>
                    <th scope="col">Số điện thoại</th>
                    <th scope="col">Email</th>
                    <th scope="col">Địa chỉ</th>
                    <th scope="col">Trạng thái</th>
                </tr>

                <c:forEach var="member" items="${memberList}">
                    <tr>
                        <td style="display: flex;justify-content:space-between">${member.memberName}
                            <a href="${pageContext.request.contextPath}/information">
                                <input name="id" value="${member.memberId}" hidden>
                                <input type="submit" class="btn btn-primary" value="chi tiết">
                            </a>
                        </td>
                        <td>${member.memberRole}</td>
                        <td>${member.memberPhone}</td>
                        <td>${member.memberMail}</td>
                        <td>${member.memberAddress}</td>
                        <td>
                            <button class="btn btn-success">mở</button>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
        <%-- end member list in table--%>
        <%--start paging--%>
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
        <%--end paging--%>
    </div>
</div>

<%--start popup add member--%>
<div class="popup hide__popup">
    <div class="popup__content">
        <div class="title">
            <h4>Thêm thành viên</h4>
        </div>
        <div class="info">
            <table class="table table-borderless">
                <tr>
                    <td>Tên thành viên:</td>
                    <td><input class="info-text" type="text"></td>
                </tr>
            </table>
        </div>
        <div class="button_click">
            <div></div>
            <div class="btn_cancel">
                <button type="button" class="btn btn-secondary close_popup">Hủy
                    bỏ
                </button>
            </div>
            <div class="btn_ok">
                <button type="button" class="btn btn-primary">Lưu</button>
            </div>
        </div>
    </div>
</div>
<%--end popup add member--%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>

<script>

    const show = document.querySelector("#show-member");

    const popup = document.querySelector(".popup");
    let close = document.querySelector('.close_popup');
    close.addEventListener('click', function () {
        popup.classList.add("hide__popup");
    });

    show.addEventListener('click', function () {
        popup.classList.remove("hide__popup");
    })
</script>

</body>
</html>