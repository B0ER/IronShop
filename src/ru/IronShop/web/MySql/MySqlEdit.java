package ru.IronShop.web.MySql;

import ru.IronShop.web.ObjectSite.DataOfProduct.Product;
import ru.IronShop.web.ObjectSite.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySqlEdit {

    private static final String url = "jdbc:mysql://srv4.minecraft-hosting.ru/p6048-1?characterEncoding=utf8";
    private static final String user = "p6048";
    private static final String password = "4665EAaYk5Wp3BDX";


    private  Connection cn;
    private  Statement st;
    private  ResultSet rs;

    private  String quare;



    public MySqlEdit(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, user, password);
            st = cn.createStatement();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(SQLException e){;}
    }
    public  List<Users> getAllUsers(String quare){

        List<Users> list = new ArrayList<Users>();
        try {

            rs = st.executeQuery("SELECT * from users");
            while (rs.next()) {
                Users u = new Users(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                list.add(u);
            }
            }catch (Exception e){list.add(new Users(""+e,"Eror","Error","Eror","Eror"));}
        return list;
        }

        public List<Product> getProduct(String quare){
            List<Product> list = new ArrayList<Product>();
            try {
                int counter=0;
                rs = st.executeQuery("SELECT * from product");
                while (rs.next()) {
                    counter++;
                        Product p = new Product(rs.getInt(1),((counter%3) == 0)?"<li class = \"last\">":"<li>",rs.getString(2),rs.getString(3)
                        ,rs.getString(5),rs.getString(6),rs.getString(7),
                                rs.getInt(8));
                        list.add(p);

                }
            }catch (Exception e){;}
            return list;


        }



    public void register(Users a){
        try {
            st.executeUpdate("INSERT INTO users(name,fam,mail,password) VALUES('"+a.name+"','"+a.fam+"','"+a.mail+"','"+a.password+"');");
            }catch (SQLException e){;}
        }


    public int counter(String quare) {
        int count=0;
        try {
            rs = st.executeQuery(quare);
            rs.last();
            count = rs.getRow();
        }catch (SQLException e){System.out.println(""+e);}
        return count;
    }


    }




