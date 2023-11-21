package com.example.projectqlcv.model;

public class UserToCard {
    private int id;
    private int idUser;
    private int idCard;
    private String nameUser;
    private String emailUser;
    private String avatar;

    public UserToCard() {
    }

    public UserToCard(int id, int idUser, int idCard, String nameUser, String emailUser, String avatar) {
        this.id = id;
        this.idUser = idUser;
        this.idCard = idCard;
        this.nameUser = nameUser;
        this.emailUser = emailUser;
        this.avatar = avatar;
    }

    public UserToCard(int id, int idUser, String nameUser, String emailUser, String avatar) {
        this.id = id;
        this.idUser = idUser;
        this.nameUser = nameUser;
        this.emailUser = emailUser;
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public int getIdCard() {
        return idCard;
    }

    public void setIdCard(int idCard) {
        this.idCard = idCard;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
