<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Thống Kê</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/headerHome.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bodymain.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/summary.css"/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/dashboard.css"/>"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  <script src="<c:url value="/resources/assets/js/summary.js"/>"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/design/header.jsp"/>
<div class="body_page">
  <jsp:include page="/WEB-INF/views/design/nav_left.jsp"/>
  <div class="summary container" style="margin-left: 20%;">
    <div class="top-details">
      <div class="list-top">
        <h3>${project.projectName}</h3>
      </div>
      <div class="list-task-head">
        <a class="test" href="${pageContext.request.contextPath}/design/project/summary?id=${project.id}"><input
                class="btn btn-secondary"
                type="button"
                value="Sơ lược"></a>
        <a class="test" href="${pageContext.request.contextPath}/design/task/list_task?id=${project.id}"><input
                class="btn btn-secondary"
                type="button"
                value="Công việc"></a>
        <a class="test"
           href="${pageContext.request.contextPath}/design/sub-task/pending-approval-sub-task?project-id=${project.id}"><input
                class="btn btn-secondary"
                type="button"
                value="Trạng thái"></a>
        <a class="test"
           href="${pageContext.request.contextPath}/design/requirement/view-requirement?project-id=${project.id}"><input
                class="btn btn-secondary"
                type="button"
                value="Yêu cầu của khách hàng"></a>
        <a class="test"
           href="${pageContext.request.contextPath}/design/project/member-active?project-id=${project.id}"><input
                class="btn btn-secondary"
                type="button"
                value="Thành viên"></a>
        <a class="test" href="${pageContext.request.contextPath}/design/dashboard?id=${project.id}"><input
                class="btn btn-secondary"
                type="button"
                style="background: blue"
                value="Thống kê"></a>
      </div>
    </div>
    <div>
      <h4>Thống kê công trình</h4>
      <div class="row">
        <div class="col-2 row-dashboard">
          <div style="height: 20%">
            <p>Tổng số công việc</p>
          </div>
          <div>
            <h4>${dashboardResponse.countTask}</h4>
          </div>
        </div>
        <div class="col-2 row-dashboard">
          <div style="height: 20%">
            <p>Công việc đang làm
          </div>
          <div>
            </p>
            <h4>${dashboardResponse.countSubTaskProcess - dashboardResponse.countOverDeadline}</h4>
          </div>
        </div>
        <div class="col-2 row-dashboard">
          <div style="height: 20%">
            <p>Công việc hoàn thành đúng hạn</p>
          </div>
          <div>
            <h4>${dashboardResponse.countCorrectDeadline}</h4>
          </div>
        </div>
        <div class="col-2 row-dashboard">
          <div style="height: 20%">
            <p>Công việc trễ hạn</p>
          </div>
          <div>
            <h4>${dashboardResponse.countOverDeadline}</h4>
          </div>
        </div>
        <div class="col-2 row-dashboard">
          <div style="height: 20%">
            <p>Công việc hoàn thành chậm tiến độ</p>
          </div>
          <div>
            <h4>${dashboardResponse.countOverDeadlineDoneTask}</h4>
          </div>
        </div>
      </div>
    </div>
    <div style="display: flex; justify-content: center">
      <canvas id="myChart" style="width:100%;max-width:800px"></canvas>
    </div>

  </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
</script>
<script>
  var xValues = ["Công việc đang làm", "Công việc hoàn thành đúng thời hạn", "Công việc trễ hạn", "Công việc hoàn thành chậm tiến độ"];
  var yValues = [${dashboardResponse.countSubTaskProcess - dashboardResponse.countOverDeadline}, ${dashboardResponse.countCorrectDeadline}, ${dashboardResponse.countOverDeadline}, ${dashboardResponse.countOverDeadlineDoneTask}];
  var barColors = [
    "#b91d47",
    "#00aba9",
    "#2b5797",
    "#e8c3b9",
  ];

  new Chart("myChart", {
    type: "pie",
    data: {
      labels: xValues,
      datasets: [{
        backgroundColor: barColors,
        data: yValues
      }]
    },
    options: {
      title: {
        display: true,
        text: "Đây là bảng thống kê"
      }
    }
  });
</script>
</body>


</html>