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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/addUserToTable.css"/>
</head>

<body>
<div class="container-fluid">
    <
    <nav id="header">
        <a class="header__logo" href="/homeUser">
            <img class="header__logo-img js-subnavToggle"
                 src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png">
        </a>
        <ul class="header__nav-right">
            <li onclick="setDisplaySubnav()" class="headRight">
                <img class="header__avatar" src="${user.getAvatar()}" alt="Avatar">
                <ul id="js-subnav" class="header__subnav js-subnav">
                    <li><a href="#"> Setting</a></li>
                    <li><a href="/homeUser?action=editUser&id=${user.id}">Edit</a></li>
                    <li><a href="/updatePassword?login=updatePassword&id=${user.id}">Change PassWord</a></li>
                    <li><a href="/loginAndSignUp?login=logout">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div class="row">
        <div class="col-10">
            <div id="member">
                <h2 style="text-align: center; margin-top: 40px">Search member</h2>
            </div>

            <div id="search">
                <form class="d-flex" method="post"
                      action="/addUserToTable?action=searchUser&id=${groups.id}&idTable=${tables.id}">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                           name="search">
                    <button class="btn btn-outline-success" type="submit" name="search">Search</button>
                </form>
            </div>
            <div class="table_all">
                <table class="table table-bordered">
                    <c:forEach var="user" items="${list}">
                        <c:if test="${user.name != 'Admin'}">
                            <tr>
                                <td><img width="80px" height="80px" src="${user.avatar}"></td>
                                <td>${user.name}</td>
                                <td>${user.email}</td>
                                <td>
                                    <a href="/addUserToTable?action=addUser&id=${user.id}&idGroup=${groups.id}&idTable=${tables.id}">
                                        <button type="button" class="btn btn-success">Add</button>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    function setDisplaySubnav() {
        let subnav = document.getElementById("js-subnav");
        if (subnav.style.display === "none") {
            subnav.style.display = "block"
        } else {
            subnav.style.display = "none"
        }
    }
</script>
</body>
</html>
