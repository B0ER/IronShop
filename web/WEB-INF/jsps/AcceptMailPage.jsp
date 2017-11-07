<%--
  Created by IntelliJ IDEA.
  User: Elena
  Date: 07.11.2017
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head >
    <title>Подтверждение email</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="AcceptMailPage/style.css">
</head>


<body>
<div class="menu">
    <h1 class="text__center">IronShop</h1>
</div>


<h1 class="text__bottom">Спасибо за регистрацию ${requestScope.rname} ${requestScope.rfam} <br>Проверьте ваш email: ${requestScope.rmail}</h1>
</body>
