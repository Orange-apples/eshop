<%@page contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品添加</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="text-align: left;font-size:15px;line-height: 20px">
<div class="container">

    <form method="post" action="${pageContext.request.contextPath}/goods/insert" style="width:300px;line-height: 20px"
          enctype="multipart/form-data" class="form-group">

        <input placeholder="name" type="text" name="name" style="margin-top: 20px"/><br/>
        <input placeholder="title" type="text" name="title" style="margin-top: 20px"/><br/>
        <input placeholder="price" type="text" name="price" style="margin-top: 20px"/><br/>
        <input placeholder="description" type="text" name="description" style="margin-top: 20px"/><br/>
        <input placeholder="total" type="text" name="total" style="margin-top: 20px"/><br/>
        <br/>
        <c:forEach items="${categories}" var="category">
            <span>${category.name}</span> <input style="margin-right: 20px" type="checkbox" name="categoryId"
                                                 value="${category.id}"/>
        </c:forEach>
        <br/>
        tags:<br/>
        <c:forEach items="${tags}" var="tag">
            <span>${tag.name}</span> <input style="margin-right: 20px" type="checkbox" name="tagsId" value="${tag.id}"/>
        </c:forEach><br/>
        photo:<input type="file" multiple="multiple" name="files"/><br/>
        <input type="submit" class="btn btn-success" value="submit"/>
    </form>
    <a href="${pageContext.request.contextPath}/manager/index.html" class="btn btn-primary home">回到主页</a>
</div>
</body>
</html>