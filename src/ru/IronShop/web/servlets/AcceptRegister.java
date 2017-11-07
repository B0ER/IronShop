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

        try {
            MySqlEdit ms = new MySqlEdit();
            HttpSession session = req.getSession();
            Users temp = (Users) session.getAttribute("acceptUser");
            ms.register(temp);

            session.removeAttribute("acceptUser");
        }catch (NullPointerException e){
            req.getRequestDispatcher("/vk.com").forward(req,resp);
        }




    }
}
