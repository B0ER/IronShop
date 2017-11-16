package ru.IronShop.web.ObjectSite.DataOfProduct;

import java.util.LinkedList;

/**
 * Created by Elena on 16.11.2017.
 */
public class Category {
    public Integer id;
    public String nameCategories;

    public Category(Integer id, String nameCategories){
        this.id = id;
        this.nameCategories = nameCategories;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameCategories() {
        return nameCategories;
    }

    public void setNameCategories(String nameCategories) {
        this.nameCategories = nameCategories;
    }

    @Override
    public String toString() {
        return nameCategories;
    }
}
