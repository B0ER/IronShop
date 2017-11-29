<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Sign-Up/Login Form</title>
    <link rel="stylesheet" href="RegStyle/css/style.css">
</head>
<body>
<div class="form">

    <ul class="tab-group">
        <li class="tab active"><a href="#signup">Регистрация</a></li>
        <li class="tab"><a href="#login">Авторизация</a></li>
    </ul>

    <div class="tab-content">
        <div id="signup">
            <h1>Зарегистрируйтесь</h1>

            <form action="ErrorSign" method="POST">

                <div class="top-row">
                    <div class="field-wrap">
                        <label >
                            Имя<span class="req">*</span>
                        </label>
                        <input type="text" name="name"  required autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Фамилия<span class="req">*</span>
                        </label>
                        <input type="text" name="fam"  required autocomplete="off"/>
                    </div>
                </div>
                <c:if test="${requestScope.alreadyMail != null}">
                <p> <div class = "error-email" style="color: Red; "><b>Данный имейл уже зарегистрирован</b></div> <p>
                </c:if>
                <div class="field-wrap">
                    <label>
                        Email Address<span class="req">*</span>
                    </label>

                    <input type="email" name="mail"  required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        Set A Password<span class="req">*</span>
                    </label>
                    <input type="password" name="password"  required autocomplete="off"/>
                </div>
                <button type="submit" name="send" value="true" class="button button-block"/>Отправить</button>

            </form>

        </div>

        <div id="login">
            <h1>Авторизуйтесь!</h1>


            <form action="ErrorSign" method="POST">
                <c:if test="${requestScope.alreadyMailandPassword != null}">
                <p> <div class = "error-email" style="color: Red; "><b>Логин или пароль не верны!</b></div> <p>
                </c:if>


                <div class="field-wrap">
                    <label>
                        Email Address<span class="req">*</span>
                    </label>
                    <input type="email" name="mail"  required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        Password<span class="req">*</span>
                    </label>
                    <input type="password"  name="password"required autocomplete="off"/>
                </div>

                <p class="forgot"><a href="https://xplayon.com/images/softimages0/17-10/Eto-Fiasko-bratan/Eto-Fiasko-bratan-1.jpg">Забыли пароль?</a></p>

                <button type="submit" name="send" value="false" class="button button-block"/>Вход</button>
            </form>
        </div>
    </div>

</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script  src="RegStyle/js/index.js"></script>

</body>
</html>