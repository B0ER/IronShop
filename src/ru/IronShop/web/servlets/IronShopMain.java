package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.DataOfProduct.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class IronShopMain extends  HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        MySqlEdit ms = new MySqlEdit();
        request.setCharacterEncoding("UTF-8");
        List<Product> p = new ArrayList<Product>();

        request.setAttribute("product",ms.getProduct("SELECT * FROM product;"));
        request.getRequestDispatcher("WEB-INF/jsps/MainIronShop.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        MySqlEdit ms = new MySqlEdit();

        req.setCharacterEncoding("UTF-8");
        List<Product> p = new ArrayList<Product>();
        req.setAttribute("product",ms.getProduct("SELECT * FROM product"));
        req.getRequestDispatcher("WEB-INF/jsps/MainIronShop.jsp").forward(req,resp);;
    }
}
