<jsp:useBean id="profile" scope="request" type="DkDesignManagement.Entity.Employee"/>
<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thông tin cá nhân</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="profile">
    <div class="nav-left">
        <jsp:include page="nav_left.jsp"/>
    </div>
    <div class="profile-main">
        <div class="information">
            <a href="/headerHome" class="main-information">icon</a>
            <h3 class="main-information">Thông tin cá nhân</h3>
            <a href="/edit_profile">Chỉnh sửa</a>
        </div>
        <div class="main">
            <div class="main-name">
                <h5 class="name"> Họ và tên: </h5>
                <p id="name">${profile.name}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Mã nhân viên:</h5>
                <p id="employee-code">${profile.id}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Số CCCD/CMND </h5>
                <p id="number-CCCD">${profile.cccd}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Ngày sinh: </h5>
                <p id="Date-of-birth">${profile.dob}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Giới tính: </h5>
                <c:if test="profile.gender == 1"><p id="sex">Nam</p></c:if>
                <c:if test="profile.gender == 0"><p id="sex">Nu</p></c:if>
            </div>
            <div class="main-name">
                <h5 class="name">Số điện thoại: </h5>
                <p id="SĐT">${profile.phone}</p>
            </div>

            <div class="main-name">
                <h5 class="name"> Email: </h5>
                <p id="email">${profile.mail}</p>
            </div>
            <div class="main-name">
                <h5 class="name"> Địa chỉ nhà: </h5>
                <p id="address">${profile.address}</p>
            </div>
            <div class="main-name-btn">
                <a href="#editprofile" data-toggle="modal"  class="btn btn-outline-primary ms-1">Edit Profile</a>
            </div>
        </div>
    </div>

</div>
<!-- Edit profile -->
<div id="editprofile" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/profile/update" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Profile</h4>
                    <h6 style="color: #be123c">${error}</h6>
                    <button style="background-color: white ; border: 0 ; font-weight: 700" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <div class="modal-body">
                    <a hidden >
                        <input value="${profile.id}" name="id" type="text" class="form-control" required>
                    </a>
                    <div class="form-group">
                        <label>Name</label>
                        <input pattern="[^!@#$%^&*()_+\-=\[\]{};':\\|,.<>\/?]+$" value="${profile.name}" name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input  value="${profile.name}" name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input pattern="^0[0-9]{9}" value="${profile.phone}" title="Số điện thoại bao gồm 10 chữ số và bắt đầu bằng chữ số 0" name="phone" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input value="${profile.address}" name="address" type="text" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" style="background:#f5f5f5" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Edit">
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End edit profile -->


<!-- jQery -->
<script src="js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<!-- bootstrap js -->
<script src="js/bootstrap.js"></script>
<!-- owl slider -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<!-- isotope js -->
<script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
<!-- nice select -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts-1.js"></script>
<script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</body>
</html>