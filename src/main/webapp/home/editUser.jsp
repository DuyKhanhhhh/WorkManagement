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
    body{
        background-color: #e0e0e0;
    }

    .headImg {
        margin-right: 20px;
    }

    .headRight {
        text-align: right;
        padding-right: 10px;
    }

    #header {
        position: fixed;
    }

    #footer {
        bottom: 0;
        left: 0;
        right: 0;
        position: fixed;
    }

    a {
        text-decoration: none;
    }

    h3 {
        font-family: initial;
    }

    span {
        font-family: initial;;
    }

    .dropdown {
        max-width: 25em;
        position: relative;
        width: 100%;
    }

    .dropdown-btn {
        background: #b2b2b2;
        font-size: 18px;
        width: 100%;
        border: none;
        color: #fff;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0.7em 0.5em;
        border-radius: 0.5em;
        cursor: pointer;
    }

    .arrow {
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-top: 6px solid #fff;
        transition: transform ease-in-out 0.3s;
    }

    .dropdown-content {
        list-style: none;
        position: absolute;
        top: 3.2em;
        width: 100%;
        visibility: hidden;
        overflow: hidden;
    }

    .dropdown-content li {
        background: #2f3238;
        border-radius: 0.5em;
        position: relative;
        left: 100%;
        transition: 0.5s;
        transition-delay: calc(60ms * var(--delay));
    }

    .dropdown-btn:focus + .dropdown-content li {
        left: 0;
    }

    .dropdown-btn:focus + .dropdown-content {
        visibility: visible;
    }

    .dropdown-btn:focus > .arrow {
        transform: rotate(180deg);
    }

    .dropdown-content li:hover {
        background: #1d1f24;
    }

    .dropdown-content li a {
        display: block;
        padding: 0.7em 0.5em;
        color: #fff;
        margin: 0.1em 0;
        text-decoration: none;
    }
    .circle {
        width: 460px;
        height: 460px;
        border-radius: 50%;
        margin-top: 16%;
        margin-left: 13%;
        overflow: hidden;
        position: relative;
    }
    .circle img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .content{
        margin-top: 14%;
        margin-right: 9%;
        border: 1px solid black;
        background-color: #d1d1d1;
        height: 82%;
        border-radius: 2%;
        box-shadow: 0 2px 4px rgba(0, 1, 0, 2);
    }
    .form-control-lg{
        margin-left: 225px;
        width: 60%;
    }
    .titleInput{
        margin-left: 20%;
        font-size: 30px;
    }
    .caption{
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        text-align: center;
        background-color: rgba(0, 0, 0, 0.7);
        color: white;
        padding: 10px;
        margin: 0;
        font-size: 20px;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="header">
            <div class="container-fluid">
                <div class="headImg">
                    <img src="https://logos-world.net/wp-content/uploads/2021/02/Trello-Logo.png"
                         width="130px" height="60px">
                </div>
                <div style="width: 600px">
                    <form class="d-flex">
                        <input class="form-control" type="search" placeholder="Search">
                        <button style="margin-left: 10px" class="btn btn-outline-secondary" type="submit">Search
                        </button>
                    </form>
                </div>
                <div class="headRight">
                    <span class="group-text">
                    <div class="collapse navbar-collapse">
                      <i class="fa-solid fa-bell" style="color: #ffffff;font-size: 34px; margin-right: 10px"></i>
                        <div class="dropdown">
                            <button class="dropdown-btn" aria-haspopup="menu">
                                <span><c:out value="${user.name}"/></span>
                                <span class="arrow"></span>
                            </button>
                            <ul class="dropdown-content" role="menu">
                                <li style="--delay: 3;"><a href="#">Setting</a></li>
                                <li style="--delay: 1;"><a href="/homeUser?action=editUser&id=${user.id}">Edit</a></li>
                                <li style="--delay: 2;"><a href="/updatePassword?login=updatePassword&id=${user.id}">Change PassWord</a></li>
                                <li style="--delay: 4;"><a href="login.jsp">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                    </span>
                </div>
            </div>
        </nav>
    </div>
    <div class="row" id="content">
        <div class="col-4">
            <button type="submit" class="btn btn-secondary" style="margin-top: 15%">
                <a style="text-decoration: none;color: white" href="/homeUser">Back</a>
            </button>
            <figure class="circle">
                <img src="<c:out value='${user.avatar}'/>" alt="Avatar">
                <figcaption class="caption"><c:out value="${user.name}"/></figcaption>
            </figure>
        </div>
        <div class="col-8">
            <div class="content">
                <form method="post">
                    <fieldset>
                        <c:if test="${message != null}">
                            <div class="alert alert-success" role="alert">
                                    ${message}
                            </div>
                        </c:if>
                        <script>
                            setTimeout(function () {
                                document.querySelector(".alert").remove();
                            }, 3000);
                        </script>
                        <caption>
                            <h2 style="text-align: center; padding-top: 30px"><b>Edit Information User</b></h2>
                        </caption>
                        <input type="hidden" name="idUd" value="${user.id}">
                        <div class="form-outline mb-4">
                            <span class="titleInput">Name</span>
                            <input type="text" name="nameUd" value="${user.name}"
                                   class="form-control form-control-lg"
                                   placeholder="Name" required/>
                        </div>

                        <div class="form-outline mb-4">
                            <span class="titleInput">PhoneNumber</span>
                            <input type="text" name="phoneNumberUd" value="${user.phoneNumber}"
                                   class="form-control form-control-lg"
                                   placeholder="Number" required/>
                        </div>

                        <div class="form-outline mb-4">
                            <span class="titleInput">Address</span>
                            <input type="text" name="addressUd" value="${user.address}"
                                   class="form-control form-control-lg" placeholder="Address" required/>
                        </div>

                        <div class="form-outline mb-4">
                            <span class="titleInput">Avatar</span>
                            <input type="text" name="avatarUd" value="${user.avatar}"
                                   class="form-control form-control-lg"
                                   placeholder="Avatar" required/>

                        </div>
                        <div class="d-flex justify-content-center" style="padding-top: 20px">
                            <button type="submit"
                                    class="btn btn-success btn-light btn-lg gradient-custom-4 text-body">
                                Update
                            </button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="bg-light py-2" id="footer">
            <div class="container text-center">
                <p class="text-muted mb-0 py-1">© 2023 Trello Group 7.</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
