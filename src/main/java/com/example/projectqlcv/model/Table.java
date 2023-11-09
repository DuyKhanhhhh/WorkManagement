package com.example.projectqlcv.model;

public class Table {
    private int id;
    private int idGroup;
    private String name;
    private String permission;

    public Table() {
    }


    public Table(int id, String name, String permission) {
        this.id = id;
        this.name = name;
        this.permission = permission;
    }

    public Table(int id, int idGroup, String name, String permission) {
        this.id = id;
        this.idGroup = idGroup;
        this.name = name;
        this.permission = permission;
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