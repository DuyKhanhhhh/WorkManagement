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

    .title {
        margin-top: 2.6%;
        background-color: #adb5bd;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .titleRight {
        float: right;
    }

    .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 50px;
        right: 0;
        background-color: #111;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
    }

    .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #f1f1f1;
        display: block;
        transition: 0.3s;
    }

    .sidenav a:hover {
        color: #f1f1f1;
    }

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
    }

    #main {
        transition: margin-left .5s;
        padding: 16px;
    }

    @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
    }

    #rightTitle {
        display: flex;
        flex-direction: row-reverse;
    }

    .circleMember {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
        margin-right: 8px;
    }

    .circleMember img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .member {
        display: flex;
        align-items: center;
    }

    .title {
        cursor: pointer;
    }

    .formAdd {
        display: none;
        width: 260px;
        position: fixed;
        background-color: #e9ecef;
        overflow-x: hidden;
        padding-top: 30px;
        border-radius: 7px;
        margin-left: -12px;
        margin-top: -30px;
    }

    .formAdd a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
    }

    .formAdd .closebtn {
        position: absolute;
        top: -25px;
        right: -2px;
        font-size: 40px;
    }

    .formDelete {
        display: none;
        width: 260px;
        position: fixed;
        background-color: #e9ecef;
        overflow-x: hidden;
        padding-top: 24px;
        border-radius: 7px;
        top: 20%;
        left: 40%;
    }

    .formDelete a {
        padding: 8px 1px 10px 0px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
    }

    .formDelete .closebtn {
        position: absolute;
        top: -16px;
        right: 8px;
        font-size: 40px;
    }

    .boxAdd {
        width: 260px;
        height: 45px;
        border-radius: 7px;
        background-color: #ced4da;
        margin-top: 10px;
        margin-left: 15px;
    }

    .columnContent {
        width: 260px;
        height: 820px;
        border-radius: 7px;
        border: 1px solid black;
        background-color: #e9ecef;
        float: left;
        margin-top: 10px;
        margin-left: 15px;
        overflow: auto;
    }

    .contentTable {
        border: 1px solid;
        background-color: #ced4da;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-radius: 5px;
        margin-top: 8px;
        font-size: 20px;
        height: auto;
        padding-left: 5px;
        word-wrap: break-word;
    }

    .nav {
        color: #000000;
        margin-top: 1px;
        margin-left: 10px;
        cursor: pointer;
    }

    #nameTable {
        margin-top: 20px;
        border: none;
        font-size: 20px;
    }

    h4 {
        padding-top: 15px;
    }

    .boxAddCart {
        width: 234px;
        height: 30px;
        border-radius: 4px;
        background-color: #ced4da;
        display: flex;
        justify-content: center;
    }

    .boxAddCart span {
        font-size: 30px;
        margin-top: -9px;
    }

    .addCard {
        display: none;
        width: 260px;
        position: fixed;
        border-radius: 7px;
        background-color: #e9ecef;
        overflow-x: hidden;
        padding-top: 30px;
    }

    .addCard a {
        padding: 8px 1px 10px 0px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
    }

    .addCard .closebtn {
        position: absolute;
        top: -25px;
        right: 4px;
        font-size: 40px;
    }

    .showCard {
        width: 234px;
        height: auto;
        margin-bottom: 10px;
        border-radius: 4px;
        background-color: #ced4da;
        cursor: pointer;
    }

    .showCard span {
        font-size: 16px;
    }

    .formContent {
        display: block;
        position: fixed;
        background-color: #8f979f;
        border-radius: 8px;
        width: 36%;
        height: 830px;
        margin-left: 33%;
        margin-top: 35px;
        max-height: 830px;
        overflow-y: auto;
    }

    .formContent .closebtn {
        position: absolute;
        top: -14px;
        right: 16px;
        font-size: 50px;
    }

    .contentHead {
        padding: 45px 30px 0px 4px;
        display: flex;
        align-items: center;
    }

    .contentTitle {
        padding-left: 15px;
    }

    .contentTitle h2 {
        margin-right: 4px;
    }

    .cardLeft {
        width: 75%;
        float: left;
    }

    .content {
        display: flex;
        margin-top: 15px;
    }

    .content i {
        color: #000000;
        font-size: 26px;
        padding-left: 4px;
    }

    .content button {
        width: 20%;
        margin-left: 14px;
        margin-top: 110px;
    }

    .cardRight {
        width: 25%;
        float: right;
        padding-top: 45px;
    }

    .form-floating {
        height: 100px;
        width: 430px;
        margin-left: 14px;
    }

    .boxIconCard {
        border: 1px solid black;
        width: 160px;
        height: 50px;
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        background-color: #b8bdb5;
        border-radius: 5px;
    }

    .boxIconCard i {
        font-size: 20px;
        position: absolute;
        margin-right: 5px;
        margin-left: 20px;
    }

    .boxIconCard span {
        margin-left: 50px;
    }

    .comment {
        margin-top: 20px;
    }

    .comment i {
        color: #000000;
        font-size: 26px;
        padding-left: 4px;
    }

    .comment button {
        width: 20%;
        margin-top: 10px;
        margin-left: 30px;
    }

    .comment-item {
        display: flex;
        align-items: center;
        background-color: #dfdfdf;
        border-radius: 4px;
        margin-bottom: 4px;
        margin-top: 2px;
        width: 666px;
    }

    .avatar {
        width: 36px;
        height: 35px;
        margin-right: 10px;
        border-radius: 50%;
        margin-left: 3px;
    }

    .comment-content {
        display: flex;
        flex-direction: column;
    }

    .comment-name {
        font-weight: bold;
        font-size: 20px;
    }

    .comment-text {
        margin-top: 5px;
        font-size: 18px;
    }

    #inputComment {
        width: 120%;
        margin-left: 30px;
        margin-top: 8px;
    }

    .formEdit {
        display: none;
        width: 260px;
        position: fixed;
        background-color: #e9ecef;
        overflow-x: hidden;
        padding-top: 24px;
        border-radius: 7px;
    }

    .formEdit .closebtn {
        position: absolute;
        top: -16px;
        right: 8px;
        font-size: 40px;
    }

    .iconComment {
        display: flex;
    }

    .textIcon {
        font-size: 16px;
        text-decoration: none;
        color: black;
        padding-left:33px;
    }

    #my-div {
        position: absolute;
        top: 0;
        left: 0;
        width: 200px;
        height: 200px;
        background-color: #fff;
        margin-left: 20rem;
        margin-top: 6rem;
    }

    #member {
        position: absolute;
        top: 0;
        left: 0;
        width: 200px;
        height: 200px;
        background-color: #fff;
    }

    /*#clickContent{*/
    /*    display: none;*/
    /*}*/
    .filter {
    }

    .searchCard {
        width: 400px;
        height: 150px;
        background-color: #aeaeae;
        margin-left: 79%;
        position: fixed;
        display: none;
        border-radius: 10px;
        margin-top: 3px;
    }

    #buttonSearchCard {
        background: none;
        border: none;
        outline: none;
    }

    #search {
        margin-top: 50px;
    }
    .buttonPermission{
        display: inline-block;
        margin-right: 72rem;
        border: none;
        background: none;
    }

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
    <div class="row">
        <div class="title">
            <div>
                <c:forEach var="listTable" items="${listTable}">
                    <c:if test="${(tables.id).equals(listTable.id)}">
                        <c:if test="${(roleUser.role).equals('Admin')}">
                            <div id="nameTable">
                                <form id="edit" action="/addUserToTable" method="post">
                                    <input name="nameUpdate" type="text" class="title" id="title"
                                           value="${listTable.name}"
                                           style="border: none">
                                    <input name="action" value="editNameTable" type="hidden">
                                    <input name="idTable" value="${tables.id}" type="hidden">
                                    <input type="submit" class="button" id="buttonEdit"
                                           style="display: none ; border: none "
                                           hidden="hidden">
                                </form>
                            </div>
                        </c:if>
                        <c:if test="${(roleUser.role).equals('User') || (roleUser.role).equals(null)}">
                            <label style="">${listTable.name}</label>
                        </c:if>
                    </c:if>
                </c:forEach>
            </div>
            <span id="main">
                    <div class="nav">
                     <span onclick="openPermission()">
                         <label style="display: inline-block;margin-right: 80rem;">${tables.permission}</label>
                     </span>
                    </div>
                </span>

            <div class="filter" onclick="showSearchCard()">
                <i class="fa-solid fa-magnifying-glass"></i>
                <button id="buttonSearchCard" style="margin-left: 2px">Filter</button>
            </div>

            <div class="titleRight">
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <h2 style="text-align: center;color: white">Menu</h2>
                    <hr style="color:white;">
                    <a href="/addUserToTable?action=addUserToTable&id=${groups.id}&idTable=${tables.id}">Add member</a>
                    <a href="/addUserToTable?action=showUserToTable&idTable=${tables.id}&idUser=${user.id}">Member</a>
                    <a href="/addUserToTable?action=deleteTable&idTable=${tables.id}&groupId=${groups.id}">Delete table</a>

                    <c:if test="${roleUser.role.equals('Admin') && rolerUser.idTable eq tables.id}">

                        <a onclick="showConfirmation()" style="color: white">Delete table</a>
                    </c:if>
                    <c:if test="${roleUser.idUser != memberToGroup.idUser}">
                        <a href="/addUserToTable?action=joinTable&id=${user.id}&idGroup=${groups.id}&idTable=${tables.id}">
                            Join table</a>
                    </c:if>
                </div>
                <div id="my-div" style="display: none;">
                    <a href="javascript:void(0)" class="closebtn" onclick="closePermission()">×</a>
                    <form action="/homeUser?action=updatePermissionTablePublic&idTable=${tables.id}" method="post">
                        <input type="submit" value="Public"/>
                    </form>
                    <form action="/homeUser?action=updatePermissionTableGroup&idTable=${tables.id}" method="post">
                        <input type="submit" value="Group"/>
                    </form>
                    <form action="/homeUser?action=updatePermissionTablePrivate&idTable=${tables.id}" method="post">
                        <input type="submit" value="Private"/>
                    </form>
                </div>

                <span id="rightTitle">
                    <div class="nav">
                     <span onclick="openNav()">
                         <i class="fa-solid fa-bars" style="font-size: 35px"></i>
                     </span>
                    </div>
                    <div class="member">
                        <c:forEach var="userToTable" items="${userToTable}">
                            <div class="circleMember">
                                <img src="${userToTable.avatar}" alt="Avatar">
                            </div>
                        </c:forEach>
                    </div>
                </span>
            </div>
        </div>
    </div>
    <div class="row">

        <c:forEach items="${listColumn}" var="listColumn">
            <div class="searchCard" id="searchCard">
                <div id="search">
                    <form class="d-flex" method="post"
                          action="/column?action=searchCard&idTable=${tables.id}">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                               name="search">
                        <button class="btn btn-secondary" type="submit" name="search">Search</button>
                    </form>
                </div>
            </div>
            <c:if test="${tables.id eq listColumn.idTable}">
                <div id="formDelete" class="formDelete">
                    <span class="closebtn" onclick="closeFormDelete()">&times;</span>
                    <a href="/column?action=delete&id=${listColumn.id}">
                        <input type="submit" class="btn btn-primary" value="Delete">
                    </a>
                </div>

                <div class="columnContent">
                    <form id="editColumn" action="/addUserToTable" method="post">
                        <div class="contentTable">
                            <input name="nameColumnUpdate" type="text" class="titleColumn" id="titleColumn"
                                   value="${listColumn.name}"
                                   style="border: none; max-width: 215px;cursor: pointer;background-color: #ced4da">
                            <div onclick="openFormDelete()">
                                <i class="fa-solid fa-ellipsis-vertical" style="color: #000000; margin-right: 5px"></i>
                            </div>
                        </div>
                        <input name="action" value="editNameColumn" type="hidden">
                        <input name="idColumn" value="${listColumn.id}" type="hidden">
                        <input type="submit" class="button" id="buttonColumn" style="display: none ; border: none "
                               hidden="hidden">

                    </form>
                    <c:forEach items="${listCard}" var="cardItem">
                        <c:if test="${listColumn.id eq cardItem.getIdColumn()}">
                            <a href="/column?action=showCard&idCard=${cardItem.id}">
                                <div class="showCard">
                                    <span>${cardItem.getName()}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>
                    <div class="boxAddCart" onclick="openFormCard(${listColumn.id})">
                        <span>+</span>
                        <div id="formAddCard${listColumn.id}" class="addCard">
                            <form method="post"
                                  action="/column?action=addCart&idColumn=${listColumn.id}&idUser=${user.id}">
                                <a href="javascript:void(0)" class="closebtn"
                                   onclick="closeFormCard(${listColumn.id})">&times;</a>
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="name"
                                           placeholder="Enter a list title">
                                    <button type="submit" class="btn btn-primary" style="margin-top: 5px">Add Card
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
        <div class="boxAdd" onclick="openForm()">
            <span style="font-size: 20px">+ Add list</span>
            <div id="formAdd" class="formAdd">
                <form method="post" action="/column?action=addColumn&idTable=${tables.id}">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeForm()">&times;</a>
                    <div class="mb-3">
                        <input type="text" class="form-control" name="name" placeholder="Enter a list title">
                        <button type="submit" class="btn btn-primary" style="margin-top: 5px">Add Column</button>
                    </div>
                </form>
            </div>
      </div>
        <c:if test="${card != null}">
            <div id="formShowCard" class="formContent">
                <div class=cardLeft>
                    <span class="closebtn" onclick="closeFormContent()">&times;</span>
                    <div class="contentHead">
                        <i class="fa-solid fa-window-maximize" style="color: #000000; font-size: 26px"></i>
                        <br>
                        <div class="contentTitle">
                            <h2>${card.name}</h2>
                        </div>
                        <c:forEach items="${userToCard}" var="userToCard">
                            <div class="circleMember">
                                <img src="${userToCard.avatar}" alt="Avatar">
                            </div>
                        </c:forEach>
                    </div>
                    <div class="content">
                        <i class="fa-solid fa-bars" style="color: #000000;"></i>
                            <%--                        <c:if test="${(roleUser.role).equals('Admin') || (roleUser.role).equals('User')}">--%>
                        <form id="myForm" method="post" action="/column?action=editContent&idCard=${card.getId()}">
                            <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1"
                                      name="newContent"
                                      style="height: 200px">${card.getContent()}</textarea>
                                <label for="floatingTextarea1">Content</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                            <%--                        </c:if>--%>
                    </div>
                    <div class="comment">
                        <span><i class="fa-solid fa-list-ul" style="color: #000000;"></i>  Comment</span>
                        <c:forEach var="comment" items="${listComment}">
                            <div class="comment-item">
                                <img src="${comment.avatar}" alt="Avatar" class="avatar">
                                <div class="comment-content">1
                                    <span class="comment-name">${comment.name}</span>
                                    <span class="comment-text">${comment.comment}</span>
                                </div>
                            </div>
                            <div class="iconComment">

                                <span onclick="openFormEdit()" class="textIcon"><u>Edit</u></span>
                                <a href="/column?action=deleteComment&idCard=${comment.id}">
                                    <span class="textIcon"><u>Delete</u></span>
                                </a>
                            </div>
                            <div id="formEdit" class="formEdit">
                                <span class="closebtn" onclick="closeFormEdit()">&times;</span>
                                <form method="post" action="/column?action=updateComment&id=${comment.id}">
                                    <div class="mb-3">
                                        <input type="text" name="comment" value="${comment.comment}"
                                               class="form-control">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

