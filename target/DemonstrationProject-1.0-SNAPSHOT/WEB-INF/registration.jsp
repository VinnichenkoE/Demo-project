<%--
  Created by IntelliJ IDEA.
  User: e-lin
  Date: 13.02.2020
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Регистрация</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<%--@elvariable id="userInfo" type="project"--%>
<c:if test="${param.error == 'true'}">
    <div style="color:red">
        <br>login is already taken
    </div>
</c:if>
<h4>Регистрация</h4>
<form:form method="post" action="registration" modelAttribute="userInfo">
    <table class="table table-borderless">
        <tr>
            <td width="200">Введите Логин</td>
            <td align="left"><input required type="text" name="login" placeholder="Логин"></td>
        </tr>
        <tr>
            <td width="200">Введите пароль</td>
            <td align="left"><input required type="text" name="password" placeholder="Пароль"></td>
        </tr>
        <tr>
            <td width="200">Введите имя</td>
            <td align="left"><input required type="text" name="firstname" placeholder="Имя"></td>
        </tr>
        <tr>
            <td width="200">Введите фамилию</td>
            <td align="left"><input required type="text" name="lastname" placeholder="Фамилия"></td>
        </tr>
        <tr><td><input type="submit" class="btn btn-info" value="Сохранить"></td></tr>
    </table>
</form:form>
</body>
</html>
