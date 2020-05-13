<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: MAIBENBEN
  Date: 2020/5/13
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品信息</title>
</head>
<body>
<table cellspacing="5" cellpadding="5" border="2">
    <thead style="font-weight: bold">
    <tr>
        <td>id</td>
        <td>name</td>
        <td>title</td>
        <td>price</td>
        <td>description</td>
        <td>total</td>
        <td>categories</td>
        <td>tags</td>
        <td>photo</td>
        <td> </td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${goodsList}" var="goods">
        <tr>
            <td>${goods.id}</td>
            <td>${goods.name}</td>
            <td>${goods.title}</td>
            <td>${goods.price}</td>
            <td>${goods.description}</td>
            <td>${goods.total}</td>
            <td><c:forEach items="${goods.categories}" var="category">${category.name},</c:forEach></td>
            <td><c:forEach items="${goods.tags}" var="tags">${tags.name},</c:forEach></td>
            <td ><img src="${pageContext.request.contextPath}${goods.photos[0]}" style="width: 200px ;height: 50px"></td>
           <td> <a href="${pageContext.request.contextPath}/goods/delete/${goods.id}">删除</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="${pageContext.request.contextPath}/index.html">回到主页</a>
</body>
</html>
