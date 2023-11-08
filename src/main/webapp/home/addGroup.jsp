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
        margin-top: 10%;
        margin-left: 25%;
        border: 3px solid white;
        width: 67%;
        height: 608px;
        padding-right: 4%;
        border-radius: 2%;
        background-color: #d1d1d1;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);

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

    .name_group {
        width: 90%;
        margin: 8px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .col-10 {
        text-align: center;
    }

    .select {
        width: 60%;
        height: 112px;
        margin: 0 auto;
    }

    .group_type {
        width: 50%;
        height: 40px;
        float: left;
    }

    .permission {
        width: 50%;
        height: 40px;
        float: left;
    }
    .title_h2{
        margin-top: 40px;
        margin-left: 6%;
    }

    #inputName {
        padding-left: 20%;
        padding-right: 12%;
    }

    .form-floating {
        width: 85%;
        margin-left: 20%;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="header">
            <div class="container-fluid">
                <div class="headImg">
                    <a href="/homeUser">
                        <img src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png"
                             width="130px" height="60px">
                    </a>
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
                </div>
            </div>
            <c:forEach var="group" items="${groups}">
                <div class="name_group">
                    <h3>${group.name}</h3>
                </div>
            </c:forEach>
        </div>
        <div class="col-10" id="content">
            <form method="post" action="/homeUser?action=addGroup">
                <div>
                    <div class="title_h2">
                        <h1>Create Group</h1>
                    </div>

                    <div class="form-outline mb-4" id="inputName">
                        <label style="float: left;font-size: 20px">Name(<span style="color:red;">*</span>)</label>
                        <input type="text" name="name" class="form-control form-control-lg"
                               placeholder="Name" required/>
                    </div>

                    <div class="select">
                        <div class="group_type">
                            <label style="float: left;font-size: 20px">Group Type(<span
                                    style="color:red;">*</span>)</label>
                            <select class="form-select" name="groupType"
                                    style="width: 380px;height: 45px;" required>
                                <option></option>
                                <option>Manage</option>
                                <option>Accountant</option>
                                <option>Plan</option>
                            </select>
                        </div>
                        <div class="permission">
                            <label style="float: left;margin-left: 72px;font-size: 20px">Permission(<span
                                    style="color:red;">*</span>)</label>
                            <select class="form-select" name="permission"
                                    style="width: 380px;height: 45px;margin-left: 20%;" required>
                                <option></option>
                                <option>Public</option>
                                <option>Private</option>
                            </select>
                        </div>
                    </div>
                    <div style="margin-left: 15rem ">
                        <label style="font-size: 20px; margin-right: 52rem">Information</label>
                        <textarea class="form-control" name="information"
                                   style="height: 180px;width: 85%;">
                        </textarea>
                    </div>
                    <div>
                        <button style="width: 190px;height: 50px;margin-top: 25px;margin-left: 8%" class="btn btn-light"
                                type="submit">Create
                        </button>
                    </div>
                </div>
            </form>
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
