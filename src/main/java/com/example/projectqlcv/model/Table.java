package com.example.projectqlcv.model;

public class Table {
    private int id;
    private int idGroup;
    private int idUser;
    private String name;
    private String permission;

    public Table() {
    }

    public Table(int id, String name,String permission) {
        this.id = id;
        this.name = name;
        this.permission = permission;
    }

    public Table(int id, int idUser, String name, String permission) {
        this.id = id;
        this.idUser = idUser;
        this.name = name;
        this.permission = permission;
    }


    public Table(int id, int idGroup, int idUser, String name, String permission) {
        this.id = id;
        this.idGroup = idGroup;
        this.idUser = idUser;
        this.name = name;
        this.permission = permission;
    }

    public Table(int id, int idGroup, int idUser) {
        this.id = id;
        this.idGroup = idGroup;
        this.idUser = idUser;
    }

    public Table(int id, int idGroup, int idUser, String name) {
        this.id = id;

        this.idGroup = idGroup;
        this.idUser = idUser;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getIdGroup() {
        return idGroup;
    }

    public void setIdGroup(int idGroup) {
        this.idGroup = idGroup;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}