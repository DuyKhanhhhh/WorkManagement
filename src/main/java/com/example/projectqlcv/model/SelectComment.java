package com.example.projectqlcv.model;

public class SelectComment {
    private int id;
    private String name;
    private String avatar;
    private String comment;
    private int idUser;

    public SelectComment(String name, String avatar, String comment) {
        this.name = name;
        this.avatar = avatar;
        this.comment = comment;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public SelectComment(int id, String name, String avatar, String comment) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.comment = comment;
    }

    public SelectComment(int id, String name, String avatar, String comment, int idUser) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.comment = comment;
        this.idUser = idUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
