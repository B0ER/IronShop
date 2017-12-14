<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <%@ page contentType="text/html;charset=UTF-8" language="java" %> -->

<html>
<head>
    <title>Admin Panel</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="AdminStyle/css/style1.css">
    <script src="AdminStyle/js/js.js"></script>
</head>

<body>
<div class="menu">
    <h1 class="text__center">IronShop</h1>
</div>
<a class="go" href="IronShop">Перейти на сайт</a>
<div class="left">
    <a href="Admin?Category=1">Пользователь</a><br>
    <a href="Admin?Category=2">Администратор</a><br>
    <a href="Admin?Category=3">Продукт</a><br>
    <a href="Admin?Category=4">Категория</a><br>
</div>
<div class="right">
    <c:if test="${(param.Category == null) || (param.Category == 1)}">
        <h1>Пользователь</h1>
        <form action="AdminAct" method="get" novalidate>
            <label class="radio">
                <input type="radio" onclick="addUsers();" name="two" value="add" checked> Добавить
                <input type="radio" onclick="delUsers();"name="two" value="del"> Удалить
                <input type="radio" onclick="editUsers();"name="two" value="chg"> Изменить
            </label>
            <br>
            <div class="lef_bl">
                <label id="id_users" style="display: none"> ID пользователя : <input class="input" name="id" required type="text" required> </label><br>
                <label id="name_users" style="display: block"> Имя: <input class="input" required name="name" type="text" required> </label><br>
                <label id="fam_users" style="display: block"> Фамилия: <input class="input" required name="fam" type="text" required> </label><br>
                <label id="login_users" style="display: block"> Логин: <input class="input" required name="login" type="email" required> </label><br>
                <label id="pass_users" style="display: block"> Пароль: <input class="input" required name="pass" type="password" required> </label>
                <div id="admin_users" style="display: block" >
                <label style="display: block" > Администратор? </label> <input type="radio" name="six" value="yes" checked> Да
                    <input type="radio" name="six" value="no"> Нет </div><br>
                <input type="submit" name="user" value="Отправить">
            </div>
            <div class ="titleTexArea">
                <label class="namesTextArea"> <b>Пользователи </b> </label>
            </div>
 <textarea class="tex_o">
<c:forEach var="i" items="${requestScope.userList}">ID:${i.id} NAME:${i.name} FAM:${i.fam} MAIL:${i.mail}
</c:forEach></textarea>


    </form>
    </c:if>

    <c:if test="${(param.Category == null) || (param.Category == 2)}">
    <h1>Администратор</h1>
    <form action="AdminAct" method="get" novalidate>
        <label class="radio">
            <input type="radio" name="three" value="add" checked> Добавить
            <input type="radio" name="three" value="del"> Удалить
        </label>
        <br>
        <div class="lef_bl">
            <label> ID пользователя: <input class="input" name="id_admin" type="text" required> </label>
            <input type="submit" name="admin" value="Отправить">
        </div>
        <div class ="titleTexArea">
        <label class="namesTextArea"> <b>Пользователи </b> </label>
        <label class="namesTextArea" style="padding-left: 400px;"> <b>Администраторы</b> </label>
        </div>
        <textarea class="tex_o" >
<c:forEach var="i" items="${requestScope.userList}">ID:${i.id} NAME:${i.name} FAM:${i.fam} MAIL:${i.mail}
</c:forEach></textarea>
<textarea class="tex_o">
<c:forEach var="i" items="${requestScope.adminList}">ID:${i.id} NAME:${i.name} FAM:${i.fam} MAIL:${i.mail}
</c:forEach></textarea>
    </form>
    </c:if>

    <c:if test="${(param.Category == null) || (param.Category == 3)}">
    <h1>Продукт</h1>
    <form action="AdminAct" method="get" novalidate>
        <label class="radio"><input type="radio" name="four" onclick="addProduct();" value="add" checked> Добавить
            <input type="radio"  name="four" onclick="delProduct();" value="del"> Удалить <input type="radio" onclick="editProduct();" name="four" value="chg"> Изменить  </label><br>
        <div class="lef_bl">
            <label id="id_product"  style="display: none"> ID продукта: <input class="input" name="id" type="text" required> </label><br>
            <label id="url_product"  style="display: block"> Вставить URL картинки: <input class="input" name="URLImage_product" type="text" required>
            </label><br>
            <label id="name_product"  style="display: block"> Название компании: <input class="input" type="text" name="name_product" required> </label><br>
            <label id="model_product"  style="display: block"> Модель: <input class="input" type="text" name="model_product" required> </label><br>
            <label id="price_product"  style="display: block"> Цена: <input class="input" type="text" name="price_product" required> </label><br>
            <label id="pol_product"  style="display: block"> Пол: <br>
            <label><input type="radio" name="first" value="Муж" checked> Мужчина </label><br>
            <label><input type="radio" name="first" value="Жен"> Женщина </label><br>
            </label><br><br>
            <label id="desk_product"  style="display: block"> Описание: <input class="input" type="text" name="description_product" required> </label><br>
            <label id="idCat_product"  style="display: block"> ID категории: <input class="input" type="text" name="categoryID_product" required> </label><br>
            <input type="submit" name="Product" value="Отправить">
        </div>
        <div class ="titleTexArea">
            <label class="namesTextArea"> <b>Продукт </b> </label>
            <label class="namesTextArea" style="padding-left: 440px;"> <b>Категории продуктов</b> </label>
        </div>
<textarea class="tex_t">
<c:forEach var="i" items="${requestScope.productList}"> ID:${i.id} MODEL:${i.model} PRICE:${ i.price} SEX:${i.sex} ID_CAT:${i.id_category}
</c:forEach></textarea>
        <textarea class="tex_t">
<c:forEach var="i" items="${requestScope.categoryList}">ID:${i.id} CAT:${i.nameCategories}
</c:forEach></textarea>

    </form>
    </c:if>
    <c:if test="${(param.Category == null) || (param.Category == 4)}">
    <h1>Категория</h1>
    <form action="AdminAct" method="get" novalidate>
        <label class="radio">
            <input type="radio" name="five" onclick="addCategories()" value="add" checked> Добавить
            <input type="radio" name="five" onclick="delCategories()" value="del"> Удалить
            <input type="radio" name="five" onclick="editCategories()" value="chg"> Изменить
        </label>
        <br>
        <div class="lef_bl">
            <label id="id_categories" style="display: none;"> ID категории: <input class="input" name="id" type="text" required> </label><br>
            <label id="name_categories" style="display: block;" > Имя: <input class="input" type="text" name="name_cat" required> </label>
            <input type="submit" value="Отправить" name="Category_form">
        </div>
        <div class ="titleTexArea">
            <label class="namesTextArea"> <b>Категории</b> </label>
        </div>
<textarea class="tex">
<c:forEach var="i" items="${requestScope.categoryList}">ID:${i.id} CAT_NAME:${i.nameCategories}
</c:forEach></textarea>
    </form>
    </c:if>

</div>
</body>
</html>