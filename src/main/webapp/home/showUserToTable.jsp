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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/showUserToTable.css"/>

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
<div class="container-fluid">

    <div class="col-12" id="content">
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
                                            <a onclick="showConfirmation(${userToTable.id})" style="font-size: 20px;color: black">
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
                                window.location.href = "/addUserToTable?action=deleteUserToTable&idTable=${tables.id}&id="+idTable;
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
