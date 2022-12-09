<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Thành Viên Công Ty</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/member.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js" type="text/javascript"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<div class="body_page">
    <jsp:include page="/WEB-INF/views/nav_left.jsp"/>
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
                    <form action="searchMember" style="display: flex">
                        <%--start searching by role--%>
                        <div class="function-two" style="margin-right:20px;">
                            <select onchange="this.form.submit()" style="height: 38px" name="roleSearch"
                                    class="btn btn-secondary dropdown-toggle">
                                <option value="0">Thành viên</option>
                                <option value="3" ${roleSearch==3?"selected":""} >Thiết Kế</option>
                                <option value="2" ${roleSearch==2?"selected":""} >Trưởng Nhóm</option>
                            </select>

                        </div>
                        <%--end searching by role--%>

                        <%--start searching member by name--%>
                        <div class="function-thir">
                            <div class="function_search">
                                <div class="wap_search">
                                    <input name="nameSearch" value="${nameSearch}" style="margin-right: 10px;"
                                           type="text" class="search_term"
                                           placeholder="Tên thành viên">
                                    <input type="submit" class="btn btn-primary" value="Tìm kiếm">
                                </div>
                            </div>
                        </div>
                        <%--end seearching member by name--%>
                    </form>
                </div>
            </div>
        </div>

        <%-- start member list in table--%>
        <div>
            <table class="table table-bordered sortable">

                <tr>
                    <th class="col-3">Tên</th>
                    <th class="col-1">Chức danh</th>
                    <th class="col-1">Số điện thoại</th>
                    <th class="col-2">Email</th>
                    <th class="col-3">Địa chỉ</th>
                    <th class="col-1">Trạng thái</th>
                </tr>

                <c:forEach var="member" items="${memberList}">
                    <tr>
                        <td style="display: flex;justify-content:space-between">
                                <div class="col-8">
                                ${member.memberName}
                                </div>
                            <div class="col-4">
                            <form action="${pageContext.request.contextPath}/member/information" method="get">
                                <input name="id" value="${member.memberId}" hidden>
<%--                                <input type="submit" class="btn btn-primary chi-tiet" value="chi tiết">--%>
                                <button class=" chi-tiet" >Chi tiết</button>
                            </form>
                            </div>
                        </td>
                        <td>
                            <c:if test="${member.memberRole==2}">Trưởng nhóm</c:if>
                            <c:if test="${member.memberRole==3}">Thiết kế</c:if>
                        </td>
                        <td>${member.memberPhone}</td>
                        <td>${member.memberMail}</td>
                        <td>${member.memberAddress}</td>
                        <td>
                            <form action="changeMemberStatus">
                                <input value="${member.memberStatus}" name="status" hidden>
                                <input value="${member.memberCode}" name="username" hidden>
                                <c:if test="${member.memberStatus==1}">
                                    <button onclick="this.form.submit()" class="btn btn-success">Mở</button>
                                </c:if>
                                <c:if test="${member.memberStatus==2}">
                                    <button onclick="this.form.submit()" class="btn btn-danger">Chặn</button>
                                </c:if>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
        <%-- end member list in table--%>
        <%--start paging--%>
        <div class="pagination" style="display: flex;justify-content: end">
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

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>

<%--<script>--%>

<%--    const show = document.querySelector("#show-member");--%>

<%--    const popup = document.querySelector(".popup");--%>
<%--    let close = document.querySelector('.close_popup');--%>
<%--    close.addEventListener('click', function () {--%>
<%--        popup.classList.add("hide__popup");--%>
<%--    });--%>

<%--    show.addEventListener('click', function () {--%>
<%--        popup.classList.remove("hide__popup");--%>
<%--    })--%>
<%--    function modallistproject(idbtn, idmodal, closemain) {--%>
<%--        // Get the modal--%>
<%--        var modal = document.querySelector(idmodal);--%>

<%--        // Get the button that opens the modal--%>
<%--        var btn = document.querySelector(idbtn);--%>

<%--        // Get the <span> element that closes the modal--%>
<%--        var span = document.querySelector(closemain);--%>
<%--        // span.addEventListener('click', event){--%>
<%--        //     event.style.display = "none";--%>
<%--        // }--%>
<%--        // When the user clicks the button, open the modal--%>

<%--        modal.style.display = "block";--%>

<%--        span.addEventListener("click", function () {--%>
<%--            modal.style.display = "none";--%>
<%--        });--%>

<%--        // When the user clicks on <span> (x), close the modal--%>


<%--        let close = document.querySelector('.close_popup');--%>
<%--        close.addEventListener('click', function () {--%>
<%--            modal.style.display = "none";--%>
<%--        });--%>

<%--    }--%>
<%--</script>--%>

</body>
</html>