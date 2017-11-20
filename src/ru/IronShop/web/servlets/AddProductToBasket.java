package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddProductToBasket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (Integer) session.getAttribute("session_user_name"); //тут id
        if(session.getAttribute("session_user_name") != null){
            //MySqlEdit.insertInfo("INSERT INTO basket(id_product, id_user) VALUES(" + req.getAttribute("IDProduct") + ", id);");
        }
        req.getRequestDispatcher("").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}