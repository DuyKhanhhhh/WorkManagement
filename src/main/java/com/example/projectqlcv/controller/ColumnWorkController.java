package com.example.projectqlcv.controller;

import com.example.projectqlcv.DAO.ColumnDAO;
import com.example.projectqlcv.model.Column;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ColumnWorkController", value = "/column")
public class ColumnWorkController extends HttpServlet {
    ColumnDAO columnDAO = null;

    @Override
    public void init() throws ServletException {
        columnDAO = new ColumnDAO();
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
        }
    }

    private void createColumn(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("idTable"));
            String name = request.getParameter("name");
            columnDAO.addColumnWork(id,name);
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
            default:
                showAllColumn(request,response);
                break;
        }
    }

    private void deleteColumn(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        columnDAO.deleteColumnWork(id);
        List<Column> listColumn= columnDAO.selectAllColumn();
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
        List<Column> listColumn= columnDAO.selectAllColumn();
        try {
            request.setAttribute("listColumn", listColumn);
            request.getRequestDispatcher("home/tableView.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
