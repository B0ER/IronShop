package ru.IronShop.web.MySql;

import java.sql.*;

/**
 * Created by Elena on 15.12.2017.
 */
public class MySqlEditor {

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
        } catch (ClassNotFoundException e) { e.printStackTrace(); }
          catch (SQLException e) {e.printStackTrace();}
    }

    public static int counter(String query) {
        int count = 0;
        try {
            rs = st.executeQuery(query);
            rs.last();
            count = rs.getRow();
        } catch (SQLException e) {e.printStackTrace();
        }
        return count;
    }



}
