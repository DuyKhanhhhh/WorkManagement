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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/showTable.css"/>
</head>
<body>
<div class="container-fluid">
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
                                            <small><i style="font-size: small"
                                                      class="fa-solid fa-earth-asia"></i></small>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="float:left; margin-bottom: 100px;">
                                            <small><i style="font-size: small" class="fa-solid fa-lock"></i></small>
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
                    <button onclick="showSearchMember()" style="margin-left: 40% ; height: 40px; width: 130px; border-radius: 5px; background: #268aeb ; color: white ; border: none"
                            type="submit"><i style="margin-left: 4px ; margin-right: 6px ; font-size: initial"
                                             class="fa-solid fa-user-plus"></i>
                        Share
                    </button>
                </div>
                <div id="searchMember">
                    <div id="text">
                        <label>Search user</label>
                    </div>
                    <div id="search">
                        <form class="d-flex" method="post"
                              action="/homeUser?action=search&idGroup=<c:out value="${groups.id}"></c:out>">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                                   name="search">
                            <button class="btn btn-secondary" type="submit" name="search">Search</button>
                        </form>
                    </div>
                </div>
                <c:if test="${list != null}">
                    <div id="tableSearch">
                        <table class="table">
                            <c:forEach var="user" items="${list}">
                                <tr>
                                    <td><img width="80px" height="80px" src="${user.avatar}"></td>
                                    <td>${user.name}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <a href="/addMembers?action=addUser&id=${user.id}&idGroup=<c:out value="${groups.id}"></c:out>">
                                            <button type="button" class="btn btn-danger">Add</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:if>
            </div>
            <h3 style="margin-left: 260px; "><b>Table</b></h3>
            <c:forEach var="table" items="${tables}">
                <a href="/addUserToTable?action=showTable&id=${groups.id}&idTable=${table.id}&idUser=${user.id}">
                    <div id="table_all">
                        <div id="table">
                            <h4 style="font-family: initial; margin-left: 1rem ; margin-top: 1rem; color: white">${table.name}</h4>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <script>
        function showSearchMember() {
            var button = document.getElementById("searchMember");
            if (button.style.display === "none") {
                button.style.display = "block";
            } else {
                button.style.display = "none";
            }
        }
        function setDisplaySubnav() {
            let subnav = document.getElementById("js-subnav");
            if (subnav.style.display === "none") {
                subnav.style.display = "block"
            } else {
                subnav.style.display = "none"
            }
        }
    </script>
</div>
</body>
</html>