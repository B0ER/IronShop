package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.Basket;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class BasketAct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        if(session.getAttribute("session_user_id") != null) {
            List<Basket> basketList = MySqlEdit.getUserBasket(Integer.parseInt((String) session.getAttribute("session_user_id")));
            req.setAttribute("userBasket", basketList);
        }
        req.getRequestDispatcher("IronShop").forward(req, resp);
    }

}
