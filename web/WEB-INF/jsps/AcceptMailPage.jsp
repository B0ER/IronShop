<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<p> <h1 class="text__bottom"> ${sessionScope.rfam} ${requestScope.rname} Аккаунт был подтвержден <br>Ваш email: ${requestScope.mail} был подтвержден  !</h1> <p>
    </c:if>
</body>
