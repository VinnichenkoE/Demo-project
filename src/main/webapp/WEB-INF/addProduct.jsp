<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: e-lin
  Date: 15.02.2020
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Добавить продукт</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<%--@elvariable id="product" type="project"--%>
<c:if test="${param.error == 'true'}">
    <div style="color:red">
        <br>such product already exists
    </div>
</c:if>
<a href="/index">На главную</a>
<form:form method="post" action="addProduct" modelAttribute="product">
    <input required type="text" name="title" placeholder ="Название">
    <input required type="text" name="quantity" placeholder ="Количество">
    <input type="submit" class="btn btn-info" value="Сохранить">
</form:form>
</body>
</html>
