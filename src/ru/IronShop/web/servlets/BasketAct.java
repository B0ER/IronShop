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

        List <Basket> basketList = MySqlEdit.getUserBasket(Integer.parseInt((String)session.getAttribute("session_user_name")));
        req.setAttribute("userBasket",basketList);

        req.getRequestDispatcher("IronShopMain").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        req.getRequestDispatcher("WEB-INF/jsps/BasketAct.jsp").forward(req, resp);
    }
}
