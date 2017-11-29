package ru.IronShop.web.MySql;

import ru.IronShop.web.ObjectSite.Basket;
import ru.IronShop.web.ObjectSite.DataOfProduct.Category;
import ru.IronShop.web.ObjectSite.DataOfProduct.Product;
import ru.IronShop.web.ObjectSite.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySqlEdit {

    private static final String url = "jdbc:mysql://srv4.minecraft-hosting.ru/p6048-1?characterEncoding=utf8";
    private static final String user = "p6048";
    private static final String password = "4665EAaYk5Wp3BDX";


    private static Connection cn;
    private static Statement st;
    private static ResultSet rs;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, user, password);
            st = cn.createStatement();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            ;
        }
    }

    // public MySqlEdit(){}

    public static List<Users> getAllUsers(String quare) {

        List<Users> list = new ArrayList<Users>();
        try {

            rs = st.executeQuery(quare);
            while (rs.next()) {
                Users u = new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(u);
            }
        } catch (Exception e) {
            list.add(new Users("" + e, "Eror", "Error", "Eror", "Eror"));
        }
        return list;
    }

    public static List<Product> getProduct(String quare) {
        List<Product> list = new ArrayList<Product>();
        try {
            int counter = 0;
            rs = st.executeQuery(quare);
            while (rs.next()) {
                counter++;
                Product p = new Product(rs.getInt(1), ((counter % 3) == 0) ? "<li class = \"last\">" : "<li>", rs.getString(2), rs.getString(3)
                        , rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getInt(8));
                list.add(p);

            }
        } catch (Exception e) {
            ;
        }
        return list;


    }


    public static void register(Users a) {
        try {
            st.executeUpdate("INSERT INTO users(name,fam,mail,password) VALUES('" + a.name + "','" + a.fam + "','" + a.mail + "','" + a.password + "');");
        } catch (SQLException e) {
            ;
        }
    }

    public static void updateInfo(String quary){
        try {
            st.executeUpdate(quary);
        }catch (SQLException e){;}
    }


    public static int counter(String quare) {
        int count = 0;
        try {
            rs = st.executeQuery(quare);
            rs.last();
            count = rs.getRow();
        } catch (SQLException e) {
            System.out.println("" + e);
        }
        return count;
    }


    public static ArrayList<Category> updateCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            rs = st.executeQuery("SELECT * FROM category;");
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
            rs.close();
        } catch (SQLException e) {
            ;
        }
        return list;
    }

    public static double getCost(int user_id) {
        double sum = 0;
        List<mySqlBasket> userCoust = new ArrayList<>();
        List<Product> productCost = getProduct("SELECT * FROM product");
        try {
            rs = st.executeQuery("SELECT * FROM basket WHERE basket.id_user = " + user_id);
            while (rs.next()) {
                userCoust.add(new mySqlBasket(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
            for (int i = 0; i < userCoust.size(); i++) {
                for (int j = 0; j < productCost.size(); j++) {
                    if (userCoust.get(i).id_product == productCost.get(j).id) {
                        sum += Double.parseDouble(productCost.get(j).price);
                        break;
                    }
                }
            }
        } catch (SQLException e) {;}

        return sum;
    }

    public static List<Basket> getUserBasket(int user_id) {
        List<Basket> userCoust = new ArrayList<>();
        try {
            rs = st.executeQuery("SELECT product.id_product, product.image, product.name, product.model, product.price, basket.id_basket from product" +
                    " RIGHT JOIN basket ON product.id_product = basket.id_product WHERE basket.id_user=" + user_id);
            while (rs.next()) {
              
                userCoust.add(new Basket(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5),rs.getInt(6)));
            }

        } catch (SQLException e) {;}

        return userCoust;
    }

    static class mySqlBasket {
        public int id_basket;
        public int id_product;
        public int id_user;

        public mySqlBasket(int id_basket, int id_product, int id_user) {
            this.id_basket = id_basket;
            this.id_product = id_product;
            this.id_user = id_user;
        }
    }

}