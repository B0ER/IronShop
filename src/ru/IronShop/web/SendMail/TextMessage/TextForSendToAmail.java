package ru.IronShop.web.SendMail.TextMessage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TextForSendToAmail {

    public static String RegistrMessage(String fam, String name){
        String textMeassage =
        "Thank you for registering " + fam + " " + name + "\n" +
                "To proceed with the registration, click on the link http://localhost/Accept \n" +
                "Otherwise, just ignore this message.\n" +
                "Thank you for your attention. PS: Imposible and B0ER company!";
        return textMeassage;
    }
}
