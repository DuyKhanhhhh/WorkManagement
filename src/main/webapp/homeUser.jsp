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
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: Arial,sans-serif;
        font-size: 14px;
    }



    body {
        background-color: #fff;
    }

    /* -----------header------------ */

    #header {
        background-color: #fff;
        position: fixed;
        height: 48px;
        display: flex;
        top: 0;
        right: 0;
        left: 0;
        justify-content: space-between;
        align-items: center;
        padding: 0 10%;
        border-bottom: 1px solid rgba(23, 43, 77, 0.16);
    }

    .header__logo {
        width: 84px;
    }

    .header__logo-img {
        width: 100%;
    }

    .header__nav-right {
        padding: 0;
        margin: 0;
        position: relative;
        list-style-type: none;
    }

    .headRight {
        display: flex;
        align-items: center;
    }

    .header__avatar {
        width: 24px;
        height: 24px;
        object-fit: cover;
        border-radius: 50%;
    }


    .header__subnav {
        display: none;
        list-style-type: none;
        position: absolute;
        top: 100%;
        right: 0;
        background-color: #282e33;
        color: rgb(182, 194, 207);
    }

    .header__subnav li > a {
        color: white;
        display: block;
        padding: 12px 32px;
        text-decoration: none;
    }

    .header__subnav > li:hover > a {
        background-color: #A1BDD914;
    }

    /*     --------body--------     */

    #body {
        margin-top: 88px;
        display: flex;
        justify-content: center;
        background-color: #ffffff;
    }

    #boxLeft {
        width: 15%;
        position: sticky;
        top: 0
    }

    #content {
        width: 60%;
        margin: 0 16px;
    }

    .aside__list {
        font-size: 14px;
        list-style-type: none;
        padding: 0 16px;
    }

    .aside__list-item {
        padding: 6px 8px;
        display: flex;
        justify-content: space-between;
        width: 100%;
        line-height: 20px;
        align-items: center;
    }

    .aside__list-item-icon {
        margin-right: 8px;
        width: 15px;
        height: 15px;
    }

    .aside__list-item span {
        flex-grow: 1;
    }

    .fa-user-friends:before, .fa-user-group:before {
        height: 14px;
        width: 14px;
    }

    .group-heading h3{
        color: rgb(68, 84, 111);
        font-size: 16px;
        font-weight: 700;
        line-height: 24px;
        margin: 20px 0;
    }

    .group_header {
        display: flex;
        justify-content: space-between;
        padding-bottom: 11px;
    }

    .group__header-controls {
           display: flex;
    }

    .group__header-control {
        text-decoration: none;
        color: black;
        padding: 6px 12px 6px 6px;
    }

    .groupContent {
        width: 200px;
        height: 96px;
        border-radius: 4px;
        border: 1px solid black;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .table_create span{
        font-size: 70px;
    }

    .group__tables {
        display: flex;
    }




    .icon {
        text-decoration: none;
        color: black;
        margin-right: 30px;
        padding: 4px 10px 1px 10px;
        box-shadow: 2px 0 4px rgba(0, 0, 0, 1.5);
        background-color: #e9ecef;
        border-radius: 4px
    }

    #contentTitle {
        margin-top: 48px;
    }

    .table {
        width: 100%;
        height: 3rem;
        margin-top: 1rem;
    }


    .group_name {
        width: 80%;
        height: 3rem;
    }

    .group_add {
        margin-left: 8%;
    }

    .d_flex_left {
        width: 50%;
        height: auto;
        float: left;
    }

    .d_flex_right {
        width: 50%;
        height: auto;
        float: left;
        padding-left: 8.8%;
        padding-bottom: 20px;
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



    .formAddGroup {
        display: none;
        position: fixed;
        border: 3px solid #9b9b9b;
        width: 67%;
        height: 608px;
        top: 45%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 9999;
        border-radius: 2%;
        background-color: #e9ecef;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        text-align: center;
    }

    .formAddGroup a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #000000;
        display: block;
    }

    .formAddGroup .closebtn {
        position: absolute;
        top: -18px;
        right: 12px;
        font-size: 50px;
    }

    .select {
        width: 70%;
        height: 110px;
        margin: 0 auto;
    }

    .group_type {
        width: 50%;
        height: 40px;
        float: left;
    }

    .permission {
        width: 50%;
        height: 40px;
        float: left;
    }

    .title_h2 {
        margin-top: 40px;
    }

    #inputName {
        padding-left: 15%;
        padding-right: 15%;
    }

    .modal-open {
        overflow: hidden;
    }

    .modal-open::before {
        content: "";
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
        z-index: 9998;
    }

    .formAddTable {
        display: none;
        position: fixed;
        border: 3px solid #d8ceff;
        top: 22%;
        left: 43%;
        width: 24%;
        height: 259px;
        border-radius: 2%;
        background-color: #959595;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        text-align: center;
    }

    .formAddTable a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #000000;
        display: block;
    }

    .circleMember {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .circleMember img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .formAddTable .closebtn {
        position: absolute;
        top: -20px;
        right: 2px;
        font-size: 38px;
    }
</style>
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
                    <a onclick="openFormGroup()">
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

        <%--            Form Add Group--%>
        <div id="formAddGroup" class="formAddGroup">
            <form method="post" action="/homeUser?action=addGroup">
                <div>
                    <a href="javascript:void(0)" class="closebtn" onclick="closeFormGroup()">&times;</a>
                    <div class="title_h2">
                        <h2>Create Group</h2>
                    </div>

                    <div class="form-outline mb-4" id="inputName">
                        <label style="float: left;font-size: 20px">Name(<span style="color:red;">*</span>)</label>
                        <input type="text" name="name" class="form-control form-control-lg"
                               placeholder="Name" required/>
                    </div>

                    <div class="select">
                        <div class="group_type">
                            <label style="float: left;font-size: 20px">Group Type(<span
                                    style="color:red;">*</span>)</label>
                            <select class="form-select" name="groupType"
                                    style="width: 380px;height: 45px;" required>
                                <option></option>
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
                            <label style="font-size: 20px; margin-right: 55rem">Information</label>
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
        <%--        INFORMATION--%>
        <%--                <div id="formIFORMATION" class="formAddGroup">--%>
        <%--                    <form method="post" action="/homeUser?action=addGroup">--%>
        <%--                        <div>--%>
        <%--                            <a href="javascript:void(0)" class="closebtn" onclick="closeFormGroup()">&times;</a>--%>
        <%--                            <div class="title_h2">--%>
        <%--                                <h2>Create Group</h2>--%>
        <%--                            </div>--%>

        <%--                            <div class="form-outline mb-4" id="inputName">--%>
        <%--                                <label style="float: left;font-size: 20px">Name(<span style="color:red;">*</span>)</label>--%>
        <%--                                <input type="text" name="name" class="form-control form-control-lg"--%>
        <%--                                       placeholder="Name" required/>--%>
        <%--                            </div>--%>

        <%--                            <div class="select">--%>
        <%--                                <div class="group_type">--%>
        <%--                                    <label style="float: left;font-size: 20px">Group Type(<span--%>
        <%--                                            style="color:red;">*</span>)</label>--%>
        <%--                                    <select class="form-select" name="groupType"--%>
        <%--                                            style="width: 380px;height: 45px;" required>--%>
        <%--                                        <option></option>--%>
        <%--                                        <option>Manage</option>--%>
        <%--                                        <option>Accountant</option>--%>
        <%--                                        <option>Plan</option>--%>
        <%--                                    </select>--%>
        <%--                                </div>--%>
        <%--                                <div class="permission">--%>
        <%--                                    <label style="float: left;margin-left: 15px;font-size: 20px">Permission(<span--%>
        <%--                                            style="color:red;">*</span>)</label>--%>
        <%--                                    <select class="form-select" name="permission"--%>
        <%--                                            style="width: 380px;height: 45px;margin-left: 4%;" required>--%>
        <%--                                        <option>Public</option>--%>
        <%--                                        <option>Private</option>--%>
        <%--                                    </select>--%>
        <%--                                </div>--%>
        <%--                            </div>--%>
        <%--                            <div style="margin-left: 15% ">--%>
        <%--                                <div class="form-floating">--%>
        <%--                                <textarea class="form-control" placeholder="Leave a comment here" name="information"--%>
        <%--                                          style="height: 180px;width: 82%;"></textarea>--%>
        <%--                                    <label style="font-size: 20px; margin-right: 55rem">Information</label>--%>
        <%--                                </div>--%>
        <%--                            </div>--%>
        <%--                            <div>--%>
        <%--                                <button style="width: 190px;height: 50px;margin-top: 25px" class="btn btn-light"--%>
        <%--                                        type="submit">Create--%>
        <%--                                </button>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </form>--%>
        <%--                </div>--%>
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
                            <span style="font-size: 20px">Information</span>
                        </a>
                        <a href="/homeUser?action=table&idGroup=${group.id}" class="group__header-control">
                            <i class="fa-solid fa-table"></i>
                            <span style="font-size: 20px">Table</span>
                        </a>
                        <a href="/homeUser?action=member&idGroup=${group.id}&idUser=${user.id}" class="group__header-control">
                            <i class="fa-solid fa-user-group"></i>
                            <span style="font-size: 20px">Member</span>
                        </a>
                        <a href="#" class="group__header-control">
                            <i class="fa-solid fa-gear"></i>
                            <span style="font-size: 20px">Setting</span>
                        </a>
                    </div>
                </div>

                <%--      table      --%>
                <div class="group__tables">
                    <c:forEach items="${tables}" var="table">
                        <c:if test="${group.id eq table.idGroup}">
                            <a href="/addUserToTable?action=showTable&id=${group.id}&idTable=${table.id}&idUser=${user.id}"
                               style="text-decoration: none; color: black">
                                <div class="groupContent">
                                    <div class="table_create">
                                        <h4 style="padding-top: 26px">${table.name}</h4>
                                    </div>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>

                <%--       Add table button       --%>
                <div class="groupContent" onclick="openFormCreateTable(${group.id})">
                    <div class="table_create">
                        <span style="font-size: 110px">+</span>
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
                        <button type="submit" class="btn btn-success btn-light btn-lg gradient-custom-4 text-body">
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
