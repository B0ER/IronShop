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
        HttpSession sesion = request.getSession(true);


        List<String> l = new ArrayList<String>();



       // l.add("MyStr: "+ ms.getAllUsers().size());


        for(Users s: ms.getAllUsers()){
         l.add(s.toString());
        }


       sesion.setAttribute("getAll",l);

       // l.add("Xer");

        //



        request.getRequestDispatcher("WEB-INF/jsps/ab-3.jsp").forward(request,response);


    }




}
