<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title>Магазин IronShop</title>
    <link rel="stylesheet" href="StyleMainIronShop/css/style.css" type="text/css" media="all"/>
    <!--[if lte IE 6]>
    <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all"/><![endif]-->

    <meta name="keywwords"
          content="Shop Around - Great free html template for on-line shop. Use it as a start point for your on line business. The template can be easily implemented in many open source E-commerce platforms"/>
    <meta name="description"
          content="Shop Around - Great free html template for on-line shop. Use it as a start point for your on line business. The template can be easily implemented in many open source E-commerce platforms"/>

    <!-- JS -->
    <script src="StyleMainIronShop/js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="StyleMainIronShop/js/jquery.jcarousel.pack.js" type="text/javascript"></script>
    <script src="StyleMainIronShop/js/jquery-func.js" type="text/javascript"></script>
    <!-- End JS -->

</head>
<body>

<!-- Shell -->
<div class="shell">

    <!-- Header -->
    <div id="header">
        <h1 id="logo"><a href="">IronShop</a></h1>

        <!-- Cart -->
        <c:if test="${sessionScope.session_user_name != null}">
            <div id="cart">
                <a href="BasketAct" class="cart-link">Корзина</a>
                <div class="cl">&nbsp;</div>
                <span>Кол-во: <strong>${session_user_sum_art}</strong></span>
                &nbsp;&nbsp;
                <span>Цена: <strong>${session_user_sum_cost} р.</strong></span>
            </div>
        </c:if>
        <!-- End Cart -->

        <!-- Navigation -->
        <div id="navigation">
            <ul>
                <li><a href="MySite" class="active">Главная страница</a></li>
                <c:if test="${sessionScope.session_user_name == null}">
                    <li><a href="RegForm">Авторизация/Регистрация</a></li>
                </c:if>
                <li><a href="https://vk.com/sanek_ru">Dev</a></li>
                <li><a href="https://vk.com/id_679523328">Dev</a></li>
                <c:if test="${sessionScope.session_user_name != null}">
                    <li><a href="ExitLogin">Выйти с аккаунта</a></li>
                </c:if>


            </ul>
        </div>
        <!-- End Navigation -->
    </div>
    <!-- End Header -->

    <!-- Main -->
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
                    <table border="1" width="100%">
                        <td> Картинка</td>
                        <td> Имя фирмы</td>
                        <td> Модель</td>
                        <td> Цена</td>
                        <td> ДЕЙСТВИЕ</td>
                        </tr>
                        <c:forEach var="i" items="${requestScope.userBasket}">
                            <tr>
                                <td><img src="${i.image_product}"/></td>
                                <td> ${i.name_product} </td>
                                <td> ${i.model_product} </td>
                                <td> ${i.price_model} руб.</td>
                                <td><a href="#">Удалить</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <c:if test="${(requestScope.userBasket == null) && (requestScope.product != null)}">
                    <ul>
                        <c:forEach var="p" items="${requestScope.product}">
                            ${p.class_name}
                            <a href="#"><img src="${p.image}" alt=""/></a>
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
            <!-- End Products -->

        </div>
        <!-- End Content -->

        <!-- Sidebar -->
        <div id="sidebar">

            <!-- Categories -->
            <div class="box categories">
                <h2>Категории <span></span></h2>
                <div class="box-content">
                    <ul>
                        <c:forEach var="p" items="${requestScope.category}" varStatus="i">
                            <c:if test="${i.count != requestScope.category_last}">
                                <li><a href="MySite?category=${p.id}">${p.nameCategories}</a></li>
                            </c:if>
                            <c:if test="${i.count == requestScope.category_last}">
                                <li class="last"><a href="MySite?category=${p.id}">${p.nameCategories}</a></li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- End Categories -->

        </div>
        <!-- End Sidebar -->

       <div class="cl">&nbsp;</div>
    </div>
    <!-- End Main -->

    <!-- Side Full -->
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
        <!-- End More Products -->

        <!-- Text Cols -->
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
        <!-- End Text Cols -->

    </div>
    <!-- End Side Full -->

    <!-- Footer -->
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
    <!-- End Footer -->

</div>
<!-- End Shell -->


</body>
</html>


