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

    #boxLeft {
        max-height: 100%;
        margin-top: 2.6%;
        height: 100%;
        position: fixed;
        flex: 0 0 auto;
        margin-bottom: 4%;
        box-shadow: 2px 0 6px rgba(0, 0, 0, 1);
        clip-path: inset(0px -10px -10px -10px);
        background-color: #e9ecef;
    }

    .textSpan {
        font-size: 28px;
        margin-left: 14px;
        font-weight: bold;
    }
    i{
        font-size: 25px;
    }

    .table {
        width: 100%;
        height: 3rem;
        margin-top: 1rem;
    }

    .group {
        width: 100%;
        height: 3rem;
        flex: 1 1 auto;
    }

    .group_name {
        width: 80%;
        height: 3rem;
    }

    .group_add {
        margin-left: 8%;
    }
    a {
        text-decoration: none;
        color: black;
    }
    span{
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
    .dropdown-content a{
        font-size: 18px;
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
    .col-10 {
        text-align: center;
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
    .title_h2{
        margin-top: 40px;
    }

    .main_input {
        width: 75%;
        height: 700px;
        border: 5px solid black;
        border-radius: 10px;
        margin-left: 21.5%;
        margin-top: 8%;
    }

    .col-10 {
        text-align: center;
    }

    .select {
        width: 450px;
        height: 70px;
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

    .information {
        width: 470px;
        height: 140px;
        margin: 0 auto;
    }

    .name {
        width: 470px;
        height: 70px;
        margin: 0 auto;
    }

    .nameFloat {
        float: left;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-dark" id="header">
            <div class="container-fluid">
                <div class="headImg">
                    <img src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png"
                         width="100" height="50">
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
        <div class="col-2" id="boxLeft">
            <div class="table">
                <div class="d-flex align-items-center">
                    <i class="fa-solid fa-table" style="color: #000000; font-size: 30px;"></i>
                    <span class="textSpan">Table</span>
                </div>
            </div>
            <div class="group">
                <div class="d-flex  align-items-center">
                    <div class="group_name">
                        <i class="fa-solid fa-user-group" style="color: #000000; font-size: 30px"></i>
                        <span class="textSpan">Group</span>
                    </div>

                </div>
            </div>
            <div class="d-flex  align-items-center">

            </div>
        </div>
        <div class="main_input">
            <button type="submit" class="btn btn-secondary" style="margin-top: 10px">
                <a style="text-decoration: none;color: white" href="/homeUser">Back</a>
            </button>
            <div class="col-10">
                <form method="post" action="/homeUser?action=updateGroup">
                    <div>
                        <div class="title_h2">
                            <h2>Show Group</h2>
                        </div>
                        <br>
                        <br>
                        <c:if test="${listGroup != null}">
                            <input type="hidden" name="id" value="<c:out value='${listGroup.id}' />"/>
                        </c:if>
                        <div class="name">
                            <label style="float: left;margin-left: 34px">Name(<span style="color:red;">*</span>)</label>
                            <input type="text" name="name" style="width: 450px;height: 40px;margin-left: 32px"
                                   value="<c:out value='${listGroup.name}'/>" required>
                        </div>
                        <br>
                        <div class="select">
                            <div class="group_type">
                                <label style="float: left;margin-left: 24px">Group Type(<span
                                        style="color:red;">*</span>)</label>
                                <select name="groupType" style="width: 210px; height: 40px;margin-left: 25px" required>
                                    <option><c:out value='${listGroup.groupType}'/></option>
                                    <option>Manage</option>
                                    <option>Accountant</option>
                                    <option>Plan</option>
                                </select>
                            </div>
                            <div class="permission">
                                <label style="float: left;margin-left: 36px">Permission(<span
                                        style="color:red;">*</span>)</label>
                                <select name="permission" style="width: 210px;height: 40px;margin-left: 36px" required>
                                    <option><c:out value='${listGroup.permission}'/></option>
                                    <option>Public</option>
                                    <option>Private</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="information">
                            <label style="float: left;margin-left: 34px">Information</label>
                            <input type="text" name="information" style="width: 450px;height: 100px;margin-left: 32px"
                                   value="<c:out value='${listGroup.information}'/>">
                        </div>
                        <br>
                        <br>
                        <div>
                            <button type="submit" class="btn btn-secondary" style="width: 200px">Edit</button>
                            <button onclick="showConfirmation()" class="btn btn-secondary" style="width: 200px">
                                <a style="text-decoration: none;color: white"
                                   href="/homeUser?action=deleteGroup&id=${listGroup.id}">Delete</a>
                            </button>
                            <script>
                                function showConfirmation() {
                                    var result = confirm("Are you sure you want to remove this member from the group?");
                                    if (result) {
                                        window.location.href = "/homeUser?action=deleteGroup&id=${group.id}";
                                    } else {
                                    }
                                }
                            </script>
                        </div>
                    </div>
                </form>
                <div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
