package com.example.projectqlcv.model;

public class Group {
    private int id;
    private String name;
    private String title;
    private String permission;
    private String  information;
    private int idUser;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIdTable() {
        return idTable;
    }

    public void setIdTable(int idTable) {
        this.idTable = idTable;
    }

    private int idTable;
    public Group(){}

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
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

    public String getGroupType() {
        return title;
    }

    public void setGroupType(String title) {
        this.title = title;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public Group(String name, String title, String permission, String information, int id) {
    }

    public Group(String name, String groupType, String permission, String information) {
        this.name = name;
        this.title = groupType;
        this.permission = permission;
        this.information = information;
    }

    public Group(int id, String name, String title, String permission, String information, int idUser) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.permission = permission;
        this.information = information;
        this.idUser = idUser;
    }

    public Group(int id, String name, String title, String permission, String information) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.permission = permission;
        this.information = information;
    }
}
