<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: e-lin
  Date: 10.02.2020
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<c:if test="${param.error == 'true'}">
    <div style="color:red">
        <br>wrong password or login
    </div>
</c:if>
<h4>Введите логин и пароль:</h4>
<form name='f' action="/j_spring_security_check" method='POST'>
    <table>
        <tr>
            <td>User:</td>
            <td><input type='text' name='login' value='' placeholder="Логин"></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type='password' name='password' placeholder="Пароль"/></td>
        </tr>
        <tr>
            <td><input class="btn btn-info" name="submit" type="submit" value="Войти"/></td>
        </tr>
    </table>
</form>
<br><a href="/registration">Зарегистрироваться</a>
</body>
</html>
