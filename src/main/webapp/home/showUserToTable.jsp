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

    #content {
        margin-top: 3%;
        margin-left: 8%;
        margin-bottom: 10%;
    }

    .table {
        width: 100%;
        height: 3rem;
        margin-top: 1rem;
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
                    <a href="/homeUser">
                        <img src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png"
                             width="100" height="50">
                    </a>
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
    <div class="col-10" id="content">
        <div id="member">
            <div class="name_member">
                <h2 style=" margin-top: 50px ; margin-left: 60%"><c:out value="${tables.name}"></c:out></h2>
            </div>
        </div>

        <div class="table_all">
            <table class="table table-hover">
                <tr>
                    <th>Name member</th>
                    <th>Email</th>
                    <th>Role</th>
                    <c:choose>
                        <c:when test="${member.role.equals('Admin')}">
                            <th>Actions</th>
                        </c:when>
                    </c:choose>
                </tr>
                <c:forEach var="userToTable" items="${userToTable}">
                    <tr>
                        <td>${userToTable.nameUser}</td>
                        <td>${userToTable.emailUser}</td>
                        <td>
                            <div class="menu-wrapper menu-gold">
                                <ul class="menu">
                                    <li>
                                        <a href="">${userToTable.role}</a>
                                        <c:choose>
                                            <c:when test="${member.role.equals('Admin')}">
                                                <ul>
                                                    <c:if test="${userToTable.role.equals('User')}">
                                                        <form action="/addUserToTable?action=updatePermissionUser&id=${userToTable.id}&idTable=${tables.id}"
                                                              method="post">
                                                            <li>
                                                                <input type="submit" value="Admin"
                                                                       style="border: none; font-size: 17px"/>
                                                            </li>
                                                        </form>
                                                    </c:if>
                                                </ul>
                                            </c:when>
                                        </c:choose>
                                    </li>
                                </ul>
                            </div>
                        </td>
                        <c:choose>
                            <c:when test="${member.role.equals('Admin')}">
                                <td>
                                    <c:if test="${userToTable.role.equals('User')}">
                                        <div class="">
                                            <a onclick="showConfirmation()" style="font-size: 20px;color: black">
                                                <i class="fa-solid fa-trash"></i>
                                            </a>
                                        </div>
                                    </c:if>
                                </td>
                            </c:when>
                        </c:choose>
                    </tr>
                    <script>

                        function showConfirmation() {
                            var result = confirm("Are you sure you want to remove this user from the table?");
                            if (result) {
                                window.location.href = "/addUserToTable?action=deleteUserToTable&id=${userToTable.id}&idTable=${tables.id}";
                            }
                        }
                    </script>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
