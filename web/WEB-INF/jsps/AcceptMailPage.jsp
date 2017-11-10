<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="../../../AcceptMailPage/css/style.css">
</head>


<body>
<div class="menu">
    <h1 class="text__center">IronShop</h1>
</div>

<c:if test="${requestScope.thanks == null}">
<p> <h1 class="text__bottom">Спасибо за регистрацию ${requestScope.rfam} ${requestScope.rname} <br>Проверьте ваш email: ${requestScope.rmail}</h1> <p>
    </c:if>

        <c:if test="${requestScope.thanks != null}">
<p> <h1 class="text__bottom"> ${requestScope.rfam} ${requestScope.rname} ваш аккаунт был подтвержден <br>Ваш email: ${requestScope.mail} был подтвержден  !</h1> <p>
    </c:if>



</body>