<%--                                Edit Comment--%>
                                <a  onclick="openFormEdit()" class="textIcon"><u>Edit</u></a>
                                <div id="formEdit" class="formEdit">
                                    <span class="closebtn" onclick="closeFormEdit()">&times;</span>
                                    <form method="post" action="/column?action=updateComment&id=${comment.id}&idCard=${card.id}">
                                        <div class="mb-3">
                                            <input type="text" name="comment" value="${comment.comment}" class="form-control">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
<%--                                Delete comment--%>
                                <a href="/column?action=deleteComment&id=${comment.id}&idCard=${card.id}">
                                   <span class="textIcon"><u>Delete</u></span>
                                </a>

                            </div>
                        </c:forEach>
                        <form method="post" action="/column?action=addComment&id=${card.id}">
                            <div class="mb-3">
                                <input id="inputComment" type="text" name="comment" class="form-control">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="cardRight">
                    <h2>Option</h2>
                    <hr>
                    <div onclick="openMember()" class="boxIconCard">
                        <a>
                            <i class="fa-solid fa-user" style="color: #000000;"></i>
                            <span>Member</span>
                        </a>
                    </div>
                    <div class="boxIconCard">
                        <i class="fa-solid fa-tag" style="color: #000000;"></i>
                        <span>Label</span>
                    </div>
                    <form method="POST" action="FileUploadServlet" enctype="multipart/form-data" id="uploadForm">
                        <div class="boxIconCard">
                            <label for="fileInput">
                                <i class="fa-solid fa-paperclip" style="color: #000000;"></i>
                                <span>Attach</span>
                            </label>
                            <input type="file" name="file" id="fileInput" style="display:none;" onchange="displayFileName()" />
                        </div>

                        <div id="fileNameContainer" style="display: none;">
                            <p>File Name:</p>
                            <span id="fileName"></span>
                        </div>

                        <!-- Thêm nút để kích hoạt sự kiện submit của form -->
                        <input type="button" value="Upload" onclick="uploadFile()" />
                    </form>
                </div>
                <div id="member" style="display: none;">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeMember()">×</a>
                    <c:forEach var="userToTable" items="${userToTable}">

                        <a href="/column?action=addMemberToCard&idUser=${userToTable.idUser}&idCard=${card.id}&idTable=${tables.id}"
                           onclick="closeFormContent()">
                            <div class="circleMember">
                                <img src="${userToTable.avatar}" alt="Avatar">
                            </div>
                            <p>${userToTable.nameUser}</p>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </c:if>

    </div>
