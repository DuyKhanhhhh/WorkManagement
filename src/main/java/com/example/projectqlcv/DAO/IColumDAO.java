package com.example.projectqlcv.DAO;

import com.example.projectqlcv.model.Column;
import com.example.projectqlcv.model.User;
import com.example.projectqlcv.model.Card;

import java.util.List;

public interface IColumDAO {
    void addColumnWork(int idTable, String  colum);
    List<Column> selectAllColumn();
    void addCard(Card card);
    List<Card> selectAllCard();
    boolean deleteColumnWork(int id);
    Column selectColumn(int idColumn);
}
