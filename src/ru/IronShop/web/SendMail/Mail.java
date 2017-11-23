package ru.IronShop.web.SendMail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.lang.reflect.Field;
import java.nio.charset.Charset;
import java.util.Properties;

public class Mail {

    public void sendMessage(String to,String title,String text) {
        try {

            Properties p = new Properties();
            p.put("mail.transport.protocol", "smtps");
            p.put("mail.smtps.auth", "true");
            p.put("mail.smtps.host", "smtp.gmail.com");
            p.put("mail.smtps.user", "Adm.IronShop@gmail.com");

            //p.load(EmailLesson.class.getClassLoader().getResourceAsStream("mail.properties"));

            Session mailSession = Session.getDefaultInstance(p);
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress("Adm.IronShop@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(title);
            message.setText(text,"UTF-8");


            Transport tr = mailSession.getTransport();
            tr.connect("Adm.IronShop@gmail.com", "fastpassword123321");
            tr.sendMessage(message, message.getAllRecipients());
            tr.close();
        }catch(Exception e){;}
    }


}
