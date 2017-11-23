package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class AdminAct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Проверка нажатия кнопки юзера
        if (req.getParameter("user") != null) {

            //если добавляют
            if (req.getParameter("two").equals("add")) {
                MySqlEdit.updateInfo("INSERT INTO users(name,fam,mail,password) " +
                        "VALUES('" + req.getParameter("name") + "', '" + req.getParameter("fam") + "', '" +
                        req.getParameter("login") + "', '" + req.getParameter("pass") + "');");

                if (req.getParameter("six").equals("yes")) {
                    MySqlEdit.updateInfo("INSERT INTO admin(user_id) VALUES ('" +
                            MySqlEdit.getAllUsers("SELECT * FROM users WHERE mail='" + req.getParameter("login") + "';").get(0).getId() + "');");
                }
            }
            //если удаляют
            else if (req.getParameter("two").equals("del")) {

                MySqlEdit.updateInfo("DELETE FROM users " +
                        "WHERE mail='" + req.getParameter("login") + "';");
            }
            //если добавляют и сразу в админы

        }

        //Проверка нажатия кнопки Админа
        if (req.getParameter("admin") != null) {
            //Добавление админа по id
            if (req.getParameter("three").equals("add")) {
                MySqlEdit.updateInfo("INSERT INTO admin(user_id) VALUES (" + req.getParameter("id_admin") + ");");
            }
            //Удаление админа по id
            else if (req.getParameter("three").equals("del")) {
                MySqlEdit.updateInfo("DELETE FROM admin WHERE user_id=" + req.getParameter("id_admin") + ";");
            }
        }

        //Проверка нажатия кнопки продукта(товара)
        if (req.getParameter("Product") != null) {
            //Добавление товара
            if (req.getParameter("four").equals("add")) {
                MySqlEdit.updateInfo(
                        "INSERT INTO product(image, name, model, price, sex, description, id_category) VALUES('"
                                + req.getParameter("URLImage_product") + "', '" + req.getParameter("name_product") + "', " + req.getParameter("price_product")
                                + "', " + req.getParameter("first") + "', " + req.getParameter("description_product") + "', '" + req.getParameter("categoryID_product") + "');");
            }
            //Удаление товара
            else if (req.getParameter("four").equals("del")) {
                MySqlEdit.updateInfo(
                        "DELETE FROM product WHERE name='" + req.getParameter("name_product") + "', model='" + req.getParameter("model_product") + "';");
            }
        }

        if (req.getParameter("Category_form") != null) {
            //добавление категории
            if (req.getParameter("five").equals("add")) {
                MySqlEdit.updateInfo("INSERT INTO category(name) VALUES ('" + req.getParameter("name_cat") + "');");
            }
            //удаление категории
            else if (req.getParameter("five").equals("del")) {
                MySqlEdit.updateInfo("DELETE FROM category WHERE name='" + req.getParameter("name_cat") + "';");
            }
        }

        //переход назад в админ панель
        req.setAttribute("key", "f952dgsc8Cji31916WdkTNrodZAEngwkCdl7TWdK6wjI6R5O0Mpu6wAjAowG99FR");
        req.getRequestDispatcher("Admin").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}