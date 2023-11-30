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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/showMember.css"/>
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
    <div class="col-10" id="content">
        <div id="member">
            <div class="name_member">
                <h2 style=" margin-top: 50px ; margin-left: 60%"><c:out value="${groups.name}"></c:out></h2>
            </div>
            <div class="add_member">
                <button onclick="showSearchMember()" style="margin-left: 40% ; height: 40px; width: 130px; border-radius: 5px; background: #268aeb ; color: white ; border: none"
                        type="submit"><i style="margin-left: 4px ; margin-right: 6px ; font-size: initial"
                                         class="fa-solid fa-user-plus"></i>
                    Share
                </button>
            </div>
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
        <div id="table_all">
            <table class="table">
                <tr>
                    <th>Name member</th>
                    <th>Email</th>
                    <th>Role</th>
                    <c:choose>
                        <c:when test="${roleMember.role.equals('Admin')}">
                            <th>Actions</th>
                        </c:when>
                    </c:choose>
                </tr>
                <c:forEach var="member" items="${member}">

                    <tr>
                        <td>${member.nameUser}</td>
                        <td>${member.emailUser}</td>
                        <td>
                            <div class="menu-wrapper menu-gold">

                                <ul class="menu">
                                    <li>
                                        <a href="">${member.role}</a>
                                        <c:choose>
                                            <c:when test="${roleMember.role.equals('Admin')}">
                                                <ul>
                                                    <c:choose>
                                                        <c:when test="${member.role.equals('Member')}">
                                                            <form action="/addMembers?action=updatePermissionMember&idMember=${member.id}&idGroup=${groups.id}&idUser=${user.id}"
                                                                  method="post">
                                                                <li>
                                                                    <input type="submit" value="Admin"
                                                                           style="border: none; font-size: 17px"/>
                                                                </li>
                                                            </form>
                                                        </c:when>
                                                    </c:choose>
                                                </ul>
                                            </c:when>
                                        </c:choose>
                                    </li>
                                </ul>
                            </div>
                        </td>

                        <c:choose>
                            <c:when test="${roleMember.role.equals('Admin')}">
                                <td>
                                    <c:if test="${member.role.equals('Member')}">
                                        <div class="">
                                            <a onclick="showConfirmation(${member.idMember})" style="font-size: 20px;color: black">
                                                <i class="fa-solid fa-trash"></i>
                                            </a>
                                        </div>
                                    </c:if>
                                </td>
                            </c:when>
                        </c:choose>

                    </tr>
                    <script>
                        function showConfirmation(idMember) {
                            var result = confirm("Are you sure you want to remove this member from the group?");
                            if (result) {
                                window.location.href = "/addMembers?action=deleteMember&groupId=${groups.id}&idUser=${user.id}&idMember="+idMember;
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
                </c:forEach>
            </table>
        </div>
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

</script>
</body>
</html>