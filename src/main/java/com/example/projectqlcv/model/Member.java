package com.example.projectqlcv.model;

public class Member {
    private int id;
    private int idGroup;
    private int idUser;
    private String role;
    private String nameUser;

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

    private String emailUser;

    public int getIdMember() {
        return id;
    }

    public void setIdMember(int idMember) {
        this.id = idMember;
    }

    public int getGroupId() {
        return idGroup;
    }

    public void setGroupId(int groupId) {
        this.idGroup = groupId;
    }

    public int getUserId() {
        return idUser;
    }

    public void setUserId(int userId) {
        this.idUser = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Member() {
    }

    public Member(int id, String nameUser, String emailUser,String role) {
        this.id=id;
        this.role = role;
        this.nameUser = nameUser;
        this.emailUser = emailUser;
    }

    public Member(int idMember, int groupId, int userId, String role) {
        this.id = idMember;
        this.idGroup = groupId;
        this.idUser = userId;
        this.role = role;
    }

    public Member(int groupId, int userId, String role) {
        this.idGroup = groupId;
        this.idUser = userId;
        this.role = role;
    }

    public Member( String nameUser, String emailUser,String role) {
        this.nameUser = nameUser;
        this.emailUser = emailUser;
        this.role=role;

    }
}
