<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nguyenhuugiang19072004
  Date: 10/21/23
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/892d14366e.js" crossorigin="anonymous"></script>
</head>
<style>
    body {
        background-color: white;
    }

    .headImg {
        margin-right: 20px;
    }

    .headRight {
        text-align: right;
        padding-right: 10px;
    }

    #header {
        height: 70px;
        position: fixed;
        background-color: #2f2f2f;
        border-bottom: solid #d4d0d0 1px;
    }

    #fullLeft {
        display: flex;
    }

    #content {
        margin-top: 5%;
    }

    #footer {
        bottom: 0;
        left: 0;
        right: 0;
        position: fixed;
    }

    a {
        text-decoration: none;
    }

    h3 {
        font-family: initial;
    }

    span {
        font-family: initial;;
    }

    .dropdown {
        max-width: 25em;
        position: relative;
        width: 100%;
    }

    .dropdown-btn {
        background: #b2b2b2;
        font-size: 18px;
        width: 100%;
        border: none;
        color: #fff;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0.7em 0.5em;
        border-radius: 0.5em;
        cursor: pointer;
    }

    .arrow {
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-top: 6px solid #fff;
        transition: transform ease-in-out 0.3s;
    }

    .dropdown-content {
        list-style: none;
        position: absolute;
        top: 3.2em;
        width: 100%;
        visibility: hidden;
        overflow: hidden;
    }

    .dropdown-content li {
        background: #2f3238;
        border-radius: 0.5em;
        position: relative;
        left: 100%;
        transition: 0.5s;
        transition-delay: calc(60ms * var(--delay));
    }

    .dropdown-btn:focus + .dropdown-content li {
        left: 0;
    }

    .dropdown-btn:focus + .dropdown-content {
        visibility: visible;
    }

    .dropdown-btn:focus > .arrow {
        transform: rotate(180deg);
    }

    .dropdown-content li:hover {
        background: #1d1f24;
    }

    .dropdown-content li a {
        display: block;
        padding: 0.7em 0.5em;
        color: #fff;
        margin: 0.1em 0;
        text-decoration: none;
    }

    #member {
        width: 90%;
        height: 110px;
        border-bottom: solid #d4d0d0 1px;
        margin: 0 auto;
    }

    #table_all {
        width: 80%;
        margin: 80px 230px;
    }

    .name_member {
        float: left;
        width: 60%;
        height: 80px;
        margin-bottom: 35px;
    }

    .add_member {
        width: 40%;
        height: 80px;
        float: left;
        margin-top: 17px;
        margin-bottom: 35px;
    }

    #table {

        width: 22%;
        height: 110px;
        border-radius: 3px;
        background-image: linear-gradient(to right, #DECBA4, #3E5151);
        margin-left: 25px;
        float: left;
        margin-bottom: 20px;
    }
    #permission{
        margin-left: 120px;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-dark " id="header">
            <div class="container-fluid">
                <div class="headImg">
                    <img src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png"
                         width="130px" height="60px">
                </div>
                <div class="headRight">
                    <span class="group-text">
                    <div class="collapse navbar-collapse">
                      <i class="fa-solid fa-bell" style="color: #ffffff;font-size: 34px; margin-right: 10px"></i>
                        <div class="dropdown">
                            <button class="dropdown-btn" aria-haspopup="menu">
                                <span><c:out value="${user.name}"/></span>
                                <span class="arrow"></span>
                            </button>
                            <ul class="dropdown-content" role="menu">
                                <li style="--delay: 3;"><a href="#">Setting</a></li>
                                <li style="--delay: 1;"><a href="/homeUser?action=editUser&id=${user.id}">Edit</a></li>
                                <li style="--delay: 2;"><a href="/updatePassword?login=updatePassword&id=${user.id}">Change PassWord</a></li>
                                <li style="--delay: 4;"><a href="login.jsp">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                    </span>
                </div>
            </div>
        </nav>
    </div>
    <div class="row" id="fullLeft">
        <div id="content">
            <div id="member">
                <div class="name_member">
                    <div style="width: 30%; height: 100%; margin-left: 20%;">
                        <h3 style=" margin-top: 10px ; margin-left: 40%"><b><c:out value="${groups.name}"></c:out></b>
                        </h3>
                        <div id="permission">
                            <div>
                                <c:choose>
                                    <c:when test="${groups.permission.equals('Public')}">
                                        <div style="float:left; margin-bottom: 100px;">
                                            <small><i class="fa-solid fa-earth-asia"></i></small>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="float:left; margin-bottom: 100px;">
                                            <small><i class="fa-solid fa-lock"></i></small>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div>
                                <small style="margin-left: 7px; margin-bottom: 100px">
                                    <c:out value="${groups.permission}"></c:out>
                                </small>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="add_member">
                    <a href="/addMembers?action=addMember&groupId=<c:out value="${groups.id}"></c:out>">
                        <button style="margin-left: 12% ; height: 45px; border-radius: 5px; background: #268aeb ; color: white"
                                type="submit"><i style="margin-left: 7px ; margin-right: 6px" class="fa-solid fa-user-plus"></i>Invite members to the workspace
                        </button>
                    </a>
                </div>
            </div>

            <br>
            <br>
            <br>
            <h3 style="margin-left: 260px; "><b>Table</b></h3>
            <c:forEach var="table" items="${tables}">
                <a href="/addUserToTable?action=showTable&id=${groups.id}&idTable=${table.id}">
                    <div id="table_all">
                        <div id="table">
                            <h4 style="font-family: initial; margin-left: 1rem ; margin-top: 1rem; color: white">${table.name}</h4>
                        </div>
                    </div>
                </a>
            </c:forEach>

        </div>
    </div>
    <div class="bg-light py-2" id="footer">
        <div class="container text-center">
            <p class="text-muted mb-0 py-1">© 2023 Trello Group 7</p>
        </div>
    </div>
</div>
</body>
</html>