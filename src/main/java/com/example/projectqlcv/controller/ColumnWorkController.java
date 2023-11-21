package com.example.projectqlcv.controller;

import com.example.projectqlcv.DAO.ColumnDAO;

import com.example.projectqlcv.model.*;
import com.example.projectqlcv.DAO.IColumDAO;
import com.example.projectqlcv.DAO.IUserDAO;
import com.example.projectqlcv.DAO.UserDAO;

import com.example.projectqlcv.model.Column;
import com.example.projectqlcv.model.SelectComment;
import com.example.projectqlcv.model.Table;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ColumnWorkController", value = "/column")
public class ColumnWorkController extends HttpServlet {
    IColumDAO iColumDAO = null;
    IUserDAO userDAO = null;

    @Override
    public void init() throws ServletException {
        iColumDAO = new ColumnDAO();
        userDAO = new UserDAO();
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addColumn":
                createColumn(request, response);
                break;
            case "addCart":
                createCart(request, response);
                break;
            case "addComment":
                createComment(request,response);
                break;
            case "updateComment":
                updateComment(request,response);
                break;
            case "editContent":
                editContent(request,response);
                break;
            case "searchCard":
                searchCard(request,response);
                break;
        }

    }


    private void updateComment(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String comment = request.getParameter("comment");
        iColumDAO.updateComment(comment,id);
        try {
            response.sendRedirect("/column");
        } catch (IOException e) {

    private void searchCard(HttpServletRequest request, HttpServletResponse response) {
            int idTable =Integer.parseInt(request.getParameter("idTable"));
            String search = request.getParameter("search");
            List<Card> cardList = iColumDAO.searchCard(idTable,search);
            request.setAttribute("listCard",cardList);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editContent(HttpServletRequest request, HttpServletResponse response) throws RuntimeException {
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        String newContent = request.getParameter("newContent");
        iColumDAO.updateContentInCard(idCard,newContent);
        Card card = iColumDAO.findCardById(idCard);
        request.setAttribute("card",card);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCard(HttpServletRequest request, HttpServletResponse response) {
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        Card card = iColumDAO.findCardById(idCard);
        HttpSession session = request.getSession();
        session.setAttribute("card",card);
        List<UserToCard> userToCard = userDAO.findMemberToCard(idCard);
        session.setAttribute("userToCard",userToCard);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (ServletException | IOException e) {

            throw new RuntimeException(e);
        }
    }

    private void createComment(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String comment = request.getParameter("comment");
        Card card = new Card();
        card.setId(id);
        card.setComment(comment);
        iColumDAO.addComment(card);
        try {
            response.sendRedirect("/column");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void createCart(HttpServletRequest request, HttpServletResponse response) {
        try {
            int idColumn = Integer.parseInt(request.getParameter("idColumn"));
            int idUser = Integer.parseInt(request.getParameter("idUser"));
            String name = request.getParameter("name");
            Card card = new Card();
            card.setIdColumn(idColumn);
            card.setName(name);
            iColumDAO.addCard(card);
            iColumDAO.addUserToCard(idUser,card.getId());
            response.sendRedirect("/column");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createColumn(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("idTable"));
            String name = request.getParameter("name");
            iColumDAO.addColumnWork(id,name);
          response.sendRedirect("/column");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteColumn(request,response);
                break;
            case "showCard":
                showCard(request,response);
                break;

            case "deleteComment":
                deleteComment(request,response);

            case "showMemberToTable":
//                showMemberToTable(request,response);
                break;
            case "addMemberToCard":
                addMemberToCard(request,response);

                break;
            default:
                showAllColumn(request,response);
                break;
        }
    }


    private void deleteComment(HttpServletRequest request, HttpServletResponse response) {
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        iColumDAO.deleteComment(idCard);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCard(HttpServletRequest request, HttpServletResponse response) {
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        Card card = iColumDAO.findCardById(idCard);
        List<SelectComment> listComment = iColumDAO.selectCommentByIdCard(idCard);
        HttpSession session = request.getSession();
        session.setAttribute("card",card);
        session.setAttribute("listComment", listComment);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (ServletException | IOException e) {

    private void addMemberToCard(HttpServletRequest request, HttpServletResponse response) {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        int idCard = Integer.parseInt(request.getParameter("idCard"));
        int idTable = Integer.parseInt(request.getParameter("idTable"));
        HttpSession session = request.getSession();
        userDAO.addUserInCard(idUser,idCard);
        List<AddUserToTable> memberToTable = userDAO.findUserToTable(idTable);
        session.setAttribute("listMember",memberToTable);
        List<UserToCard> userToCard = userDAO.findMemberToCard(idCard);
        session.setAttribute("userToCard",userToCard);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {

            throw new RuntimeException(e);
        }
    }


    private void deleteColumn(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iColumDAO.deleteColumnWork(id);
        List<Column> listColumn= iColumDAO.selectAllColumn();
        request.setAttribute("listColumn", listColumn);
        try {
        request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAllColumn(HttpServletRequest request, HttpServletResponse response) {
        List<Column> listColumn= iColumDAO.selectAllColumn();
        List<Card> listCard = iColumDAO.selectAllCard();
        List<Table> listTable = userDAO.selectAllTable();
        HttpSession session = request.getSession();

        try {
            session.setAttribute("listCard",listCard);
            session.setAttribute("listColumn", listColumn);
            session.setAttribute("listTable",listTable);
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
