<%--
  Created by IntelliJ IDEA.
  User: e-lin
  Date: 07.02.2020
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<html>
<head>
    <title>Storage</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <c:if test="${param.error == 'true'}">
        <div style="color:red">
            <br>product not enough
        </div>
    </c:if>
    <h4>Добро пожаловать : <security:authorize access="isAnonymous()">Гость</security:authorize> <security:authorize access="isAuthenticated()">${pageContext.request.userPrincipal.name}</security:authorize> </h4>
    <security:authorize access="isAnonymous()">Для того чтобы совершать покупки вам необходимо авторизоваться</security:authorize>
    <table>
        <tr>
            <security:authorize access="isAnonymous()">
                <td><a href="/login">Войти</a></td>
                <td><a href="/registration">Зарегистрироваться</a></td>
            </security:authorize>
            <security:authorize access="isAuthenticated()">
                <td><a href="/logout">Logout</a></td>
            </security:authorize>
            <security:authorize access="hasRole('USER')">
                <td width="1000" align="right">
                    <form action="/basket">
                        <input type="submit" class="btn btn-info" value="Корзина">
                    </form>
                </td>
            </security:authorize>
        </tr>
    </table>

    <table class="table table-borderless">
        <thead class="thead-dark">
        <tr>
            <th>Title</th>
            <th>QuantityOnStorage</th>
            <th>Buy</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">

            <tr>
                <td>${product.getTitle()}</td>
                <td>${product.getQuantity()}</td>

                <td>
                    <security:authorize access="hasRole('USER')">
                        <form action="/buy" method="post">
                            <input type="number" min="0" max="100" step="0.1" name="quantityToBuy">
                            <input type="hidden" name="id" value="${product.getId()}">
                            <input type="hidden" name="title" value="${product.getTitle()}">
                            <input type="hidden" name="quantity" value="${product.getQuantity()}">
                            <input type="submit" class="btn btn-info" value="Купить" style="float:right">
                        </form>
                    </security:authorize>
                </td>
                <td>
                    <security:authorize access="hasRole('ADMIN')">
                        <form action="/updateProduct/${product.getId()}" method="get">
                            <input type="submit" class="btn btn-info" value="Редактировать">
                        </form>
                    </security:authorize>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <security:authorize access="hasRole('ADMIN')">
        <form action="/addProduct">
            <input type="submit" class="btn btn-info" value="Добавить товар">
        </form>
    </security:authorize>
</div>
</body>
</html>
