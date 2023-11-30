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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/showUserToTable.css"/>
<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<body>
<%--    -------HEADER------    --%>
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
<c:if test="${message1 != null}">
    <div class="alert" style=" position: absolute;
    z-index: 10; margin-left: 47%;margin-top: 3rem; border-radius: 5px">
        <div class="notification success" style="
    background: #6ff5a6;
    background: linear-gradient(
            25deg, rgb(111,245,166) 0%, rgb(111,245,166) 15%, rgb(116 231 165) 15%, #1f894c 100%
    );margin-left: -7rem;
    ">
            <div class="notification-description">
                <p style=" margin: 0;
               padding: 1em 1.3em;
               color: #ecf0f1;
               margin-left: 2rem;
               margin-right: 2rem;
               display: flex;
               align-items: center;">
                    <i class="fa fa-check fa-fw fa-2x"></i>
                    <strong style="margin-right: 1em;
    font-size: 20px;">Success!</strong> ${message1}
                </p>
            </div>
        </div>
    </div>
</c:if>
<script>
    setTimeout(function () {
        document.querySelector(".alert").remove();
    }, 3000);
</script>
<div class="name_member">
    <h2 style="     margin-top: 65px;
    margin-left: 50%;"><c:out value="${tables.name}"></c:out></h2>
</div>
<div class="container-xl" style="    margin-top: 50px;">
    <div class="table-title">
        <div class="row" style="justify-content: flex-end;">
            <div class="col-sm-4">
                <div class="search-box">
                    <form method="post" action="/addUserToTable?action=searchUser&id=${groups.id}&idTable=${tables.id}"
                          name="search">
                        <input type="text" class="form-control" placeholder="Search&hellip;" name="search">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <div class="table-wrapper">

            <table class="table table-striped table-hover table-bordered">
                <thead>
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
                </thead>
                <tbody>
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
                                            <a onclick="showConfirmation(${userToTable.id})"
                                               style="font-size: 20px;color: black">
                                                <i class="fa-solid fa-trash"></i>
                                            </a>
                                        </div>
                                    </c:if>
                                </td>
                            </c:when>
                        </c:choose>
                    </tr>
                    <script>
                        function setDisplaySubnav() {
                            let subnav = document.getElementById("js-subnav");
                            if (subnav.style.display === "none") {
                                subnav.style.display = "block"
                            } else {
                                subnav.style.display = "none"
                            }
                        }

                        function showConfirmation(idTable) {
                            var result = confirm("Are you sure you want to remove this user from the table?");
                            if (result) {
                                window.location.href = "/addUserToTable?action=deleteUserToTable&idTable=${tables.id}&id=" + idTable;
                            }
                        }
                    </script>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%--<div class="container-fluid">--%>
<%--    <div class="col-12" id="content">--%>
<%--        <div id="member">--%>

<%--        </div>--%>
<%--        <div class="table_all">--%>
<%--            <div class="nav__search">--%>
<%--                <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--                <form method="post"--%>
<%--                      action="/addUserToTable?action=searchUser&id=${groups.id}&idTable=${tables.id}">--%>
<%--                    <input class="nav__search-input" type="text" placeholder="Search" aria-label="Search"--%>
<%--                           name="search">--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <table class="table table-hover">--%>
<%--                <tr>--%>
<%--                    <th>Name member</th>--%>
<%--                    <th>Email</th>--%>
<%--                    <th>Role</th>--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${member.role.equals('Admin')}">--%>
<%--                            <th>Actions</th>--%>
<%--                        </c:when>--%>
<%--                    </c:choose>--%>
<%--                </tr>--%>

<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
</html>
