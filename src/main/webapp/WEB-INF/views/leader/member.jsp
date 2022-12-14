<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Thành viên dự án</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/member.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="body_page">
    <jsp:include page="nav_left.jsp"/>
    <div class="summary" style="margin-left: 20%;">
        <div class="top-details">
            <div class="list-top">
                <h3>${project.projectName}</h3>
                <form style="display: flex;" action="${pageContext.request.contextPath}/project/change-status"
                      method="post">
                    <input type="text" name="projectId" value="${project.id}" hidden="">
                    <div class="btn project-detail" style="margin: 0; padding: 0px 6px 0px 10px;">
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
                        style="background: blue"
                        value="Thành viên"></a>
                <a class="test" href="${pageContext.request.contextPath}/dashboard?id=${project.id}"><input
                        class="btn btn-secondary"
                        type="button"
                        value="Thống kê"></a>
            </div>


        </div>
        <h4>Thành viên dự án</h4>
        <div class="all-member">
            <div class="content-function-member">
                <%--Bat dau them thanh vien--%>
                <div>
                    <div>
                        <c:if test="${project.status == 1}">
                            <button onclick="modallistproject('#myBtn','#myModal','#close')" id="myBtn"
                                    class="btn btn-primary"><i class="fa-solid fa-plus"></i> Thêm thành viên
                            </button>
                            <p class="text-danger">${error}</p>
                        </c:if>
                        <div id="myModal" class="modal">
                            <!-- Modal content -->
                            <div class="modal-content" style="width: 50%; height: 40%;">
                                <span id="close" class="close">&times;</span>
                                <div class="project-add-task">
                                    <form action="addMember" method="get">
                                        <div class="info">
                                            <table class="table table-borderless">
                                                <tr>
                                                    <td>Tên thành viên:</td>
                                                    <td>
                                                        <select name="accountId"
                                                                class="btn btn-secondary dropdown-toggle"
                                                                style="padding-bottom: 10px">
                                                            <c:forEach items="${employeeList}" var="employee">
                                                                <option value="${employee.id_acc}"> ${employee.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <input name="id" value="${project.id}" type="text" hidden>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="button_click" style="display: flex;justify-content: end">

                                            <div class="btn_cancel">
                                                <button style="margin-right: 5px" type="button"
                                                        class="btn btn-secondary close_popup">Hủy
                                                    bỏ
                                                </button>
                                            </div>
                                            <div class="btn_ok">
                                                <input type="submit" class="btn btn-primary" value="Lưu">
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <%--ket thuc them thanh vien--%>

                <%-- tim kiem thanh vien --%>
                <div>
                    <form action="searchMemberInProject" style="display: flex;">
                        <input value="${project.id}" type="text" name="id" hidden>
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
                <%--ket thuc tim kiem thanh vien--%>
            </div>

            <%--bat dau danh sach thanh vien--%>
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
                                <%--<td style="display: flex;justify-content:space-between">--%>
                            <td>
                                    ${member.memberName}
                            </td>
                            <td>
                                <c:if test="${member.memberRole==2}">Trưởng nhóm</c:if>
                                <c:if test="${member.memberRole==3}">Thiết kế</c:if>
                            </td>
                            <td>${member.memberPhone}</td>
                            <td>${member.memberMail}</td>
                            <td>${member.memberAddress}</td>
                            <td >
                                <div>
                                <c:if test="${project.status == 1}">
                                    <form action="changeMemberStatus">
                                        <input value="${member.memberCode}" name="username" hidden>
                                        <input value="${projectId}" name="id" hidden>
<%--                                        <c:if test="${member.memberRole==2}">--%>
<%--                                            <button type="submit" class="btn btn-success" disabled>Đang hoạt động--%>
<%--                                            </button--%>
<%--                                        </c:if>--%>
                                        <c:if test="${member.memberRole==3}">
                                            <c:if test="${member.memberStatus==2}">
                                                <input value="1" name="status" hidden>
                                                <button type="submit" class="btn btn-danger">Đang bị chặn</button>
                                            </c:if>
                                            <c:if test="${member.memberStatus==1}">
                                                <input value="2" name="status" hidden>
                                                <button type="submit" class="btn btn-success">Đang hoạt động
                                                </button>
                                            </c:if>
                                        </c:if>
                                    </form>
                                </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <%--ket thuc danh sach thanh vien--%>


            <%--bat dau paging--%>
            <div class="pagination">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${page != 1}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/project/member?id=${projectId}&page=${page-1}"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item"><a class="page-link"
                                                     href="${pageContext.request.contextPath}/project/member?id=${projectId}&page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${page != endPage}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="${pageContext.request.contextPath}/project/member?id=${projectId}&page=${page+1}"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
            <%--ket thuc paging--%>

        </div>
    </div>

    <%--Pop-up add member--%>
    <%--    <div class="popup hide__popup">--%>
    <%--        <div class="popup__content">--%>
    <%--            <div class="title">--%>
    <%--                <h4>Thêm thành viên</h4>--%>
    <%--            </div>--%>
    <%--            <form action="addMember" method="get">--%>
    <%--                <input name="id" value="${project.id}" type="text" hidden>--%>
    <%--                <div class="info">--%>
    <%--                    <table class="table table-borderless">--%>
    <%--                        <tr>--%>
    <%--                            <td>Tên thành viên:</td>--%>
    <%--                            <td>--%>
    <%--                                <select name="accountId" class="btn btn-secondary dropdown-toggle" style="padding-bottom: 10px">--%>
    <%--                                    <c:forEach items="${employeeList}" var="employee">--%>
    <%--                                        <option value="${employee.id_acc}"  > ${employee.name}</option>--%>
    <%--                                    </c:forEach>--%>
    <%--                                </select>--%>


    <%--                            </td>--%>
    <%--                        </tr>--%>
    <%--                    </table>--%>
    <%--                </div>--%>
    <%--                <div class="button_click">--%>

    <%--                    <div class="btn_cancel">--%>
    <%--                        <button type="button" class="btn btn-secondary close_popup">Hủy--%>
    <%--                            bỏ--%>
    <%--                        </button>--%>
    <%--                    </div>--%>
    <%--                    <div class="btn_ok">--%>
    <%--                        <input type="submit" class="btn btn-primary" value="Lưu">--%>
    <%--                    </div>--%>

    <%--                </div>--%>
    <%--            </form>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <%--end Pop-up add member--%>


</body>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
<script>
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
        let close = document.querySelector('.close_popup');
        close.addEventListener('click', function () {
            modal.style.display = "none";
        });
    }

    // const show = document.querySelector("#show-member");
    //
    // const popup = document.querySelector(".popup");
    // let close = document.querySelector('.close_popup');
    // close.addEventListener('click', function () {
    //     popup.classList.add("hide__popup");
    // });
    //
    // show.addEventListener('click', function () {
    //     popup.classList.remove("hide__popup");
    // })
</script>
<script>
    var mess = '${mess}'
    if (mess != '') {
        alert(mess);
    }
</script>
</html>