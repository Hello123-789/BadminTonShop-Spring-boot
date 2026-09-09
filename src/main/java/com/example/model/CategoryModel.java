package com.example.model;

import java.io.Serializable;
import jakarta.validation.constraints.NotEmpty;

public class CategoryModel implements Serializable {

    private static final long serialVersionUID = 1L;

    private int categoryId;

    @NotEmpty(message = "Không được để trống tên category")
    private String categoryname;

    private String images;

    private int status = 1;

    private Boolean isEdit = false;

    public CategoryModel() {
    }

    public CategoryModel(int categoryId, String categoryname, String images, int status, Boolean isEdit) {
        this.categoryId = categoryId;
        this.categoryname = categoryname;
        this.images = images;
        this.status = status;
        this.isEdit = isEdit;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Boolean getIsEdit() {
        return isEdit;
    }

    public void setIsEdit(Boolean isEdit) {
        this.isEdit = isEdit;
    }
}
