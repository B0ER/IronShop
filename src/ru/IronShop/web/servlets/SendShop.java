package ru.IronShop.web.servlets;

import ru.IronShop.web.MySql.MySqlEdit;
import ru.IronShop.web.ObjectSite.Basket;
import ru.IronShop.web.SendMail.Mail;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.util.List;

public class SendShop extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Mail mail = new Mail();


        if(session.getAttribute("session_user_id") != null) {
            List<Basket> basketList = MySqlEdit.getUserBasket(Integer.parseInt((String) session.getAttribute("session_user_id")));


            String text = "Brand\t\t\tModel\t\t\tPrice\n";

            for(Basket t :basketList){
                text+=t.getName_product()+"\t"+t.getModel_product()+"\t"+t.getPrice_model()+" RUB\n";
            }
            text+="Total cost:"+session.getAttribute("session_user_sum_cost")+" RUB\n";

            mail.sendMessage((String)session.getAttribute("session_user_mail"),
                    "You're Shop by IronMine",
                    "Thank you for your purchase " + session.getAttribute("session_user_fam") + " " + session.getAttribute("session_user_name") + "\n" +text+
                            "If you bought these products please go to the link http://localhost/Accept?ShopBuy=true \n" +
                            "Otherwise, just ignore this message.\n" +
                            "Thank you for your attention. PS: Imposible and B0ER company!");

            /*
            mail.sendMessage("impossible1770@gmail.com",
                    "You're Shop by IronMine",
                    "Thank you for registering " + req.getParameter("fam") + " " + req.getParameter("name") + "\n" +
                            "To proceed with the registration, click on the link http://localhost/Accept \n" +
                            "Otherwise, just ignore this message.\n" +
                            "Thank you for your attention. PS: Imposible and B0ER company!");
            */

            req.setAttribute("userBasket", basketList);

        }




        req.getRequestDispatcher("WEB-INF/jsps/AcceptShop.jsp").forward(req, resp);
    }

}
