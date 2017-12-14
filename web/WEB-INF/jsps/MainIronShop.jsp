<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE >
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title>Магазин IronShop</title>
    <link rel="stylesheet" href="StyleMainIronShop/css/style.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all"/>
    <script src="StyleMainIronShop/js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="StyleMainIronShop/js/jquery.jcarousel.pack.js" type="text/javascript"></script>

</head>
<body>

<!-- Shell -->
<div class="shell">

    <div id="header">
        <h1 id="logo"><a href="">IronShop</a></h1>

        <c:if test="${sessionScope.session_user_id != null}">
            <div id="cart">
                <a href="BasketAct" class="cart-link">Корзина</a>
                <div class="cl">&nbsp;</div>
                <span>Кол-во: <strong>${session_user_sum_art}</strong></span>
                &nbsp;&nbsp;
                <span>Цена: <strong>${session_user_sum_cost} р.</strong></span>
            </div>
        </c:if>
        <div id="navigation">
            <ul>
                <li><a href="IronShop" class="active">Главная страница</a></li>
                <c:if test="${sessionScope.session_user_id == null}">
                    <li><a href="RegForm">Авторизация/Регистрация</a></li>
                </c:if>
                <c:if test="${sessionScope.session_user_id != null}">
                    <li><a href="#">Вы: ${session_user_fam} ${session_user_name} </a></li>
                    <li><a href="ExitLogin">Выйти с аккаунта</a></li>
                </c:if>
            </ul>
        </div>
    </div>

    <div id="main">
        <div class="cl">&nbsp;</div>

        <!-- Content -->
        <div id="content">

            <!-- Content Slider -->
            <div id="slider" class="box">
                <div id="slider-holder">
                    <ul>
                        <li><a href="#"><img src="StyleMainIronShop/css/images/slide1.jpg" alt=""/></a></li>
                        <li><a href="#"><img src="StyleMainIronShop/css/images/slide1.jpg" alt=""/></a></li>
                        <li><a href="#"><img src="StyleMainIronShop/css/images/slide1.jpg" alt=""/></a></li>
                        <li><a href="#"><img src="StyleMainIronShop/css/images/slide1.jpg" alt=""/></a></li>
                    </ul>
                </div>
                <div id="slider-nav">
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                </div>
            </div>
            <!-- End Content Slider -->

            <!-- Products -->
            <div class="products">

                <c:if test="${(requestScope.userBasket != null)}">
                    <c:if test="${session_user_sum_cost >0}">
                    <table border="1" width="700">
                        <tr>
                        <td align="center"> Товар</td>
                        <td align="center"> Производитель</td>
                        <td align="center"> Модель</td>
                        <td align="center" > Кол-во</td>
                        <td align="center"> Цена</td>
                        <td align="center"> ДЕЙСТВИЕ</td>
                        </tr>
                        <c:forEach var="i" items="${requestScope.userBasket}">
                            <tr>
                                <td width="100"><img width="100" height="100" src="${i.image_product}"/></td>
                                <td align="center"> ${i.name_product} </td>
                                <td align="center"> ${i.model_product} </td>
                                <td align="center"> ${i.count} </td>
                                <td align="center"> ${i.price_model} руб.</td>
                                <td align="center"><a href="AddProductToBasket?delBasket=${i.id_basket}">Удалить</a></td>
                            </tr>
                        </c:forEach>
                        <tr style="border: hidden">
                            <td colspan="6" align="center" height="40" >
                        <form action="SendShop">
                            <button type="submit" style="background: #8b0000; color:white; width: 300px; height:30px; font-family: Trebuchet MS">Оформить заказ на сумму: ${session_user_sum_cost} р.</button>
                        </form>
                            </td>
                        </tr>
                    </table>
                    </c:if>
                    <c:if test="${session_user_sum_cost <=0}">
                    <label style="font-size: 50px;">Ваша корзина пуста!</label>
                    </c:if>
                </c:if>

                <c:if test="${(requestScope.userBasket == null) && (requestScope.product != null)}">
                    <ul>
                        <c:forEach var="p" items="${requestScope.product}">
                            ${p.class_name}
                            <a href="AddProductToBasket?toBasket=${p.id}"><img src="${p.image}" width="231"  height="383" alt=""/></a>
                            <div class="product-info">
                                <h3>${p.model}</h3>
                                <div class="product-desc">
                                    <h4>Пол: ${p.sex}</h4>
                                    <p>Описание:<br>${p.desk}</p>
                                    <strong class="price">${p.price} руб.</strong>
                                </div>
                            </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>

        </div>
        <div id="sidebar">
            <!-- Search -->
            <div class="box search">
                <h2>Search by <span></span></h2>
                <div class="box-content">
                    <form action="" method="post">

                        <label>Keyword</label>
                        <input type="text" class="field" />

                        <label>Category</label>
                        <select class="field">
                            <option value="">-- Select Category --</option>
                        </select>

                        <div class="inline-field">
                            <label>Price</label>
                            <select class="field small-field">
                                <option value="">$10</option>
                            </select>
                            <label>to:</label>
                            <select class="field small-field">
                                <option value="">$50</option>
                            </select>
                        </div>

                        <input type="submit" class="search-submit" value="Search" />

                        <p>
                            <a href="#" class="bul">Advanced search</a><br />
                            <a href="#" class="bul">Contact Customer Support</a>
                        </p>

                    </form>
                </div>
            </div>


            <!-- Categories -->
            <div class="box categories">
                <h2>Категории <span></span></h2>
                <div class="box-content">
                    <ul>
                        <c:forEach var="p" items="${requestScope.category}" varStatus="i">
                            <c:if test="${i.count != requestScope.category_last}">
                                <li><a href="IronShop?category=${p.id}">${p.nameCategories}</a></li>
                            </c:if>
                            <c:if test="${i.count == requestScope.category_last}">
                                <li class="last"><a href="IronShop?category=${p.id}">${p.nameCategories}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </div>

       <div class="cl">&nbsp;</div>
    </div>
    <div class="side-full">

        <!-- More Products -->
        <div class="more-products">
            <div class="more-products-holder">
                <ul>
                    <li><a href="#"><img src="StyleMainIronShop/css/images/small1.jpg" alt=""/></a></li>
                    <li><a href="#"><img src="StyleMainIronShop/css/images/small2.jpg" alt=""/></a></li>
                    <li><a href="#"><img src="StyleMainIronShop/css/images/small3.jpg" alt=""/></a></li>
                    <li><a href="#"><img src="StyleMainIronShop/css/images/small4.jpg" alt=""/></a></li>
                    <li><a href="#"><img src="StyleMainIronShop/css/images/small5.jpg" alt=""/></a></li>
                    <li><a href="#"><img src="StyleMainIronShop/css/images/small6.jpg" alt=""/></a></li>
                    <li><a href="#"><img src="StyleMainIronShop/css/images/small7.jpg" alt=""/></a></li>
                    <li class="last"><a href="#"><img src="StyleMainIronShop/css/images/small7.jpg" alt=""/></a></li>
                </ul>
            </div>
            <div class="more-nav">
                <a href="#" class="prev">previous</a>
                <a href="#" class="next">next</a>
            </div>
        </div>

        <div class="cols">
            <div class="cl">&nbsp;</div>
            <div class="col">
                <h3 class="ico ico1">Donec imperdiet</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor,
                    arcu felis ornare dui.</p>
                <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
            </div>
            <div class="col">
                <h3 class="ico ico2">Donec imperdiet</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor,
                    arcu felis ornare dui.</p>
                <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
            </div>
            <div class="col">
                <h3 class="ico ico3">Donec imperdiet</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor,
                    arcu felis ornare dui.</p>
                <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
            </div>
            <div class="col col-last">
                <h3 class="ico ico4">Donec imperdiet</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor,
                    arcu felis ornare dui.</p>
                <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
            </div>
            <div class="cl">&nbsp;</div>
        </div>

    </div>

    <div id="footer">
        <p class="left">
            <a href="#">Home</a>
            <span>|</span>
            <a href="#">Support</a>
            <span>|</span>
            <a href="#">My Account</a>
            <span>|</span>
            <a href="#">The Store</a>
            <span>|</span>
            <a href="#">Contact</a>
        </p>
        <p class="right">
            &copy; 2017 IronShop.
            By: impossible and B0ER <a href="http://chocotemplates.com" target="_blank" title="The Sweetest CSS Templates WorldWide">IronMines.ru</a>
        </p>
    </div>

</div>


</body>
</html>


