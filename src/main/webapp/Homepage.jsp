<%-- 
    Document   : Homepage
    Created on : 25-Oct-2022, 10:48:38
    Author     : Huan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Trang chủ</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="<c:url value="/assets/css/headerHome.css" />" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="asset/css/bodyAdmin.css" />

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="bodyAdmin.js"></script>
        <script src="summary.js"></script>
    </head>

    <body>

        <div class="container-fluid" style="padding: 0">

            <div id="header-include"></div>
            <!-- body -->

            <div class="body_page">
                <div id="nav-left-main"></div>

                <div class="tab_content ">
                    <div id="London" class="city">
                        <div class="container-fluid">
                            <h2>Xin chào , Nguyễn</h2>
                            <div class="main">
                                <div class="main-detail">
                                    <h3>Công trình</h3>
                                    <div class="main-detail-left">
                                        <div class="left-detail">
                                            <img class="img_ava" src="../image/a.jpg" />
                                            <a href="summary.html" class="left-main">Biệt thự nhà dân1</a>
                                        </div>
                                        <div class="left-detail">
                                            <img class="img_ava" src="../image/a.jpg" />
                                            <a class="left-main">Biệt thự nhà dân2</a>
                                        </div>
                                        <div class="left-detail">
                                            <img class="img_ava" src="../image/a.jpg" />
                                            <a class="left-main">Biệt thự nhà dân3</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="main-detail">
                                    <h3>Công việc của tôi</h3>
                                    <div class="tab">
                                        <button class="tablinks" onclick="openProject(event, 'project')">Cộng việc</button>
                                        <button class="tablinks" onclick="openProject(event, 'overdue')">Quá hạn</button>
                                        <button class="tablinks" onclick="openProject(event, 'complete')">Hoàn thành</button>
                                    </div>
                                    <div id="project" class="tabcontent">

                                        <table class= "table table-striped">

                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 3</td>
                                                <td>03/09</td>
                                            </tr>
                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 2</td>
                                                <td>03/09</td>
                                            </tr>
                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 1</td>
                                                <td>03/09</td>
                                            </tr>

                                        </table>

                                    </div>
                                    <div id="overdue" class="tabcontent">
                                        <table class=" table table-striped">

                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 1</td>
                                                <td>03/09</td>
                                            </tr>
                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 1</td>
                                                <td>03/09</td>
                                            </tr>
                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 1</td>
                                                <td>03/09</td>
                                            </tr>

                                        </table>
                                    </div>
                                    <div id="complete" class="tabcontent">
                                        <table class=" table table-striped">

                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 2</td>
                                                <td>03/09</td>
                                            </tr>
                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 2</td>
                                                <td>03/09</td>
                                            </tr>
                                            <tr class="right-detail">
                                                <td>Mặt bằng tầng 2</td>
                                                <td>03/09</td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
            </div>
        </div>
        <!-- footer -->

        <!-- <div class="footer_page"></div> -->


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
                crossorigin="anonymous">
        </script>
        <script>
            $(function () {
                $("#header-include").load("HeaderAll.jsp");
                $("#nav-left-main").load("Nav-left.jsp");

            });
        </script>

    </body>

</html>