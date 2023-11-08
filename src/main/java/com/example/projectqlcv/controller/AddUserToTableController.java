package com.example.projectqlcv.controller;

import com.example.projectqlcv.DAO.UserDAO;
import com.example.projectqlcv.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddUserToTableController", value = "/addUserToTable")
public class AddUserToTableController extends HttpServlet {
    UserDAO userDAO = null;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "searchUser":
                searchUser(request, response);
                break;
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int idTable = Integer.parseInt(request.getParameter("idTable"));
        Table table = userDAO.findTableById(idTable);
        Group group = userDAO.findGroupById(id);
        request.setAttribute("groups", group);
        request.setAttribute("tables", table);
        try {
            request.getRequestDispatcher("home/addUserToTable.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showTable(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int idGroup = Integer.parseInt(request.getParameter("id"));
        int idTable = Integer.parseInt(request.getParameter("idTable"));
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        Table table = new Table();
        table.setId(idTable);
        table.setIdUser(idUser);
        table.setIdGroup(idGroup);
        session.setAttribute("tables", table);
        Group group = userDAO.findGroupById(idGroup);
        session.setAttribute("groups", group);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        int idGroup =Integer.parseInt(request.getParameter("idGroup"));
        String name = request.getParameter("search");
        List<User> userList = userDAO.searchNameUser(idGroup,name);
        request.setAttribute("list", userList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("home/addMember.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "addUserToTable":
                addUser(request, response);
                break;
            case "addUser":
                addUserToTable(request, response);
                break;
            case "showTable":
                showTable(request, response);
                break;
            case "show":
                showAllUserToTable(request,response);

        }
    }

    private void showAllUserToTable(HttpServletRequest request, HttpServletResponse response) {
        int idTable = Integer.parseInt(request.getParameter("idTable"));
        Table table = userDAO.findTableById(idTable);
        HttpSession session = request.getSession();
        session.setAttribute("tables", table);
        List<AddUserToTable> addUserToTables = userDAO.selectUserToTable(idTable);
        session.setAttribute("member", addUserToTables);
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void addUserToTable(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int idTable = Integer.parseInt(request.getParameter("idTable"));
        User user = userDAO.selectAllUserId(id);
        userDAO.addUserToTable(idTable, user);
        request.setAttribute("message", "Add member success !");
        try {
            request.getRequestDispatcher("home/tableView.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

