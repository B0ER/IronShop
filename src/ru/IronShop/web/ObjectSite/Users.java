package ru.IronShop.web.ObjectSite;

public class Users {

    public String id;
    public String name;
    public String fam;
    public String mail;
    public String password;


    public Users(){;}

    public Users(String id, String name,  String fam, String mail, String password ){
        this.id = id;
        this.name = name;
        this.fam = fam;
        this.mail = mail;
        this.password = password;
    }

    @Override
    public String toString(){
        return id+" "+ name+" "+fam+" "+password+" "+mail;
    }
}
