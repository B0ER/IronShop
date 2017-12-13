package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminPanelLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        toComeIn(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        toComeIn(req, resp);
    }

    private void toComeIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("Category") != null || (req.getAttribute("key") != null && req.getAttribute("key").equals("f952dgsc8Cji31916WdkTNrodZAEngwkCdl7TWdK6wjI6R5O0Mpu6wAjAowG99FR"))) {
            req.setAttribute("userList", MySqlEdit.getAllUsers("SELECT * FROM users;"));
            req.setAttribute("adminList", MySqlEdit.getAllUsers("SELECT users.id, users.name, users.fam, users.mail, users.password FROM users RIGHT JOIN admin on admin.user_id = users.id;"));
            req.setAttribute("productList", MySqlEdit.getProduct("SELECT * FROM product;"));
            req.setAttribute("categoryList", MySqlEdit.updateCategory());

            req.getRequestDispatcher("WEB-INF/jsps/Admin.jsp").forward(req, resp);
        } else
            req.getRequestDispatcher("IronShop").forward(req, resp);
    }
}
