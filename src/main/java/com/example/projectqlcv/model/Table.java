package com.example.projectqlcv.model;

public class Table {
    private int id;
    private int idGroup;
    private String name;
    private String permission;
    private String status;

    public Table() {
    }

    public Table(int id, int idGroup, String name, String permission , String status) {
        this.id = id;
        this.idGroup = idGroup;
        this.name = name;
        this.permission = permission;
        this.status=status;
    }

    public Table(int id, int idGroup, String name, String permission) {
        this.id = id;
        this.idGroup = idGroup;
        this.name = name;
        this.permission = permission;
    }

    public Table(int id, String name, String permission) {
        this.id = id;
        this.name = name;
        this.permission = permission;
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