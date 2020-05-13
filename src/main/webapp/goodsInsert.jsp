<%@page contentType="text/html; ISO-8859-1"  pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/goods/insert" enctype="multipart/form-data">
    name:
    <input type="text" name="name"/><br/>
    title:<input type="text" name="title"/><br/>
    price:<input type="text" name="price"/><br/>
    description:<input type="text" name="description"/><br/>
    total:<input type="text" name="total"/><br/>
    category:<c:forEach items="${categories}" var="category">
    <span>${category.name}</span> <input type="checkbox" name="categoryId" value="${category.id}"/>
</c:forEach>
    <br/>
    tags:<c:forEach items="${tags}" var="tag">
    <span>${tag.name}</span> <input type="checkbox" name="tagsId" value="${tag.id}"/>
</c:forEach>
    photo:<input type="file" multiple="multiple" name="files"/><br/>
    <input type="submit" value="submit"/>
</form>
<a href="${pageContext.request.contextPath}/index.html">回到主页</a>
</body>
</html>