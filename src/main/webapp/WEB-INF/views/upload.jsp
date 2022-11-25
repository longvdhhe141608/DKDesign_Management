<%--
  Created by IntelliJ IDEA.
  User: Mr D
  Date: 04/11/2022
  Time: 1:09 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload</title>
    ${message}
    <form method="post" action="upload-image" enctype="multipart/form-data">
        Choose a image: <input type="file" name="file" accept="image/*"/>
        <input type="submit" value="Upload"/>
    </form>

    <form method="post" action="upload-file" enctype="multipart/form-data">
        Choose a file: <input type="file" name="file"/>
        <input type="submit" value="Upload"/>
    </form>
</head>
<body>

</body>
</html>
