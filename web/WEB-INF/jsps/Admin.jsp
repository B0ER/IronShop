<%--
  Created by IntelliJ IDEA.
  User: Alexand
  Date: 21.10.2017
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head >
    <title>Подтверждение email</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../../AdminStyle/style.css">
</head>


<body>
<div class="menu">
    <h1 class="text__center">IronShop</h1>
</div>

<div class="left">
    <a href="#pol">Пользователь</a><br>
    <a href="#adm">Администратор</a><br>
    <a href="#poduct">Продукт</a><br>
    <a href="#kat">Катигория</a><br>
</div>
<div class="right">
    <h1>Пользователь</h1>
    <form id="pol" action="#">
        <label> ID  пользователя: <input class="input"  type="text" required> </label><br>
        <label> Имя: <input class="input"  type="text" required> </label><br>
        <label> Фамилия: <input class="input"  type="text" required> </label><br>
        <label> Логин: <input class="input"  type="email" required> </label><br>
        <label> Пароль: <input class="input"  type="password" required> </label>
    </form>
    <h1>Администратор</h1>
    <form id="adm" action="#">
        <label> ID  администратор: <input class="input"  type="text" required> </label><br>
        <label> ID  пользователя: <input class="input"  type="text" required> </label><br>
    </form>
    <h1>Продукт</h1>
    <form id="poduct" action="#">
        <label> ID  продукта: <input class="input"  type="text" required> </label><br>
        <label> Ссылка на картинку <input class="input" type="text" plesholder="тут должно было быть поле для вставки картинок" required> </label><br>
        <label> Имя: <input class="input" type="text" required> </label><br>
        <label> Модель: <input class="input"  type="text" required> </label><br>
        <label> Pricl: <input class="input"  type="text" required> </label><br>
        <label> Author: <input class="input"  type="text" required> </label><br>
        <label> Пол:
            <select name="sex">
                <option value="">Мужской</option>
                <option value="">Женский</option>
            </select>
        </label><br>
    </form>
    <h1>Категория</h1>
    <form id="kat" action="#">
        <label> ID  катигории: <input class="input"  type="text" required> </label><br>
        <label> Имя: <input class="input"  type="text" required> </label><br>
    </form>
</div>
</body>
</html>