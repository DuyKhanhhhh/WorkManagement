package com.example.projectqlcv.model;

public class Card {
    private int id;
    private int idUser;
    private int idColumn;
    private String name;
    private String content;
    private String comment;
    private String label;
    private String link;

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Card(int id, int idUser, int idColumn, String name, String content, String comment, String label, String link) {
        this.id = id;
        this.idUser = idUser;
        this.idColumn = idColumn;
        this.name = name;
        this.content = content;
        this.comment = comment;
        this.label = label;
        this.link = link;
    }

    public Card() {
    }

    public Card(int id) {
        this.id = id;
    }

    public Card(int id, int idColumn, String name, String content) {
        this.id = id;
        this.idColumn = idColumn;
        this.name = name;
        this.content = content;
    }

    public Card(int id, int idUser, int idColumn, String comment) {
        this.id = id;
        this.idUser = idUser;
        this.idColumn = idColumn;
        this.comment = comment;
    }

    public Card(String name) {
        this.name = name;
    }

    public Card(int id, int idColumn, String name, String content, String comment) {
        this.id = id;
        this.idColumn = idColumn;
        this.name = name;
        this.content = content;
        this.comment = comment;
    }

    public Card(int id, int idColumn, String name, String content, String comment, String label) {
        this.id = id;
        this.idColumn = idColumn;
        this.name = name;
        this.content = content;
        this.comment = comment;
        this.label = label;
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

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdColumn() {
        return idColumn;
    }

    public void setIdColumn(int idColumn) {
        this.idColumn = idColumn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
