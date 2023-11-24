package com.example.projectqlcv.controller;

import com.example.projectqlcv.model.User;
import com.example.projectqlcv.DAO.UserDAO;
import com.mysql.cj.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginAndSignUpController", value = "/loginAndSignUp")
public class LoginAndSignUpController extends HttpServlet {
    UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        if (login == null) {
            login = "";
        }
        switch (login) {
            case "signUp":
                signUpUser(request, response);
                break;
            case "login":
                loginUser(request, response);
                break;
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userDAO.login(email, password);
        try {
            if (user != null) {
                if (email.equals("admin@gmail.com")) {
                    response.sendRedirect("homeAdmin");
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("/homeUser");
                }

            } else {
                request.setAttribute("message", "Wrong email or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void signUpUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            User user = userDAO.checkLoginUser(email);
            if (user == null) {
                if (!password.equals(confirmPassword)) {
                    request.setAttribute("message", "Passwords are not duplicates !");
                    request.getRequestDispatcher("signUp.jsp").forward(request, response);
                } else {
                    userDAO.signUp(email, password, name, phoneNumber);
                    request.setAttribute("message", "Sign up success !");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "Duplicate email please re-enter !");
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
            }

        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        if (login == null) {
            login = "";
        }
        switch (login) {
            case "login":
                showFormLogin(request,response);
                break;
            case "signUp":
                showFormSignUp(request,response);
                break;
            case "logout":
                logout(request,response);
                break;
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.invalidate();
        try {
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormSignUp(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("signUp.jsp").forward(request,response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("login.jsp").forward(request,response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }


}
