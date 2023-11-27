package com.example.projectqlcv.DAO;

import com.example.projectqlcv.model.*;
import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class ColumnDAO implements IColumDAO{
    private static final String ADD_COLUMN_TO_SQL = "INSERT INTO columnWork(idTable, name) VALUES(?, ?) ";
    private static final String SELECT_ALL_COLUMN= "SELECT * FROM columnWork";
    private static final String DELETE_COLUMN_SQL = "DELETE FROM columnWork where id = ?";
    private static final String ADD_CARD_TO_SQL = "INSERT INTO card(idColumn, name) VALUES(?, ?)";
    private static final String ADD_USER_TO_CARD = "INSERT INTO userToCard(idUser, idCard) VALUES(?, ?)";
    private static final String SELECT_ALL_CARD = "SELECT * FROM card";
    private static final String FIND_CARD_BY_ID = "SELECT * FROM card WHERE id = ?";
    private static final String FIND_COMMENT_BY_ID = "SELECT * FROM comment WHERE id = ?";
    private static final String SELECT_COLUMN_ID= "SELECT * FROM columnWork WHERE id=?";

    private static final String ADD_COMMENT_TO_SQL = "INSERT INTO comment (idCard, comment, idUser) VALUES(?, ? ,?)";
    private static final String SELECT_COMMENT_BY_ID_CARD = "select c.id, u.name, u.avatar, c.comment from user u join comment c on u.id = c.idUser where c.idCard = ?";
    private static final String DELETE_COMMENT_BY_ID= "DELETE FROM comment WHERE id = ?";
    private static final String UPDATE_COMMENT_BY_ID= "UPDATE comment set comment = ? WHERE id = ?";

    private static final String UPDATE_CONTENT_IN_CARD = "UPDATE card SET content = ? WHERE id = ?";
    private static final String FIND_CARD_WHERE_NAME = "SELECT c.id,c.idColumn,c.name,c.content,c.label FROM card c JOIN columnWork l ON c.idColumn = l.id JOIN tableWork t ON l.idTable = t.id WHERE c.name LIKE ? AND idTable = ?;";

    private static final String ADD_LINK_TO_SQL= "INSERT INTO card (name, link) VALUES (?,?)";

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
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_CARD_TO_SQL, Statement.RETURN_GENERATED_KEYS );
            preparedStatement.setInt(1, card.getIdColumn());
            preparedStatement.setString(2,card.getName());
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            int idCard = 0;
            if (resultSet.next()) {
                idCard = resultSet.getInt(1);
            }
            card.setId(idCard);
        }  catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addUserToCard(int idUser, int idCard) {
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_USER_TO_CARD);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setInt(2, idCard);
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addComment(Card card , int idUser) {
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_COMMENT_TO_SQL);
            preparedStatement.setInt(1, card.getId());
            preparedStatement.setString(2, card.getComment());
            preparedStatement.setInt(3, idUser);
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<SelectComment> selectCommentByIdCard(int id) {
        List<SelectComment> cardList = new ArrayList<>();
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COMMENT_BY_ID_CARD);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idComment = rs.getInt("id");
                String name = rs.getString("name");
                String avatar = rs.getString("avatar");
                String comment = rs.getString("comment");

                cardList.add(new SelectComment(idComment,name,avatar,comment));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return cardList;
    }

    @Override
    public boolean deleteComment(int id) {
        boolean rowDelete;
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_COMMENT_BY_ID);
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return rowDelete;
    }

    @Override
    public boolean updateComment(String name, int id) {
        boolean rowUpdate;
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_COMMENT_BY_ID);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2,id);
            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
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
                listCard.add(new Card(id,idColumn,name,content));
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

    @Override
    public Card findCardById(int idCard) {
        Card card = null;
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CARD_BY_ID);
            preparedStatement.setInt(1,idCard);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idColumn = resultSet.getInt("idColumn");
                String name = resultSet.getString("name");
                String content = resultSet.getString("content");
                String label = resultSet.getString("label");
                card = new Card(idCard,idColumn,name,content,label);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return card;
    }

    @Override
    public boolean updateContentInCard(int idCard, String newContent) {
        boolean rowUpdate;
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CONTENT_IN_CARD);
            preparedStatement.setString(1,newContent);
            preparedStatement.setInt(2,idCard);
            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdate;
    }

    @Override
    public List<Card> searchCard(int idTable , String name) {
        List<Card> cardList = new ArrayList<>();
        try {
            Connection connection = DataConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CARD_WHERE_NAME);
            preparedStatement.setString(1,"%" + name + "%");
            preparedStatement.setInt(2,idTable);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int idColumn = resultSet.getInt("idColumn");
                String nameCard = resultSet.getString("name");
                String content = resultSet.getString("content");
                String label = resultSet.getString("label");
                cardList.add(new Card(id,idColumn,nameCard,content,label));
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cardList;
    }
    @Override
    public void addCardLink(Card card) {
        try {
            Connection connection = DataConnector.getConnection();

            // Tiếp tục thêm vào bảng card
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_LINK_TO_SQL, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, card.getName());
            preparedStatement.setString(2, card.getLink());
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            int idCard = 0;
            if (resultSet.next()) {
                idCard = resultSet.getInt(1);
            }
            card.setId(idCard);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
