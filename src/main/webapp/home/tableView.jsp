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
    <%--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">--%>
    <script src="https://kit.fontawesome.com/892d14366e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../public/css/tableView.css"/>
</head>
<body>

<nav id="header">
    <a href="/homeUser" class="header__logo">
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
<div id="body" style="background: url('../public/imgs/background.jpg') no-repeat center fixed">
    <nav class="header__nav-second">
        <div class="header__nav-table">
            <c:forEach var="listTable" items="${listTable}">
                <c:if test="${(tables.id).equals(listTable.id)}">
                    <div>
                        <c:if test="${(roleUser.role).equals('Admin')}">
                            <form action="/addUserToTable" method="post">
                                <input class="header__nav-table-name table__name-input" name="nameUpdate"
                                       type="text" id="title"
                                       value="${listTable.name}">
                                <input name="action" value="editNameTable" type="hidden">
                                <input name="idTable" value="${tables.id}" type="hidden">
                            </form>
                        </c:if>
                        <c:if test="${(roleUser.role).equals('User') || (roleUser.role).equals(null)}">
                            <label class="header__nav-table-name ">${listTable.name}</label>
                        </c:if>
                    </div>
                </c:if>
            </c:forEach>
            <div class="header__nav-item" onclick="openPermission()">
                <button>${tables.permission}</button>
            </div>
        </div>


        <div class="nav-right">
            <div class="nav__search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <form method="post"
                      action="/column?action=searchCard&idTable=${tables.id}">
                    <input class="nav__search-input" type="text" placeholder="Search" aria-label="Search"
                           name="search">
                </form>
            </div>
            <div class="member">
                <c:forEach var="userToTable" items="${userToTable}" begin="0" end="2">
                    <div class="circleMember">
                        <img src="${userToTable.avatar}" alt="Avatar">
                    </div>
                </c:forEach>
                <c:if test="${toTable.countAvatar > 3}">
                    <div class="circleMember">
                        <span style="font-size: 20px; color:  #0000008a">+${toTable.countAvatar - 3 }</span>
                    </div>
                </c:if>
            </div>
            <a class="header__nav-item"
               href="/addUserToTable?action=addUserToTable&id=${groups.id}&idTable=${tables.id}">Add member</a>
            <a class="header__nav-item"
               href="/addUserToTable?action=showUserToTable&idTable=${tables.id}&idUser=${user.id}">Member</a>

        </div>
    </nav>

    <div class="main__canvas">
        <c:forEach items="${listColumn}" var="listColumn">
            <c:if test="${tables.id eq listColumn.idTable}">
                <div class="columnContent">
                    <div class="column__head">
                        <form id="editColumn" action="/addUserToTable" method="post">
                            <input name="nameColumnUpdate" type="text" class="titleColumn" id="titleColumn"
                                   value="${listColumn.name}">
                            <input name="action" value="editNameColumn" type="hidden">
                            <input name="idColumn" value="${listColumn.id}" type="hidden">
                        </form>
                        <a class="icon-l" href="/column?action=delete&id=${listColumn.id}">
                            <i class="fa-solid fa-xmark "></i>
                        </a>
                    </div>
                    <div class="column__cards">
                        <c:forEach items="${listCard}" var="cardItem">
                            <c:if test="${listColumn.id eq cardItem.getIdColumn()}">
                                <a class="column__card" href="/column?action=showCard&idCard=${cardItem.id}">
                                        ${cardItem.getName()}
                                </a>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div id="formAddCard${listColumn.id}" class="addCard">
                        <form class="form__add" method="post" action="/column?action=addCart&idColumn=${listColumn.id}&idUser=${user.id}">
                            <input type="text" class="column__card" name="name" placeholder="Enter a list title">
                            <div class="form__add__control">
                                <button class="button-add" type="submit"> Add Card</button>
                                <a class="button-return" href="javascript:void(0)" onmousedown="closeFormCard(${listColumn.id})">Return</a>
                            </div>
                        </form>
                    </div>
                    <div class="boxAddCart" onclick="openFormCard(${listColumn.id})">
                        <p><i class="fa-solid fa-plus"></i> Add a card</p>
                    </div>
                </div>
            </c:if>
        </c:forEach>
        <div class="columnContent" onmousedown="openForm()">
            <div class="column__head">
                <span class="titleColumn">+ Add list</span>
            </div>
            <div id="formAdd" class="formAdd">
                <form class="form__add" method="post" action="/column?action=addColumn&idTable=${tables.id}">
                        <input type="text" class="column__card" name="name" placeholder="Enter a list title">
                       <div class="form__add__control">
                           <button type="submit" class="button-add">Add Column</button>
                           <a href="javascript:void(0)" class="button-return" onclick="closeForm()">Cancel</a>
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
                            >${card.getContent()}</textarea>
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
                                <a onclick="openFormEdit()" class="textIcon"><u>Edit</u></a>
                                <div id="formEdit" class="formEdit">
                                    <span class="closebtn" onclick="closeFormEdit()">&times;</span>
                                    <form method="post"
                                          action="/column?action=updateComment&id=${comment.id}&idCard=${card.id}">
                                        <div class="mb-3">
                                            <input type="text" name="comment" value="${comment.comment}"
                                                   class="form-control">
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
                        <form method="post" action="/column?action=addComment&idCard=${card.id}&idUser=${user.id}">
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
                            <input type="file" name="file" id="fileInput" style="display:none;"
                                   onchange="displayFileName()"/>
                        </div>

                        <div id="fileNameContainer" style="display: none;">
                            <p>File Name:</p>
                            <span id="fileName"></span>
                        </div>

                        <!-- Thêm nút để kích hoạt sự kiện submit của form -->
                        <input type="button" value="Upload" onclick="uploadFile()"/>
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
    function setDisplaySubnav() {
        let subnav = document.getElementById("js-subnav");
        if (subnav.style.display === "none") {
            subnav.style.display = "block"
        } else {
            subnav.style.display = "none"
        }
    }


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
        console.log("ok")
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
        document.getElementById("main").style.marginRight = "0";
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
