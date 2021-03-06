package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.MySql.MySqlManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ErrorRegForm extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MySqlEdit ms = new MySqlEdit();
        req.setCharacterEncoding("UTF-8");

        if(req.getParameter("send").equals("true")) {
            if (MySqlManager.searchQuantityUsersToBD( req.getParameter("mail"))) {
                req.setAttribute("alreadyMail", "true");
                req.getRequestDispatcher("RegForm").forward(req, resp);
            } else {
                req.getRequestDispatcher("Sign").forward(req, resp);
            }
        }else

        if(MySqlManager.userAuthorization(req.getParameter("mail"),req.getParameter("password")))
        {
            req.getRequestDispatcher("Sign").forward(req, resp);
        } else {
            req.setAttribute("alreadyMailandPassword","true");
            req.getRequestDispatcher("RegForm").forward(req, resp);
        }
    }
}
