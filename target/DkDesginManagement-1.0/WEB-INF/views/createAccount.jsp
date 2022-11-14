<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Create Account</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/footerPage.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <jsp:include page="header.jsp"/>
    <div class="list-task body_page">
        <jsp:include page="nav_left.jsp"/>
        <div style="margin-left:20% ;">

            <script>
                function togglePassword(bypass, bytoggleBtn) {
                    let password = document.getElementById(bypass);
                    let toggleBtn = document.getElementById(bytoggleBtn);
                    toggleBtn.onclick = (() => {
                        if (password.type === "text") {
                            password.type = "password";
                            toggleBtn.classList.remove("bi bi-eye-slash-fill");
                        } else {
                            password.type = "text";
                            toggleBtn.classList.add("bi bi-eye-slash-fill");
                        }
                    });
                }
            </script>

            <h4>Tạo tài khoản</h4>
            <form action="create" method="post">
                <table class="table table-borderless" style="width: 40%;">
                    <tr>
                        <p class="text-danger">${error1}</p>
                        <td>
                            <a>Mã nhân viên:</a>
                        </td>

                        <td>
                            <input hidden id="userList" name="userList" value="${accountList}">
                            <input pattern="[a-z0-9]+$" id="username" name="username" type="text" required>
                        </td>

                    </tr>
                    <tr>
                        <p class="text-danger">${error2}</p>
                        <td>
                            <a>mật khẩu:</a>
                        </td>
                        <td>
                            <input pattern="[a-z0-9]+$" value="${pass}" id="password" name="password" type="password" required>
                            <i id="toggleBtn"
                               onclick="togglePassword('password', 'toggleBtn')"
                               class="fas fa-eye">
                            </i>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a>Nhập lại mật khẩu:</a>
                        </td>
                        <td>
                            <input pattern="[a-z0-9]+$" value="${passCheck}" id="passwordCheck" name="passwordCheck" type="password" required>
                            <i id="toggleBtnC"
                               onclick="togglePassword('passwordCheck', 'toggleBtnC')"
                               class="fas fa-eye">
                            </i>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a>Vai trò:</a>
                        </td>
                        <td>
                            <input name="role" type="radio" value="2" required/>trưởng nhóm
                            <input checked name="role" type="radio" value="3" required/>thiết kế
                        </td>
                    </tr>
                </table>
                <div style="margin-left: 25%; display: flex;">
                    <a href="redirect:${pageContext.request.contextPath}/admin/memberAdmin">
                        <button class="btn btn-secondary" style="margin-right: 10px;">Hủy</button>
                    </a>
                    <input type="submit" class="btn btn-primary" value="Lưu">
                </div>
            </form>

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
<%--<script>--%>
<%--    $(function () {--%>
<%--        $("#header-include").load("header.html");--%>
<%--        $("#nav-left-main").load("nav-left.html");--%>

<%--    });--%>
<%--</script>--%>
</body>

</html>