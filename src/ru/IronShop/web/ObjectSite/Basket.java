package ru.IronShop.web.ObjectSite;

public class Basket {

    public Integer id_product;
    public String image_product;
    public String name_product;
    public String model_product;
    public String price_model;
    public Integer id_basket;

    public Basket(Integer id_product, String image_product, String name_product, String model_product, String price_model,Integer id_basket) {
        this.id_product = id_product;
        this.image_product = image_product;
        this.name_product = name_product;
        this.model_product = model_product;
        this.price_model = price_model;
        this.id_basket = id_basket;

    }

    public Integer getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getImage_product() {
        return image_product;
    }

    public void setImage_product(String image_product) {
        this.image_product = image_product;
    }

    public String getName_product() {
        return name_product;
    }

    public void setName_product(String name_product) {
        this.name_product = name_product;
    }

    public String getModel_product() {
        return model_product;
    }

    public void setModel_product(String model_product) {
        this.model_product = model_product;
    }

    public String getPrice_model() {
        return price_model;
    }

    public void setPrice_model(String price_model) {
        this.price_model = price_model;
    }

    public Integer getId_basket() {
        return id_basket;
    }

    public void setId_basket(Integer id_basket) {
        this.id_basket = id_basket;
    }
}

