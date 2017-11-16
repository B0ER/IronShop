package ru.IronShop.web.ObjectSite;

public class Basket {

    public int id_product;
    public int image_product;
    public int name_product;
    public int model_product;
    public int price_model;
    public int id_user;

    public Basket(int id_product, int image_product, int name_product, int model_product, int price_model, int id_user) {
        this.id_product = id_product;
        this.image_product = image_product;
        this.name_product = name_product;
        this.model_product = model_product;
        this.price_model = price_model;
        this.id_user = id_user;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getImage_product() {
        return image_product;
    }

    public void setImage_product(int image_product) {
        this.image_product = image_product;
    }

    public int getName_product() {
        return name_product;
    }

    public void setName_product(int name_product) {
        this.name_product = name_product;
    }

    public int getModel_product() {
        return model_product;
    }

    public void setModel_product(int model_product) {
        this.model_product = model_product;
    }

    public int getPrice_model() {
        return price_model;
    }

    public void setPrice_model(int price_model) {
        this.price_model = price_model;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
}
