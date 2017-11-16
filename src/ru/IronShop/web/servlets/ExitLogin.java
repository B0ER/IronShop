package ru.IronShop.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ExitLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        session.removeAttribute("session_user_name");
        session.removeAttribute("session_user_fam");
        session.removeAttribute("session_user_mail");
        session.removeAttribute("session_user_sum_art");
        session.removeAttribute("session_user_sum_cost");
        req.getRequestDispatcher("IronShop").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("IronShop").forward(req,resp);
    }
}
