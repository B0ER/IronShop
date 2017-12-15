package ru.IronShop.web.MySql;

public class MySqlManager {

    MySqlManager(){}


    public static boolean searchQuantityUsersToBD(String mail){
        int count = MySqlEditor.counter("SELECT * FROM users WHERE mail='" + mail  + "';");
        return (count > 0) ? true:false;
    }

    public static boolean userAuthorization(String mail, String password){
        int user = MySqlEditor.counter("SELECT * FROM users WHERE mail='" + mail  + "'" + " AND password = '" + password + "';");
        return (user > 0) ? true:false;
    }



}
