package com.example.projectqlcv.model;

public class Column {
    private int id;
    private int idTable;
    private String name;

    public Column() {
    }

    public Column(int id, int idTable) {
        this.id = id;
        this.idTable = idTable;
    }


    public Column(int id, int idTable, String name) {
        this.id = id;
        this.idTable = idTable;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdTable() {
        return idTable;
    }

    public void setIdTable(int idTable) {
        this.idTable = idTable;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
