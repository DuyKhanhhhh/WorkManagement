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
        background-color: #e0e0e0;
    }

    .headImg {
        margin-right: 20px;
    }

    .headRight {
        text-align: right;
        padding-right: 10px;
    }

    #header {
        position: fixed;
    }

    #fullLeft {
        display: flex;
    }

    #boxLeft {
        background-image: url("https://i.pinimg.com/236x/4e/4f/65/4e4f6521b262e4fb9664455012f741fb.jpg");
        max-height: 100%;
        margin-top: 4%;
        height: 100%;
        position: fixed;
        flex: 0 0 auto;
        margin-bottom: 4%;
    }

    #content {
        margin-top: 3%;
        margin-left: 16.5%;
        padding-left: 2%;
    }

    #footer {
        bottom: 0;
        left: 0;
        right: 0;
        position: fixed;
    }

    .textSpan {
        font-size: 40px;
        margin-left: 14px;
        font-weight: bold;
    }

    .icon {
        text-decoration: none;
        color: black;
        margin-right: 18px;
    }

    #contentTitle {
        margin: 36px;
    }

    .table {
        width: 100%;
        height: 3rem;
        margin-top: 2rem;
    }

    .group {
        width: 100%;
        height: 3rem;
        flex: 1 1 auto;
    }

    .group_name {
        width: 80%;
        height: 3rem;
    }

    .group_add {
        margin-left: 2rem;
        margin-top: 1rem;
    }

    .d_flex_left {
        width: 50%;
        height: auto;
        float: left;
    }

    .d_flex_right {
        width: 50%;
        height: auto;
        float: left;
        padding-left: 10%;
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

    .group_main {
        width: 100%;
        height: 40%;
    }

    .name_group {
        width: 90%;
        margin: 8px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .group_header {
        width: 100%;
        height: 3rem;
    }

    .groupContent {
        margin-top: 15px;
        width: 224px;
        height: 160px;
        border-radius: 40px;
        border: 1px solid black;
        background-color: white;
        float: left;
        margin-right: 2%;
    }

</style>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="header">
            <div class="container-fluid">
                <div class="headImg">
                    <img src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png"
                         width="130px" height="60px">
                </div>
                <div style="width: 600px">
                    <form class="d-flex">
                        <input class="form-control" type="search" placeholder="Search">
                        <button style="margin-left: 10px" class="btn btn-outline-secondary" type="submit">Search
                        </button>
                    </form>
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
        <div class="col-2" id="boxLeft">
            <div class="table">
                <div class="d-flex align-items-center">
                    <i class="fa-solid fa-table" style="font-size: 30px"></i>
                    <span class="textSpan">Table</span>
                </div>
            </div>
            <div class="group">
                <div class="d-flex  align-items-center">
                    <div class="group_name">
                        <i class="fa-solid fa-user-group" style="font-size: 30px"></i>
                        <span class="textSpan">Group</span>
                    </div>
                    <div class="group_add">
                        <a href="/homeUser?action=addGroup">
                            <i class="fa-regular fa-square-plus" style="font-size: 30px;color: black"></i>
                        </a>
                    </div>
                </div>
            </div>
            <c:forEach var="group" items="${groups}">
                <div class="name_group">
                    <h3>${group.name}</h3>
                </div>
            </c:forEach>
        </div>
        <div class="col-10" id="content">
            <div class="d-flex  align-items-center" id="contentTitle">
                <i class="fa-solid fa-user-group" style="color: #000000; font-size: 30px"></i>
                <span class="textSpan" style="color:black;">Your group</span>
            </div>
            <c:forEach var="group" items="${groups}">
                <hr style="width: 95.5%" align="center">
                <div class="group_main">
                    <div class="group_header">
                        <div class="d_flex_left">
                            <div class="project">
                                <h3>${group.name}</h3>
                            </div>
                        </div>
                        <div class="d_flex_right">
                            <div class="d-flex align-items-center ml-auto">
                                <a href="homeUser?action=updateGroup&id=${group.id}" class="icon">
                                    <i class="fa-solid fa-table-cells" style="font-size: 30px; "></i>
                                    <span style="font-size: 30px">Information</span>
                                </a>

                                <a href="/homeUser?action=table&idGroup=${group.id}" class="icon">
                                    <i class="fa-solid fa-table" style="font-size: 30px; "></i>
                                    <span style="font-size: 30px">Table</span>
                                </a>

                                <a href="/homeUser?action=member&idGroup=${group.id}" class="icon">
                                    <i class="fa-solid fa-user-group" style="font-size: 30px"></i>
                                    <span style="font-size: 30px">Member</span>
                                </a>

                                <a href="#" class="icon">
                                    <i class="fa-solid fa-gear" style="font-size: 30px"></i>
                                    <span style="font-size: 30px">Setting</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${tables}" var="table">
                        <div class="groupContent">
                            <a href="/addUserToTable?action=showTable&id=${group.id}&idTable=${table.id}&idUser=${user.id}"
                               style="text-decoration: none; color: black">
                                <div class="table_create">
                                    <h4 style="text-align: center;margin-top: 33%">${table.name}</h4>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                    <div class="groupContent">
                        <div class="table_create">
                            <h4 style="text-align: center;margin-top: 33%"><c:out value="${listTable.name}"/></h4>
                        </div>
                        <a href="/homeUser?action=addTableToSQL&id=${group.id}" style="text-decoration: none; color: black">
                            <div class="table_create">
                                <h4 style="text-align: center;margin-top: 33%;color: #646464">Create a table</h4>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
            <div class="d-flex  align-items-center" style="padding-top: 3%;padding-bottom: 10%;">
                <i class="fa-solid fa-user-group" style="color: #000000; font-size: 30px"></i>
                <span class="textSpan" style="color: black">Members of Groups</span>
            </div>
        </div>
    </div>
    <div class="bg-light py-2" id="footer">
        <div class="container text-center">
            <p class="text-muted mb-0 py-1">© 2023 Trello Group 7.</p>
        </div>
    </div>
</div>
</body>
</html>
