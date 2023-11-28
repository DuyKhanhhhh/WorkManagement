package com.example.projectqlcv.model;

import java.io.PrintWriter;

public class AddUserToTable {
    private int id;
    private int idUser;
    private int idGroup;
    private int idTable;
    private String role;
    private String nameUser;
    private String emailUser;
    private String avatar;
    private String status;
    private int countAvatar;

    public AddUserToTable(int idUser, int idTable, String role) {
        this.role = role;
        this.idUser = idUser;
        this.idTable = idTable;
    }


    public AddUserToTable(int countAvatar) {
        this.countAvatar = countAvatar;
    }

    public int getCountAvatar() {
        return countAvatar;
    }

    public void setCountAvatar(int countAvatar) {
        this.countAvatar = countAvatar;
    }

    public AddUserToTable(int id, int idTable, int idUser, int idGroup, String role, String avatar, String name, String emailUser, String status) {
        this.id = id;
        this.idUser = idUser;
        this.idGroup = idGroup;
        this.idTable = idTable;
        this.role = role;
        this.avatar = avatar;
        this.nameUser = name;
        this.emailUser = emailUser;
        this.status = status;
    }

    public int getIdTable() {
        return idTable;
    }

    public void setIdTable(int idTable) {
        this.idTable = idTable;
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

    public AddUserToTable(int id, String nameUser, String emailUser, String role, String avatar) {
        this.id = id;
        this.nameUser = nameUser;
        this.emailUser = emailUser;
        this.role = role;
        this.avatar = avatar;
    }

    public AddUserToTable() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdGroup() {
        return idTable;
    }

    public void setIdGroup(int idTable) {
        this.idTable = idTable;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public AddUserToTable(int id, int idTable, int idUser, String role) {
        this.id = id;
        this.idUser = idUser;
        this.idTable = idTable;
        this.role = role;
    }
}
