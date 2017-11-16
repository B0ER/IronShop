package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.DataOfProduct.Category;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class BasketAct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Category> temp = MySqlEdit.updateCategory();
        HttpSession session = request.getSession();

        if(request.getParameter("category") != null)
            request.setAttribute("product", MySqlEdit.getProduct("SELECT * FROM product WHERE product.id_category = "+request.getParameter("category")));
        else
            request.setAttribute("product", MySqlEdit.getProduct("SELECT * FROM product"));;

        Boolean isSignUp = true;
        if(session.getAttribute("session_user_name") != null)
            isSignUp = false;
        request.setAttribute("isSigUp", isSignUp);

        request.setAttribute("category", temp);
        request.setAttribute("category_last", temp.size());
        request.getRequestDispatcher("WEB-INF/jsps/MainIronShop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        if(req.getParameter("category") != null)
            req.setAttribute("product", MySqlEdit.getProduct("SELECT * FROM product WHERE product.id_category = "+req.getParameter("category")));
        else
            req.setAttribute("product", MySqlEdit.getProduct("SELECT * FROM product"));

        List<Category> temp = MySqlEdit.updateCategory();
        req.setAttribute("category", temp);
        req.setAttribute("category_last", temp.size());
        req.getRequestDispatcher("WEB-INF/jsps/BasketAct.jsp").forward(req, resp);
    }
}
