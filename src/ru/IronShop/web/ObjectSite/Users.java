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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFam() {
        return fam;
    }

    public void setFam(String fam) {
        this.fam = fam;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
