package com.example.projectqlcv.controller;

import com.example.projectqlcv.DAO.IUserDAO;
import com.example.projectqlcv.DAO.UserDAO;
import com.example.projectqlcv.model.Group;
import com.example.projectqlcv.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "AddMemberToGroupController", value = "/addMembers")
public class AddMemberToGroupController extends HttpServlet {
    private IUserDAO iUserDAO;

    @Override
    public void init(){
        iUserDAO = new UserDAO();
    }
    private void addUserToGroup(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int idGroup = Integer.parseInt(request.getParameter("idGroup"));
        User user = iUserDAO.selectAllUserId(id);
        iUserDAO.addMemberToGroup(idGroup, user);
        request.setAttribute("message", "Add member success");
        try {
            request.getRequestDispatcher("home/addMember.jsp").forward(request, response);
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
            case "addMember":
                addMember(request, response);
                break;
            case "addUser":
                addUserToGroup(request, response);
                break;
        }
    }

    private void addMember(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("groupId"));
            Group group = iUserDAO.findGroupById(id);
            request.setAttribute("groups", group);
            request.getRequestDispatcher("home/addMember.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
