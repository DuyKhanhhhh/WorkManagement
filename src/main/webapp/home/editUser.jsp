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

    #footer {
        bottom: 0;
        left: 0;
        right: 0;
        position: fixed;
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
    .circle {
        width: 460px;
        height: 460px;
        border-radius: 50%;
        margin-top: 30%;
        margin-left: 10%;
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
        <div class="col-4">
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
    </div>
    <div class="bg-light py-2" id="footer">
        <div class="container text-center">
            <p class="text-muted mb-0 py-1">© 2023 Trello Group 7</p>
        </div>
    </div>
</div>
</body>
</html>
