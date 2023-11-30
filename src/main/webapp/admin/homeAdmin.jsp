<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: titdzvl
  Date: 24/10/2023
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Admin</title>
    <script src="https://kit.fontawesome.com/892d14366e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/homeAdmin.css"/>
</head>
<style>
    body {
        color: #566787;
        background: #f5f5f5;
        font-family: 'Varela Round', sans-serif;
        font-size: 13px;
    }

    .table-responsive {
        margin: 30px 0;
    }

    .table-wrapper {
        min-width: 1000px;
        background: #fff;
        padding: 20px 25px;
        border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    }

    .table-title {
        padding-bottom: 15px;
        background: #299be4;
        color: #fff;
        padding: 16px 30px;
        margin: -20px -25px 10px;
        border-radius: 3px 3px 0 0;
    }

    .table-title h2 {
        margin: 5px 0 0;
        font-size: 24px;
    }

    .table-title .btn {
        color: #566787;
        float: right;
        font-size: 13px;
        background: #fff;
        border: none;
        min-width: 50px;
        border-radius: 2px;
        border: none;
        outline: none !important;
        margin-left: 10px;
    }

    .table-title .btn:hover, .table-title .btn:focus {
        color: #566787;
        background: #f2f2f2;
    }

    .table-title .btn i {
        float: left;
        font-size: 21px;
        margin-right: 5px;
    }

    .table-title .btn span {
        float: left;
        margin-top: 2px;
    }

    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }

    table.table tr th:first-child {
        width: 60px;
    }

    table.table tr th:last-child {
        width: 100px;
    }

    table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
    }

    table.table-striped.table-hover tbody tr:hover {
        background: #f5f5f5;
    }

    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }

    table.table td:last-child i {
        opacity: 0.9;
        font-size: 22px;
        margin: 0 5px;
    }

    table.table td a {
        font-weight: bold;
        color: #566787;
        display: inline-block;
        text-decoration: none;
    }

    table.table td a:hover {
        color: #2196F3;
    }

    table.table td a.settings {
        color: #2196F3;
    }

    table.table td a.delete {
        color: #F44336;
    }

    table.table td i {
        font-size: 19px;
    }

    table.table .avatar {
        border-radius: 50%;
        vertical-align: middle;
        margin-right: 10px;
    }

    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }

    .pagination li a:hover {
        color: #666;
    }

    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }

    .pagination li.active a:hover {
        background: #0397d6;
    }

    .pagination li.disabled i {
        color: #ccc;
    }

    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }

    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }

    /*--------Form Add--------------*/
    .formAddUser {
        display: none;
        width: 600px;
        height: 545px;
        background-color: white;
        margin: 1% auto;
        text-align: center;
    }

    .modals__btn-close {
        position: absolute;
        font-size: 40px;
        right: 32%;
        top: 105px;
        cursor: pointer;
        padding: 15px;
    }

    .modals__btn-close:hover {
        color: rgba(23, 43, 77, 1);
    }

    .modals__btn-close i {
        font-size: 18px;
    }

    .formAdd {
        width: 550px;
        height: 600px;
        margin: 0 auto;
        text-align: center;
    }

    /*-------------FormUpdate-------------*/
    .formUpdateUser {
        width: 600px;
        height: 615px;
        background-color: white;
        margin: 1% auto;
        text-align: center;
    }

    .formUpdate {
        width: 550px;
        height: 600px;
        margin: 0 auto;
        text-align: center;
    }

    .modals__btn-close {
        position: absolute;
        font-size: 40px;
        right: 32%;
        top: 105px;
        cursor: pointer;
        padding: 15px;
    }

    .modals__btn-close:hover {
        color: rgba(23, 43, 77, 1);
    }

    .modals__btn-close i {
        font-size: 18px;
    }
