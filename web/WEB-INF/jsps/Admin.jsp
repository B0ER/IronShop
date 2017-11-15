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
    <link rel="stylesheet" href="AdminStyle/css/style1.css">
</head>


<body>
<div class="menu">
    <h1 class="text__center">IronShop</h1>
</div>
<a class="go" href="">Перейти на сайт</a>
<div class="left">
    <a href="#pol">Пользователь</a><br>
    <a href="#adm">Администратор</a><br>
    <a href="#poduct">Продукт</a><br>
    <a href="#kat">Категория</a><br>
</div>
<div class="right">
    <h1 id="pol">Пользователь</h1>
    <form action="#">
        <label class="radio" ><input type="radio" name="two" checked> Добавить
            <input type="radio" name="two" > Удалить </label><br>
        <label> Имя: <input class="input"  type="text" required> </label><br>
        <label> Фамилия: <input class="input"  type="text" required> </label><br>
        <label> Логин: <input class="input"  type="email" required> </label><br>
        <label> Пароль: <input class="input"  type="password" required> </label>
        <p>Администратор?</p>
        <label ><input type="radio" name="six" checked> Да
            <input type="radio" name="six" > Нет </label><br>
        <input type="button" value="Отпраить">
    </form>
    <h1 id="adm" >Администратор</h1>
    <form action="#">
        <label class="radio" ><input type="radio" name="three" checked > Добавить
            <input type="radio" name="three" > Удалить </label><br>
        <label> ID  пользователя: <input class="input"  type="text" required> </label>
        <input type="button" value="Отпраить">
    </form>
    <h1 id="poduct">Продукт</h1>
    <form  action="#">
        <label class="radio" ><input type="radio" name="four" checked> Добавить
            <input type="radio" name="four" > Удалить </label><br>
        <label> Вставить картинку <input class="input" type="text" plesholder="тут должно было быть поле для вставки картинок" required> </label><br>
        <label> Имя: <input class="input" type="text" required> </label><br>
        <label> Модель: <input class="input"  type="text" required> </label><br>
        <label> Pricl: <input class="input"  type="text" required> </label><br>
        <label> Пол: <br>
            <label ><input type="radio" name="first" checked> Мужчина </label><br>
            <label ><input type="radio" name="first" > Женщина </label><br>
        </label>
        <input type="button" value="Отпраить">
    </form>
    <h1 id="kat">Категория</h1>
    <form  action="#">
        <label class="radio" ><input type="radio" name="five"checked > Добавить
            <input type="radio" name="five" > Удалить </label><br>
        <label> Имя: <input class="input"  type="text" required> </label>
        <input type="button" value="Отпраить">
    </form>
</div>
</body>
</html>