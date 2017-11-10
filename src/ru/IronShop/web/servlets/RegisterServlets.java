package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.Users;
import ru.IronShop.web.SendMail.Mail;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class RegisterServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MySqlEdit ms = new MySqlEdit();
        Mail mail = new Mail();
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        //Регистрация
        if(req.getParameter("send").equals("true")){
            Users u = new Users("0",req.getParameter("name"),req.getParameter("fam"),req.getParameter("mail"),req.getParameter("password"));
            session.setAttribute("acceptUser",u);
            req.setAttribute("rname",req.getParameter("name"));
            req.setAttribute("rfam",req.getParameter("fam"));
            req.setAttribute("rmail",req.getParameter("mail"));
            mail.sendMessage(req.getParameter("mail"),
                    "Registration in IronShop",
                    "Thank you for registering "+req.getParameter("fam")+" "+req.getParameter("name")+"\n" +
                            "To proceed with the registration, click on the link http://localhost/Accept \n" +
                            "Otherwise, just ignore this message.\n" +
                            "Thank you for your attention. PS: Imposible and B0ER company!");

            req.getRequestDispatcher("WEB-INF/jsps/AcceptMailPage.jsp").forward(req,resp);
        }
        if(req.getParameter("send").equals("false")){
                    //Авторизация
                List<Users> temp = ms.getAllUsers("SELECT * FROM users WHERE mail='"+req.getParameter("mail")+"' AND password = '"+req.getParameter("password")+"';");
                session.setAttribute("session_user_name",temp.get(0).name);
                session.setAttribute("session_user_fam",temp.get(0).fam);
                session.setAttribute("session_user_mail",temp.get(0).mail);
                req.getRequestDispatcher("MySite").forward(req,resp);
        }
    }
}
