package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ErrorRegister extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MySqlEdit ms = new MySqlEdit();
        req.setCharacterEncoding("UTF-8");




        if(req.getParameter("send").equals("true")) {
            if (ms.counter("SELECT * FROM users WHERE mail='" + req.getParameter("mail") + "';") > 0) {
                req.setAttribute("alreadyMail", "true");
                req.getRequestDispatcher("RegForm").forward(req, resp);
            } else {
                req.getRequestDispatcher("Sign").forward(req, resp);
            }
        }else

        if(ms.counter("SELECT * FROM users WHERE mail='"+req.getParameter("mail")+"' AND password = '"+req.getParameter("password")+"';")>0)
        {
            req.getRequestDispatcher("Sign").forward(req, resp);
        }else{
            req.setAttribute("alreadyMailandPassword","true");
            req.getRequestDispatcher("RegForm").forward(req, resp);
        }


    }
}
