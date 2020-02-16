<%--
  Created by IntelliJ IDEA.
  User: e-lin
  Date: 15.02.2020
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Обновить</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<h4>Измените количество или наименование товара</h4>
<form action="/update" method="post">
    <input type="hidden" name="id" value="${product.id}">
    <input type="text" name="title" value=${product.title} placeholder=${product.title}>
    <input type="text" name="quantity" value=${product.quantity} placeholder=${product.quantity}>
    <input type="submit" class="btn btn-info" value="Обновить">
</form>
</body>
</html>
