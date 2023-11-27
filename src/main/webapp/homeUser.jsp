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
    <script src="https://kit.fontawesome.com/892d14366e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/homeView.css"/>
</head>

<body>

<%--    -------HEADER------    --%>
<nav id="header">
    <a class="header__logo">
        <img class="header__logo-img js-subnavToggle"
             src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png">
    </a>
    <ul class="header__nav-right">
        <li onclick="setDisplaySubnav()" class="headRight">
            <%--            <img class="header__avatar" src="${user.getAvatar()}" alt="Avatar">   Mở cai này sau khi xong giao dien--%>
            <img class="header__avatar"
                 src="https://facebookninja.vn/wp-content/uploads/2023/06/anh-dai-dien-mac-dinh-zalo.jpg" alt="Avatar">
            <ul id="js-subnav" class="header__subnav js-subnav">
                <li><a href="#"> Setting</a></li>
                <li><a href="/homeUser?action=editUser&id=${user.id}">Edit</a></li>
                <li><a href="/updatePassword?login=updatePassword&id=${user.id}">Change PassWord</a></li>
                <li><a href="/loginAndSignUp?login=logout">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>

<div id="body">
    <aside id="boxLeft">
        <ul class="aside__list">
            <li class="aside__list-item">
                <i class="fa-solid fa-table aside__list-item-icon"></i>
                <span class="textTable">Table</span>
            </li>
            <li class="aside__list-item" style="border-bottom: 1px solid rgba(9, 30, 66, 0.14)">
                <div>
                    <i class="fa-solid fa-user-group aside__list-item-icon"></i>
                    <span class="textSpan">Group</span>
                </div>
                <div>
                    <a onclick="openFormGroup()" class="aside__list-item-control">
                        <i class="fa-solid fa-plus aside__list-add"></i>
                    </a>
                </div>
            </li>
            <c:forEach var="group" items="${groups}">
                <li class="aside__list-item">
                    <span>${group.name}</span>
                </li>
            </c:forEach>
        </ul>
    </aside>
    <div class="col-10" id="content">

        <%--            Form Add Group         --%>
        <div id="formAddGroup" class="formAddGroup">
            <form method="post" action="/homeUser?action=addGroup">
                <div>
                    <a href="javascript:void(0)" class="closebtn" onclick="closeFormGroup()">&times;</a>
                    <div class="title_h2">
                        <h2>Create Group</h2>
                    </div>
                    <div class="form-outline mb-4" id="inputName">
                        <label style="float: left;font-size: 20px">Name(<span
                                style="color:red;">*</span>)</label>
                        <input type="text" name="name" class="form-control form-control-lg"
                               placeholder="Name" required/>
                    </div>

                    <div class="select">
                        <div class="group_type">
                            <label style="float: left;font-size: 20px">Group type(<span
                                    style="color:red;">*</span>)</label>
                            <select class="form-select" name="groupType"
                                    style="width: 380px;height: 45px;" required>
                                <option>Manage</option>
                                <option>Accountant</option>
                                <option>Plan</option>
                            </select>
                        </div>

                        <div class="permission">
                            <label style="float: left;margin-left: 15px;font-size: 20px">Permission(<span
                                    style="color:red;">*</span>)</label>
                            <select class="form-select" name="permission"
                                    style="width: 380px;height: 45px;margin-left: 4%;" required>
                                <option>Public</option>
                                <option>Private</option>
                            </select>
                        </div>
                    </div>
                    <div style="margin-left: 15% ">
                        <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" name="information"
                                          style="height: 180px;width: 82%;"></textarea>
                            <label>Information</label>
                        </div>
                    </div>
                    <div>
                        <button style="width: 190px;height: 50px;margin-top: 25px" class="btn btn-light"
                                type="submit">Create
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <%--        -----------GROUP---------  --%>
        <div class="group-heading">
            <h3>YOUR GROUPS</h3>
        </div>
        <c:forEach var="group" items="${groups}">
            <div class="group">
                <div class="group_header">
                    <h2 class="group__header-name">${group.name}</h2>
                    <div class="group__header-controls">
                        <a href="/homeUser?action=updateGroup&id=${group.id}" class="group__header-control">
                            <i class="fa-solid fa-table-cells"></i>
                            <span>Information</span>
                        </a>
                        <a href="/homeUser?action=table&idGroup=${group.id}" class="group__header-control">
                            <i class="fa-solid fa-table"></i>
                            <span>Table</span>
                        </a>
                        <a href="/homeUser?action=member&idGroup=${group.id}&idUser=${user.id}"
                           class="group__header-control">
                            <i class="fa-solid fa-user-group"></i>
                            <span>Member</span>
                        </a>
                        <a href="#" class="group__header-control">
                            <i class="fa-solid fa-gear"></i>
                            <span>Setting</span>
                        </a>
                    </div>
                </div>
                    <%--      table      --%>
                <div class="group__tables">
                    <c:forEach items="${tables}" var="table" varStatus="count">
                        <c:if test="${group.id eq table.idGroup}">
                            <div class="group__table"
                                 style="background: url('https://picsum.photos/30${count.count}') no-repeat center">
                                <a href="/addUserToTable?action=showTable&id=${group.id}&idTable=${table.id}&idUser=${user.id}"
                                   style="text-decoration: none; color: black">
                                    <div class="group__table-name">
                                        <h4>${table.name}</h4>
                                    </div>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>
                    <div class="group__table group__table-add" onclick="openFormCreateTable(${group.id})">
                        <div class="group__table-btn">
                            <i class="fa-solid fa-plus"></i>
                        </div>
                    </div>
                </div>

                <div class="formAddTable" id="formAddTable${group.id}">
                    <a href="javascript:void(0)" class="closebtn"
                       onclick="closeFormCreateTable(${group.id})">&times;</a>
                    <form method="post" action="/homeUser?action=addTable&id=${group.id}">
                        <h3>Create New Table</h3>
                        <div class="form-outline mb-3">
                                <span style="margin: 8px" class="input-group-text">
                                    <input type="text" name="name" class="form-control form-control-lg"
                                           placeholder="Enter Your Name" required/>
                                </span>
                        </div>
                        <div class="form-outline mb-4">
                                 <span style="margin: 8px" class="input-group-text">
                                    <select class="form-select" aria-label="Default select example" name="permission">
                                    <option>Public</option>
                                    <option>Private</option>
                                    </select>
                                 </span>
                        </div>
                        <button type="submit"
                                class="btn btn-success btn-light btn-lg gradient-custom-4 text-body">
                            Add
                        </button>
                    </form>
                </div>
            </div>
        </c:forEach>
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

    function openFormCreateTable(id) {
        document.getElementById("formAddTable" + id).style.display = "block";
    }

    function closeFormCreateTable(id) {
        document.getElementById("formAddTable" + id).style.display = "none";
    }

    function openFormGroup() {
        document.getElementById("formAddGroup").style.display = "block";
        document.body.classList.add("modal-open");
    }

    function closeFormGroup() {
        document.getElementById("formAddGroup").style.display = "none";
        document.body.classList.remove("modal-open");
    }
</script>
</body>
</html>
