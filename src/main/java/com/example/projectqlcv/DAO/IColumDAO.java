package com.example.projectqlcv.DAO;

import com.example.projectqlcv.model.Column;
import com.example.projectqlcv.model.SelectComment;
import com.example.projectqlcv.model.User;
import com.example.projectqlcv.model.Card;

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

    void addComment(Card card);
    List<SelectComment> selectCommentByIdCard(int id);
    boolean deleteComment(int id);
    boolean updateComment(String name, int id);


    boolean updateContentInCard(int idCard , String newContent);
    List<Card> searchCard(int idTable ,String search);

}
