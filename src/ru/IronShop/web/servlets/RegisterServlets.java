package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.Users;
import ru.IronShop.web.SendMail.Mail;
import ru.IronShop.web.SendMail.TextMessage.TextForSendToAmail;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class RegisterServlets extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Mail mail = new Mail();
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        //Register
        if (req.getParameter("send").equals("true")) {
            String userName = req.getParameter("name");
            String userFam =  req.getParameter("fam");
            String userMail =  req.getParameter("mail");
            Users u = new Users("0", userName, userFam, userMail, req.getParameter("password"));
            session.setAttribute("acceptUser", u);
            req.setAttribute("rname", userName);
            req.setAttribute("rfam", userFam);
            req.setAttribute("rmail", userMail);
            mail.sendMessage(req.getParameter("mail"),"Registration in IronShop", TextForSendToAmail.RegistrMessage(userFam, userName));
            req.getRequestDispatcher("WEB-INF/jsps/AcceptMailPage.jsp").forward(req, resp);
        }
        if (req.getParameter("send").equals("false")) {
            //Login
            List<Users> temp = MySqlEdit.getAllUsers("SELECT * FROM users WHERE users.mail='" + req.getParameter("mail") + "' AND users.password = '" + req.getParameter("password") + "';");
            session.setAttribute("session_user_id", temp.get(0).id);
            session.setAttribute("session_user_name", temp.get(0).name);
            session.setAttribute("session_user_fam", temp.get(0).fam);
            session.setAttribute("session_user_mail", temp.get(0).mail);
            session.setAttribute("session_user_sum_art", MySqlEdit.counter("SELECT * FROM basket WHERE basket.id_user = " + temp.get(0).id + ";"));
            session.setAttribute("session_user_sum_cost", MySqlEdit.getCost(Integer.parseInt(temp.get(0).id)));

            if (MySqlEdit.counter("SELECT * FROM admin WHERE admin.user_id = '" + temp.get(0).id + "';") > 0) {
                req.setAttribute("key", "f952dgsc8Cji31916WdkTNrodZAEngwkCdl7TWdK6wjI6R5O0Mpu6wAjAowG99FR");
                req.getRequestDispatcher("Admin").forward(req, resp);
            } else {
                req.getRequestDispatcher("IronShop").forward(req, resp);
            }
        }
    }
}
