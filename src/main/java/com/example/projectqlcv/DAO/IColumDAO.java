package com.example.projectqlcv.DAO;

import com.example.projectqlcv.model.*;

import java.util.List;

public interface IColumDAO {
    void addColumnWork(int idTable, String  colum);
    List<Column> selectAllColumn();
    void addCard(Card card);
    void addUserToCard(int idUser, int idCard);
    List<Card> selectAllCard();
    boolean deleteColumnWork(int id);
    Column selectColumn(int idColumn);
    Card findCardById(int idCard);

    void addComment(Card card, int idUser);
    List<SelectComment> selectCommentByIdCard(int id);
    boolean deleteComment(int id);
    boolean updateComment(String name, int id);


    boolean updateContentInCard(int idCard , String newContent);
    List<Card> searchCard(int idTable ,String search);
    void addCardLink(Card card);

}
