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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}public/css/editUser.css"/>
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
</script>
</body>
</html>