</style>
<body>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
                        <h2>User <b>Management</b></h2>
                    </div>
                    <div class="col-sm-7">
                        <a onclick="openFormAdd()" class="btn btn-secondary">
                            <i class="material-icons">&#xE147;</i>
                            <span>Add New User</span></a>
                    </div>
                </div>
            </div>
            <%--            ---------Admin Add User------------------%>
            <div id="formAddUser" class="formAddUser">
                <a class="modals__btn-close" onclick="closeFormAdd()"><i class="fa-solid fa-x"></i></a>
                <form class="formAdd" method="post" action="/homeAdmin?user=create">
                    <h2>Add User</h2>
                    <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-envelope"
                               style="color: #000000;font-size: 30px; margin-right: 1rem"></i>
                            <input type="email" name="email" class="form-control form-control-lg"
                                   placeholder="Your email"
                                   pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required/>
                        </span>
                    </div>

                    <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-user" style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="text" name="name" class="form-control form-control-lg"
                                   placeholder="Your name" required/>
                        </span>
                    </div>

                    <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-phone"
                               style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="text" name="phoneNumber" class="form-control form-control-lg"
                                   placeholder="Your phone" pattern="^\d{10}$" required/>
                        </span>
                    </div>

                    <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-lock"
                               style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="password" name="password" class="form-control form-control-lg"
                                   placeholder="Password" required/>
                        </span>
                    </div>

                    <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-key"
                               style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="password" name="confirmPassword"
                                   class="form-control form-control-lg"
                                   placeholder="Repeat Your Password" pattern="^.{6,32}$" required/>
                        </span>
                    </div>

                    <div class="d-flex justify-content-center">
                        <button style="width: 100px;height: 46px;"
                                type="submit" class="btn btn-dark">Create
                        </button>
                    </div>
                </form>
            </div>
            <%--            ---------Admin Edit User------------------%>
            <c:if test="${user != null}">
                <div id="formUpdateUser" class="formUpdateUser">
                    <h2>Edit Product</h2>
                    <a class="modals__btn-close" onclick="closeFormUpdate()"><i class="fa-solid fa-x"></i></a>
                    <form method="post" class="formUpdate" action="/homeAdmin?user=update">
                        <input type="hidden" name="idUd" value="${user.id}">
                        <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-envelope"
                               style="color: #000000;font-size: 30px; margin-right: 1rem"></i>
                            <input type="email" name="emailUd" class="form-control form-control-lg"
                                   value="${user.email}"
                                   pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required/>
                        </span>
                        </div>

                        <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-user" style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="text" name="nameUd" class="form-control form-control-lg" value="${user.name}"
                                   placeholder="Your name" required/>
                        </span>
                        </div>

                        <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-phone"
                               style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="text" name="phoneNumberUd" class="form-control form-control-lg"
                                   value="${user.phoneNumber}" pattern="^\d{10}$" required/>
                        </span>
                        </div>

                        <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-lock"
                               style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="text" name="passwordUd" class="form-control form-control-lg"
                                   value="${user.password}" pattern="^.{6,32}$" required/>
                        </span>
                        </div>

                        <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-location-dot"
                               style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="text" name="addressUd"
                                   class="form-control form-control-lg"
                                   value="${user.address}" required/>
                        </span>
                        </div>
                        <div class="form-outline mb-4">
                        <span class="input-group-text">
                            <i class="fa-solid fa-image"
                               style="color: #000000; font-size: 30px; margin-right: 1rem"></i>
                            <input type="text" name="avatarUd"
                                   class="form-control form-control-lg"
                                   value="${user.avatar}" required/>
                        </span>
                        </div>

                        <div class="d-flex justify-content-center">
                            <button style="width: 100px;height: 46px;"
                                    type="submit" class="btn btn-dark">Update
                            </button>
                        </div>
                    </form>
                </div>
            </c:if>
            <%--            ------------ShowMember----------------%>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Avatar</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>
                </thead>
                <c:forEach var="list" items="${listUser}">
                    <c:if test="${list.email != 'admin'}">
                        <tbody>
                        <tr>
                            <td>${list.id}</td>
                            <td><img src="${list.avatar}" width="80px" height="80px" class="avatar" alt="Avatar"></td>
                            <td>${list.email}</td>
                            <td>${list.name}</td>
                            <td>${list.password}</td>
                            <td>
                                <a href="/homeAdmin?user=update&id=${list.id}" class="settings" title="Settings"
                                   data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>
                                <a href="/homeAdmin?user=delete&id=${list.id}" class="delete" title="Delete"
                                   data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
                    </td>
                </tr>
                        </tbody>
                    </c:if>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script>
    function closeFormUpdate() {
        document.getElementById("formUpdateUser").style.display = "none";
    }

    function openFormAdd() {
        document.getElementById("formAddUser").style.display = "flex";
    }

    function closeFormAdd() {
        document.getElementById("formAddUser").style.display = "none";
    }

    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

</script>
</body>
</html>