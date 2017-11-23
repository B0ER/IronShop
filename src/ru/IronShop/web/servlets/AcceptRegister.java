package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class AcceptRegister extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            Users temp = (Users) session.getAttribute("acceptUser");
            MySqlEdit.register(temp);
            session.removeAttribute("acceptUser");
            req.setAttribute("mail",temp.mail);
            req.setAttribute("thanks","true");
        req.getRequestDispatcher("WEB-INF/jsps/AcceptMailPage.jsp").forward(req,resp);



    }
}
