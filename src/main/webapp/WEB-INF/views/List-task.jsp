<%--
  Created by IntelliJ IDEA.
  User: Hoang Long
  Date: 023,10/23/2022
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách công việc </title>
    <link rel="stylesheet"
          type="text/css"
          href="../assets/css/list-task.css">
</head>
<body>
<%@include file="header.jsp" %>
<div class="list-task">
    <div class="nav-left">
        <%@include file="nav-left.jsp" %>
    </div>
    <div class="list-task-detail">
        <div class="list-top">
            <h1>Biệt thự nhà dân</h1>
            <a class="project-detail"><input type="button" value="trạng thái "></a>
        </div>
        <div class="list-task-head">
            <a class="project-detail"><input type="button" value="Chi tiết dự án"></a>
            <a class="list"><input type="button" value="Lịch"></a>
            <a class="calendar"><input type="button" value="Danh sách"></a>
            <a class="customer-request"><input type="button" value="Thành viên dự án"></a>
            <a class="project-progress"><input type="button" value="Tiến độ"></a>
            <a class="project-member"><input type="button" value="Thành viên dự án"></a>
            <a class="statistic"><input type="button" value="Thống kê"></a>
        </div>

        <div class="top">
            <div class="add-task">
                <input type="button" name="add" value="+ Thêm công trình"></br>
            </div>
        </div>

        <table class="table-task">
            <tr class="list-task-top">
                <th class="list-task-top-detail">Công việc</th>
                <th class="list-task-top-detail">Phân công</th>
                <th class="list-task-top-detail">Thời hạn</th>
                <th class="list-task-top-detail">Trạng thái</th>
                <th>Ghi chú</th>
            </tr>
            <tr>

                <th>Thiết kế bản vẽ
            </tr>
            <tr>
                <td>Thiết kế mặt sàn</td>
                <td>huonghoang</td>
                <td>20/09/ - 21/09</td>
            </tr>
            <tr>
                <td>Thiết kế mặt sàn tầng 1</td>
                <td>huonghoang</td>
                <td>20/09/ - 21/09</td>
                <td>Đồng ý</td>
            </tr>
            <tr>
                <td>Thiết kế mặt sàn tầng 2</td>
                <td>huonghoang</td>
                <td>20/09/ - 21/09</td>
                <td>Đồng ý</td>
            </tr>
            </tr>
            <tr>
                <td>Thiết kế mặt bằng cấp điện</td>
                <td>huonghoang</td>
                <td>20/09/ - 21/09</td>
            <tr>
                <td>Cấp điện chiếu sáng tầng 1</td>
                <td>huonghoang</td>
                <td>20/09/ - 21/09</td>
                <td>Đồng ý</td>
            </tr>
            <tr>
                <td>Cấp điện chiếu sáng tầng 2</td>
                <td>huonghoang</td>
                <td>20/09/ - 21/09</td>
                <td> Từ chối</td>
                <td>Deadline không phù hợp</td>
            </tr>
            <tr>
                <td>Cấp điện cổ cắm tầng 1</td>
                <td>huonghoang</td>
                <td>20/09/ - 21/09</td>

            </tr>
            </tr>

            </th>
            </tr>

            <tr>
                <th>Lên hình ảnh 3D</th>
            </tr>

        </table>

        <div class="bot">
            <div class="add-task">
                <input type="button" name="add" value="+ Thêm đầu mục công việc"></br>
            </div>
        </div>
    </div>
</div>
</body>
</html>
