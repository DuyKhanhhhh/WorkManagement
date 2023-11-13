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
        background-color: #f8f9fa;
    }

    #header {
        position: fixed;
        background-color: #2f2f2f;
        height: 50px;
    }

    .headImg {
        margin-right: 20px;
    }

    .headRight {
        text-align: right;
        padding-right: 10px;
    }

    #fullLeft {
        display: flex;
    }

    #boxLeft {
        max-height: 100%;
        margin-top: 2.7%;
        height: 100%;
        position: fixed;
        flex: 0 0 auto;
        margin-bottom: 4%;
        box-shadow: 2px 0 6px rgba(0, 0, 0, 1);
        clip-path: inset(0px -10px -10px -10px);
        background-color: #e9ecef;
    }

    #content {
        margin-top: 1%;
        margin-left: 16%;
        padding-left: 3.5%;
        margin-bottom: 9%;
    }

    .textSpan {
        font-size: 28px;
        margin-left: 14px;
        font-weight: bold;
    }

    i {
        font-size: 25px;
    }

    .table {
        width: 100%;
        height: 3rem;
        margin-top: 1rem;
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
        color: black;
    }

    span {
        font-size: 23px;
    }

    /* Style for dropdown content */
    .dropdown-content {
        display: none; /* Hidden by default */
        position: absolute;
        background-color: #000000;
        min-width: 85px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        font-size: 15px;
        color: white;
    }

    /* Style for each content div */
    .dropdown-content div {
        padding: 10px 5px;
        font-size: 16px;
        text-align: center;
    }

    /* Highlight dropdown options on hover */
    .dropdown-content div:hover {
        background-color: #cecece;
    }

    /* Show the dropdown menu on hover */
    .dropdown:hover .dropdown-content {
        display: block;
    }

    #member {
        width: 100%;
        height: 120px;
        border-bottom: solid black 1px;
    }

    .table_all {
        width: 90%;
        margin: 90px auto;
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
        margin-top: 45px;
        margin-bottom: 35px;
    }

    /* menu */
    .menu-wrapper, .menu a {
        width: 100%;
    }

    .menu::after {
        content: '';
        clear: both;
        display: block;
    }

    .menu a {
        display: block;
        padding: 4px;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        text-decoration: none;
        font-size: 17px;
    }

    .menu li {
        position: relative;
    }

    .menu > li {
        float: left;
    }

    .menu, .menu ul {
        display: inline-block;
        padding: 0;
        margin: 0;
        list-style-type: none;
        background: white;
    }

    .menu ul li + li {
        border-top: 1px solid #fff;
    }

    .menu ul {
        position: absolute;
        box-shadow: 5px 5px 10px 0 rgba(0, 0, 0, 0.5);
    }

    .menu > li ul, .menu ul ul {
        opacity: 0;
        -webkit-transition: all 0.2s ease-in;
        -moz-transition: all 0.2s ease-in;
        transition: all 0.2s ease-in;
        z-index: -1;
        visibility: hidden;
    }

    .menu > li ul {
        top: 130%;
        left: 0;
    }

    .menu ul ul {
        left: 130%;
        top: 0;
    }

    .menu ul a {
        width: 100px;
    }

    .menu > li:hover > ul {
        top: 100%;
        opacity: 1;
        z-index: 1;
        visibility: visible;
    }

    .menu ul > li:hover > ul {
        left: 100%;
        opacity: 1;
        z-index: 1;
        visibility: visible;
    }

    .menu-gold, .menu-gold a {
        color: #000;
    }

    .menu-gold a:hover {
        background-color: white;
        color: #000;
    }

    body {
        background-image: url("http://recruit.framgia.vn/wp-content/themes/framgia-vn/css/images/bg/banner.jpg");
        text-align: center;
    }

    h1 {
        text-align: center;
        margin-top: 20px;
        color: #fff;
        font-size: 40px;
    }

    /* ends */

</style>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-dark" id="header">
            <div class="container-fluid">
                <div class="headImg">
                    <img src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png"
                         width="100" height="50">
                </div>

                <div class="headRight">
                    <span class="group-text">
                    <div class="collapse navbar-collapse">
                      <i class="fa-solid fa-bell" style="color: #ffffff; margin-right: 15px"></i>
                        <span class="dropdown">
                            <button style="font-size: 15px" class="btn btn-light"><c:out value="${user.name}"/></button>
                            <div class="dropdown-content">
                                <div><a href="#">Setting</a></div>
                                <div><a href="/homeUser?action=editUser&id=${user.id}">Edit</a></div>
                                <div><a href="/updatePassword?login=updatePassword&id=${user.id}">Change PassWord</a></div>
                                <div><a href="login.jsp">Logout</a></div>
                            </div>
                        </span>
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
        </div>
        <div class="row">
            <div class="col-2" id="boxLeft">
                <div class="table">
                    <div class="d-flex align-items-center">
                        <i class="fa-solid fa-table" style="color: #000000; font-size: 30px;"></i>
                        <span class="textSpan">Table</span>
                    </div>
                </div>
                <div class="group">
                    <div class="d-flex  align-items-center">
                        <div class="group_name">
                            <i class="fa-solid fa-user-group" style="color: #000000; font-size: 30px"></i>
                            <span class="textSpan">Group</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-10">
                <div id="member">
                    <h2 style="text-align: center; margin-top: 40px">Search member </h2>
                </div>
                <p></p>
                <a href="/homeUser?action=member&idGroup=<c:out value="${groups.id}"></c:out>">
                    <input type="submit" value="Back">
                </a>
                <div id="search">
                    <form class="d-flex" method="post" action="/homeUser?action=search&idGroup=<c:out value="${groups.id}"></c:out>">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                               name="search">
                        <button class="btn btn-outline-success" type="submit" name="search">Search</button>
                    </form>
                </div>
                <div class="table_all">
                    <table class="table table-bordered">
                        <c:forEach var="user" items="${list}">
                            <tr>
                                <td><img src="${user.avatar}"></td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>
                                    <a href="/addMembers?action=addUser&id=${user.id}&idGroup=<c:out value="${groups.id}"></c:out>">
                                        <button type="submit">Add</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
