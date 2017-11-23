package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AddProductToBasket extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if((session.getAttribute("session_user_id") != null) ){
            if((req.getParameter("toBasket") !=null)) {
                String id = (String) session.getAttribute("session_user_id"); //тут id
                MySqlEdit.updateInfo("INSERT INTO basket(id_product, id_user) VALUES(" + req.getParameter("toBasket") + ", " + id + ");");
                updateInfoUserBasket(req);
                req.getRequestDispatcher("IronShop").forward(req, resp);
            }

            if(req.getParameter("delBasket")!=null){

                MySqlEdit.updateInfo("DELETE FROM basket WHERE basket.id_basket = "+req.getParameter("delBasket"));
                updateInfoUserBasket(req);
                //req.setAttribute("userBasket",null);
                req.getRequestDispatcher("BasketAct").forward(req, resp);
            }

        }
        else{
            req.getRequestDispatcher("RegForm").forward(req, resp);
        }
    }


    public void updateInfoUserBasket(HttpServletRequest req){
        HttpSession session = req.getSession();
        session.removeAttribute("session_user_sum_art");
        session.removeAttribute("session_user_sum_cost");
        List<Users> temp = MySqlEdit.getAllUsers("SELECT * FROM users WHERE users.mail='" + session.getAttribute("session_user_mail")+"';");
        session.setAttribute("session_user_sum_art", MySqlEdit.counter("SELECT * FROM basket WHERE basket.id_user = " + temp.get(0).id + ";"));
        session.setAttribute("session_user_sum_cost", MySqlEdit.getCost(Integer.parseInt(temp.get(0).id)));
    }


}