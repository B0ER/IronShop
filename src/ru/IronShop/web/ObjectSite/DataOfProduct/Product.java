package ru.IronShop.web.ObjectSite.DataOfProduct;

/**
 * Created by Elena on 14.11.2017.
 */
public class Product {

        public Integer id;
    public String class_name;
    public String image;
    public String model;
    public String price;
    public String sex;
    public String desk;
    public Integer id_category;

        public Product() {
            id = null;
            class_name = null;
            image = null;
            model = null;
            price = null;
            sex  = null;
            desk  = null;
            id_category = null;
        }

        public Product(Integer id,String class_name, String image, String model, String price, String sex, String desk, Integer id_category) {
            this.id = id;
            this.class_name = class_name;
            this.image = image;
            this.model = model;
            this.price = price;
            this.sex = sex;
            this.desk = desk;
            this.id_category = id_category;
        }


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDesk() {
        return desk;
    }

    public void setDesk(String desk) {
        this.desk = desk;
    }

    public Integer getId_category() {
        return id_category;
    }

    public void setId_category(Integer id_category) {
        this.id_category = id_category;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }
}
