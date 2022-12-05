<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>Thay Đổi Mật Khẩu</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/all_project.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/summary.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/myTask.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/assets/css/list_task.css"/>"/>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="body_page">

        <jsp:include page="../nav_left.jsp"/>

    <div class="summary">
        <h4>Thay đổi mật khẩu</h4>
        <table class="table table-borderless ">
<tr>
    <td class="col-4">Mật khẩu cũ:</td>
    <td class="col-4"><input id="old-password" name="old-password" class="form-control" required/></td>
</tr>
            <tr>
                <td>Mật khẩu mới:</td>
                <td><input id="new-password" name="new-password" class="form-control" required/></td>
            </tr>
            <tr>
                <td>Xác nhận mật khẩu:</td>
                <td><input id="confirmed-password" name="confirmed-password" class="form-control" required/></td>
            </tr>
        </table>

        <div class="change-password-btn" style="display: flex;justify-content: end">
            <button style="margin-right: 5px" class="btn btn-secondary" onclick="history.back()">Thoát</button>
            <button type="submit" class="btn btn-primary">Lưu</button>
        </div>
    </div>
</div>

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
        // When the user clicks on <span> (x), close the modal


        // When the user clicks anywhere outside of the modal, close it

    }
</script>
</body>
</html>