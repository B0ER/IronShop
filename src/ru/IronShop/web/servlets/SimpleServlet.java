package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class SimpleServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
            MySqlEdit ms = new MySqlEdit();


        Users u = new Users("q","w","e","r","y");

        List <Users> l = new ArrayList<Users>();
        l.add(u);
        request.setAttribute("at",l);



        request.getRequestDispatcher("WEB-INF/jsps/ab-3.jsp").forward(request,response);


    }




}