</div>
<script>



    function displayFileName() {
        var fileInput = document.getElementById('fileInput');
        var fileNameContainer = document.getElementById('fileNameContainer');
        var fileNameSpan = document.getElementById('fileName');

        // Hiển thị tên file
        fileNameSpan.textContent = fileInput.files[0].name;
        fileNameContainer.style.display = 'block';
    }

    function uploadFile() {
        // Kích hoạt sự kiện submit của form
        document.getElementById('uploadForm').submit();
    }
    // function openFormContent(id, name) {
    //     document.getElementById("formShowCard").style.display = "block";
    //     document.getElementById("textName").innerText = name;
    // }
    function openFormEdit() {
        document.getElementById("formEdit").style.display = "block";
    }

    function closeFormEdit() {
        document.getElementById("formEdit").style.display = "none";
    }

    function closeFormContent() {
        document.getElementById("formShowCard").style.display = "none";
    }

    function openFormCard(idColum) {
        document.getElementById("formAddCard" + idColum).style.display = "block";
    }

    function closeFormCard(idColum) {
        document.getElementById("formAddCard" + idColum).style.display = "none";
    }

    function openFormDelete() {
        document.getElementById("formDelete").style.display = "block";
    }

    function closeFormDelete() {
        document.getElementById("formDelete").style.display = "none";
    }

    function openForm() {
        document.getElementById("formAdd").style.display = "block";
    }

    function closeForm() {
        document.getElementById("formAdd").style.display = "none";
    }

    function showConfirmation() {
        var result = confirm("Are you sure you want to remove this table ?");
        if (result) {
            window.location.href = "/addUserToTable?action=deleteTable&idTable=${tables.id}&id=${userOfTable.id}";
        }
    }

    function openMember() {
        document.getElementById("member").style.display = "block";
    }

    function closeMember() {
        document.getElementById("member").style.display = "none";
    }

    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginRight = "250px";
        document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginRight= "0";
        document.body.style.backgroundColor = "white";
    }

    function openPermission() {
        document.getElementById("my-div").style.display = "block";
    }

    function closePermission() {
        document.getElementById("my-div").style.display = "none";
    }

    const inputElement = document.getElementById("title");
    const inputValue = document.getElementById("buttonEdit")

    inputElement.addEventListener("dblclick", function () {
        inputElement.disabled = false;
        inputElement.focus();
    });

    inputElement.addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            inputElement.disabled = true;
            editName();
        }
    });

    // inputElement.addEventListener("blur", function () {
    //     inputElement.disabled = true;
    //     editName();
    // });

    function editName() {
        document.getElementById("buttonEdit").click();
    }

    input.addEventListener('input', resizeInput);
    resizeInput.call(input);

    function resizeInput() {
        this.style.width = this.value.length + "ch";
    }

    const inputTitle = document.getElementById("titleColumn")
    const inputColumn = document.getElementById("buttonColumn")

    inputTitle.addEventListener("dblclick", function () {
        inputTitle.disabled = false;
        lockInput(inputTitle)
        inputTitle.focus();

    });

    inputTitle.addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            inputTitle.disabled = true;
            editColumn();
        }
    });

    inputTitle.addEventListener("blur", function () {
        inputTitle.disabled = true;
        editColumn();
    });

    function editColumn() {
        // inputTitle.addEventListener("blur", function () {
        //     inputTitle.disabled = true;
        //     editColumn();
        // });
        function editColumn() {
            document.getElementById("buttonColumn").click();
        }
    }

    function showSearchCard() {
        var button = document.getElementById("searchCard");
        if (button.style.display === "none") {
            button.style.display = "block";
        } else {
            button.style.display = "none";
        }
    }

    // function showButton(){
    //     var button = document.getElementById("clickContent");
    //     if (button.style.display === "none"){
    //         button.style.display = "block";
    //     }else {
    //         button.style.display ="none";
    //     }
    // }
</script>
</body>
</html>
