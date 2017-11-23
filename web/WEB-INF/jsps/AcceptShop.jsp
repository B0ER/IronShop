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
<p> <h1 class="text__bottom">Спасибо за покупку товаров ${sessionScope.session_user_fam} ${sessionScope.session_user_name}
<br><br><br><br>
<table border="0"  >
    <tr align="center" >

        <td align="left"> Товар</td>
        <td> Производитель</td>
        <td > Модель</td>
        <td > Цена</td>
    </tr>

    <tr>
        <td bgcolor="black" colspan="4"></td>
    </tr>
    <c:forEach var="i" items="${requestScope.userBasket}">
        <tr align="center">
            <td align="left" width="400"><img width="150" height="150" src="${i.image_product}"/></td>
            <td width="400"> ${i.name_product} </td>
            <td width="400"> ${i.model_product} </td>
            <td width="400" > ${i.price_model} руб.</td>
        </tr>
        <tr>
            <td bgcolor="black" colspan="4"></td>
        </tr>
    </c:forEach>
    <tr align="center">
        <td align="left"> Кол-во товаров: ${sessionScope.session_user_sum_art}</td>
        <td> </td>
        <td > </td>
        <td >Итоговая цена: ${sessionScope.session_user_sum_cost} руб.</td>
    </tr>
</table>


    <br>Проверьте ваш email: ${sessionScope.session_user_mail}</h1> <p>
    </c:if>




</body>
