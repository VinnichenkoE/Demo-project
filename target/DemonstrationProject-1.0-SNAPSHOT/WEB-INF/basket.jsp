<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: e-lin
  Date: 13.02.2020
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Корзина</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<a href="/index">На главную</a>
<br>В корзине ${amount} товаров
<table class="table table-borderless">
    <thead class="thead-dark">
    <tr>
        <td>Title</td>
        <td>Quantity</td>
        <td>Delete</td>
    </tr>
    <thead class="thead-dark">
    <tbody>
    <c:forEach items="${orders}" var="order">
        <tr>
            <td>${order.product.title}</td>
            <td>${order.quantity}</td>
            <td>
                <form action="/deleteOrder" method="post">
                    <input type="hidden" name="id" value="${order.getId()}">
                    <input type="hidden" name="quantityOfOrder" value="${order.getQuantity()}">
                    <input type="submit" class="btn btn-info" value="Удалить" style="float:left">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
