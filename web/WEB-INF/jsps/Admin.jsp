<%--
  Created by IntelliJ IDEA.
  User: Alexand
  Date: 21.10.2017
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Admin Panel</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="AdminStyle/css/style1.css">
</head>


<body>
<div class="menu">
    <h1 class="text__center">IronShop</h1>
</div>
<a class="go" href="IronShopMain">Перейти на сайт</a>
<div class="left">
    <a href="#pol">Пользователь</a><br>
    <a href="#adm">Администратор</a><br>
    <a href="#poduct">Продукт</a><br>
    <a href="#kat">Категория</a><br>
</div>
<div class="right">
    <h1 id="pol">Пользователь</h1>


    <form action="AdminAct" method="get">
        <label class="radio"><input type="radio" name="two" value="add" checked> Добавить
            <input type="radio" name="two" value="del"> Удалить </label><br>
        <label> Имя: <input class="input" name="name" type="text" required> </label><br>
        <label> Фамилия: <input class="input" name="fam" type="text" required> </label><br>
        <label> Логин: <input class="input" name="login" type="email" required> </label><br>
        <label> Пароль: <input class="input" name="pass" type="password" required> </label>
        <p>Администратор?</p>
        <label><input type="radio" name="six" value="yes" checked> Да
            <input type="radio" name="six" value="no"> Нет </label><br>
        <input type="submit" name="user" value="Отправить">


    </form>
    <h1 id="adm">Администратор</h1>
    <form action="AdminAct" method="get">
        <label class="radio"><input type="radio" name="three" value="add" checked> Добавить
            <input type="radio" name="three" value="del"> Удалить </label><br>
        <label> ID пользователя: <input class="input" name="id_admin" type="text" required> </label>
        <input type="submit" name="admin" value="Отправить">
    </form>

    <h1 id="poduct">Продукт</h1>
    <form action="AdminAct" method="get">
        <label class="radio"><input type="radio" name="four" value="add" checked> Добавить
            <input type="radio" name="four" value="del"> Удалить </label><br>
        <label> Вставить URL картинки: <input class="input" name="URLImage_product" type="text" required>
        </label><br>
        <label> Название компании: <input class="input" type="text" name="name_product" required> </label><br>
        <label> Модель: <input class="input" type="text" name="model_product" required> </label><br>
        <label> Цена: <input class="input" type="text" name="price_product" required> </label><br>
        <label> Пол: <br>
            <label><input type="radio" name="first" value="Муж" checked> Мужчина </label><br>
            <label><input type="radio" name="first" value="Жен"> Женщина </label><br>
        </label><br><br>
        <label> Описание: <input class="input" type="text" name="description_product" required> </label><br>
        <label> ID категории: <input class="input" type="text" name="categoryID_product" required> </label><br>
        <input type="submit" name="Product" value="Отправить">
    </form>


    <h1 id="kat">Категория</h1>
    <form action="AdminAct" method="get">
        <label class="radio"><input type="radio" name="five" value="add" checked> Добавить
            <input type="radio" name="five" value="del"> Удалить </label><br>
        <label> Имя: <input class="input" type="text" name="name_cat" required> </label>
        <input type="submit" value="Отправить" name="Category_form">
    </form>


</div>
</body>
</html>