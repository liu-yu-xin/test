<%--
  Created by IntelliJ IDEA.
  User: 35467
  Date: 2020/7/23
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${students}" var="student">
    <tr>
        <td>${student.id }</td>
        <td>${student.sname }</td>
        <td>${student.sage}</td>
    </tr>
</c:forEach>
</body>
</html>
