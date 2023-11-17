package com.example.projectqlcv.DAO;

import com.example.projectqlcv.model.Column;
import com.example.projectqlcv.model.Table;
import com.example.projectqlcv.model.Card;

import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class ColumnDAO implements IColumDAO{
    private static final String ADD_COLUMN_TO_SQL = "INSERT INTO columnWork(idTable, name) VALUES(?, ?) ";
    private static final String SELECT_ALL_COLUMN= "SELECT * FROM columnWork";
    private static final String DELETE_COLUMN_SQL = "DELETE FROM columnWork where id = ?";
    private static final String ADD_CARD_TO_SQL = "INSERT INTO card(idColumn, name) VALUES(?, ?)";
    private static final String SELECT_ALL_CARD = "SELECT * FROM card";
    private static final String SELECT_COLUMN_ID= "SELECT * FROM columnWork WHERE id=?";


    @Override
    public void addColumnWork(int idTable, String  colum) {
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_COLUMN_TO_SQL);
            preparedStatement.setInt(1, idTable);
            preparedStatement.setString(2, colum);
            preparedStatement.executeUpdate();
        }  catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public void addCard(Card card) {
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_CARD_TO_SQL, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, card.getIdColumn());
            preparedStatement.setString(2,card.getName());
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            int idCard = 0;
            if (resultSet.next()) {
                idCard = resultSet.getInt(1);
            }
            System.out.println(idCard);
            card.setId(idCard);
        }  catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Card> selectAllCard() {
        List<Card> listCard = new ArrayList<>();
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARD);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idColumn = rs.getInt("idColumn");
                String name = rs.getString("name");
                String content = rs.getString("content");
                String comment = rs.getString("comment");
                listCard.add(new Card(id,idColumn,name,content,comment));
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listCard;
    }

    @Override
    public List<Column> selectAllColumn() {
        List<Column> listColumn = new ArrayList<>();
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COLUMN);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idTable = rs.getInt("idTable");
                String name = rs.getString("name");
                listColumn.add(new Column(id, idTable, name));
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return listColumn;
    }

    @Override
    public boolean deleteColumnWork(int id) {
        boolean rowDelete;
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_COLUMN_SQL);
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }

    @Override
    public Column selectColumn(int idColumn) {
        Column column = null;
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COLUMN_ID);
            preparedStatement.setInt(1,idColumn);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int idTable = resultSet.getInt("idTable");
                String name = resultSet.getString("name");
                column = new Column(id,idTable,name);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return column;
    }
}
