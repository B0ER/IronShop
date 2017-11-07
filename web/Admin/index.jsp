<%--
  Created by IntelliJ IDEA.
  User: Alexand
  Date: 21.10.2017
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<style>
    .form-sect{
        text-align:center;
        display:inline-block;width:49%;
    }
    .welcome{
        text-align: center;
        display:block;
        background-color: yellow;
        padding: 20px 0;
        border-radius: 10px;
    }
</style>

<header>
    <h2 class="welcome">Добро пожаловать, admin</h2>
    <a href="">Вернуться на сайт</a>
</header>
<div class="form-sect" >
    <h1>Добавление товара</h1>

    <form name="add" method="post" action="/">
        <h2>Изображение</h2>
        <input name="plink" placeholder="ссылка на изображение" type="text" >
        <h2>Название</h2>
        <input name="name" placeholder="название" type="text">
        <h2>Цена</h2>
        <input name="price" placeholder="цена" type="text">
        <h2>Описание</h2>
        <textarea placeholder="описание" name="descr" id="" cols="30" rows="10">

		</textarea>
        <h2>Тип товара</h2>
        <span>Мужская</span>
        <input name="type" type="radio" value="man">
        <span>Женская</span>
        <input name="type" type="radio" value="woman"><br>
        <input type="submit" value="Отправить">
    </form>
</div>
<div class="form-sect" >
    <h1>Редактирование товара</h1>
    <form name="edit" method="post" action="/">
        <h2>id товара</h2>
        <input name="id" placeholder="id" type="text" >
        <h2>Название</h2>
        <input name="name" placeholder="название" type="text">
        <h2>Цена</h2>
        <input name="price" placeholder="цена" type="text">
        <h2>Описание</h2>
        <textarea placeholder="описание" name="descr" id="" cols="30" rows="10">

		</textarea>
        <h2>Тип товара</h2>
        <span>Мужская</span>
        <input name="type" type="radio" value="man">
        <span>Женская</span>
        <input name="type" type="radio" value="woman"><br>
        <input type="submit" value="Отправить">
    </form>
</div>
</body>
</html>