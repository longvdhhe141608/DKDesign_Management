<%--
    Document   : ProjectAll
    Created on : 25-Oct-2022, 11:31:23
    Author     : Huan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  <title>Trang chủ</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>" />
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>>" />
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css"/>>" />
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css"/>>" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <script src="asset/js/bodymain.js"></script>
  <script src="summary.js"></script>
</head>
<body>
<%@include file="HeaderAll.jsp" %>
<div class="project">
  <div class="">
    <%@include file="nav-left.jsp" %>
  </div>
  <div class="project-main">
    <h1>Tất cả công trình</h1>

    <div class="top">
      <div class="add-congtrinh">
        <input type="button" name="add" value="+ Thêm công trình"></br>
      </div>
      <div class="top-right">
        <div class="select-year">
          <select name="year" id="year">
            <option value="2017">2017</option>
            <option value="2018">2018</option>
            <option value="2019">2019</option>
            <option value="2020">2020</option>
            <option value="2021">2021</option>
            <option value="2022" selected>2022</option>
          </select>
        </div>
        <div class="search-congtrinh">

          <input type="text"  id="search" name="search" placeholder="Tìm Kiếm">
          <button>Search</button>
        </div>
      </div>
    </div>

    <div class="table">
      <table class="table-congtrinh">
        <tr>
          <th></th>
          <th>Công trình</th>
          <th>Loại công trình</th>
          <th>Thời gian bắt đầu</th>
          <th>Trạng thái</th>
        </tr>
        <tr>
          <td>1</td>
          <td>Biệt thự nhà dân</td>
          <td>Ngoại thất</td>
          <td>05/05/2022</td>
          <td>Đang thực hiện</td>
        </tr>
        <tr>
          <td>2</td>
          <td>Biệt thự nhà dân</td>
          <td>Ngoại thất</td>
          <td>05/05/2022</td>
          <td>Đang thực hiện</td>
        </tr>
        <tr>
          <td>3</td>
          <td>Biệt thự nhà dân</td>
          <td>Ngoại thất</td>
          <td>05/05/2022</td>
          <td>Đang thực hiện</td>
        </tr>
        <tr>
          <td>4</td>
          <td>Biệt thự nhà dân</td>
          <td>Ngoại thất</td>
          <td>05/05/2022</td>
          <td>Đang thực hiện</td>
        </tr>
      </table>

      <div class="phantrang">
        <a href="" ><</a>
        <a href="" >1</a>
        <a href="" >2</a>
        <a href="" >></a>
      </div>
    </div>
  </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous">
</script>
</html>