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
    <div id="content">

        <%--            Form Add Group         --%>
        <div id="formAddGroup" class="modal">
            <div class="modal__content">
                <a class="modal__btn-close" onclick="closeFormGroup()"><i class="fa-solid fa-x"></i></a>
                <div class="modal__group-half">
                    <div class="formGroup-container">
                        <form class="formGroup__form" method="post" action="/homeUser?action=addGroup">
                            <h2 class="formGroup__description-title"> Let's create a Group </h2>
                            <p class="formGroup__description-sup-title">Boost your productivity by making it easier for
                                everyone access boards in one location</p>
                            <label class="formGroup__form-label-l">Group name <span
                                    class="formGroup__form-span formGroup__form-span-require">*</span> </label>
                            <input class="formGroup__form-input" type="text" name="name" placeholder="Name group..."
                                   required/>
                            <label class="formGroup__form-label-l">Group type </label>
                            <select class="formGroup__form-input" name="groupType" required>
                                <option>Manage</option>
                                <option>Accountant</option>
                                <option>Plan</option>
                            </select>
                            <label class="formGroup__form-label-l">Permission </label>
                            <select class="formGroup__form-input" name="permission" required>
                                <option>Public</option>
                                <option>Private</option>
                            </select>
                            <label class="formGroup__form-label-l">Information <span
                                    class="formGroup__form-span formGroup__form-span-option">Optional</span></label>
                            <textarea class="formGroup__form-input formGroup__form-area "
                                      placeholder="Leave a comment here" name="information"></textarea>
                            <button class="formGroup__form-submit" type="submit">Create</button>
                        </form>
                    </div>
                </div>
                <div class="modal__group-half modal__group-background">
                    <div class="modal__group-image ">

                    </div>
                </div>
            </div>
        </div>
                <%--            INFORMATION         --%>
            <c:if test="${listGroup != null}">
                <div id="formInformation" class="modals">
                    <div class="modal__information">
                        <a class="modal__btnIn-formation-close" onclick="closeFormInformation()"><i class="fa-solid fa-x"></i></a>
                        <div class="modal__information-half">
                            <div class="formGroup-container">
                                <form class="formGroup__form" method="post" action="/homeUser?action=updateGroup">
                                    <input type="hidden" name="id" value="<c:out value='${listGroup.id}' />"/>
                                    <h2 class="formGroup__description-title">Group Information</h2>
                                    <label class="formGroup__form-label-l">Group name <span
                                            class="formGroup__form-span formGroup__form-span-require">*</span> </label>
                                    <input class="formGroup__form-input" type="text" name="name"  value="<c:out value='${listGroup.name}'/>"
                                           required/>
                                    <label class="formGroup__form-label-l">Group type </label>
                                    <select class="formGroup__form-input" name="groupType" required>
                                        <option><c:out value='${listGroup.groupType}'/></option>
                                        <c:if test="${listGroup.groupType != 'Manage'}">
                                            <option>Manage</option>
                                        </c:if>
                                        <c:if test="${listGroup.groupType != 'Accountant'}">
                                            <option>Accountant</option>
                                        </c:if>
                                        <c:if test="${listGroup.groupType != 'Plan'}">
                                            <option>Plan</option>
                                        </c:if>
                                    </select>
                                    <label class="formGroup__form-label-l">Permission </label>
                                    <select class="formGroup__form-input" name="permission" required>
                                        <option><c:out value='${listGroup.permission}'/></option>
                                        <option>Public</option>
                                        <option>Private</option>
                                    </select>
                                    <label class="formGroup__form-label-l">Information <span
                                            class="formGroup__form-span formGroup__form-span-option">Optional</span></label>
                                    <textarea class="formGroup__form-input formGroup__form-area "
                                              name="information" value="<c:out value='${listGroup.information}'/>">
                                    </textarea>
                                    <button class="formGroup__form-submit" type="submit">Edit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

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
                    <a onclick="showConfirmation(${group.id})" class="group__header-control">
                        <i class="fa-solid fa-trash"></i>
                        <span>Delete</span>
                    </a>
                </div>
            </div>
                <%--      table      --%>
            <div class="group__tables">
                <c:forEach items="${tables}" var="table" varStatus="count">
                    <c:if test="${group.id eq table.idGroup}">
                        <div class="group__table hover-black"
                             style="background: url('https://picsum.photos/200/10${count.count}') no-repeat center">
                            <a href="/addUserToTable?action=showTable&id=${group.id}&idTable=${table.id}&idUser=${user.id}"
                               style="text-decoration: none; color: black">
                                <div class="group__table-name">
                                    <h4>${table.name}</h4>
                                </div>
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="group__table hover-white group__table-add" onclick="openFormCreateTable(${group.id})">
                    <div class="group__table-btn">
                        <i class="fa-solid fa-plus"></i>
                    </div>
                </div>
            </div>
                    <%--      form create table     --%>
                <div class="modal" id="formAddTable${group.id}">
                    <div class="modal__content w-fit">
                        <a href="javascript:void(0)" class="modal__btn-close"
                           onclick="closeFormCreateTable(${group.id})">&times;</a>
                            <div class="formGroup-container">
                                <form class="formGroup__form" method="post"
                                      action="/homeUser?action=addTable&id=${group.id}">
                                    <h2 class="formGroup__description-title"> Create table </h2>
                                    <label class="formGroup__form-label-l">Table name <span
                                            class="formGroup__form-span formGroup__form-span-require">*</span> </label>
                                    <input class="formGroup__form-input" type="text" name="name"
                                           placeholder="Lonely Wolf."
                                           required/>
                                    <label class="formGroup__form-label-l">Permission </label>
                                    <select class="formGroup__form-input" name="permission" required>
                                       <option>Private</option>
                                    <option>Workspace</option>
                                    <option>Public</option>
                                    </select>
                                    <button class="formGroup__form-submit" type="submit">Create</button>
                                </form>
                            </div>

                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>

    <script>
        function showConfirmation(idGroup) {
            var result = confirm("Are you sure you want to remove this group ?");
            if (result) {
                window.location.href = "/homeUser?action=deleteGroup&id=" + idGroup;
            } else {
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
        function closeFormInformation(){
            document.getElementById("formInformation").style.display = "none"
        }

        function openFormCreateTable(id) {
            document.getElementById("formAddTable" + id).style.display = "flex";
        }

        function closeFormCreateTable(id) {
            document.getElementById("formAddTable" + id).style.display = "none";
        }

        function openFormGroup() {
            document.getElementById("formAddGroup").style.display = "flex";
        }

        function closeFormGroup() {
            document.getElementById("formAddGroup").style.display = "none";
        }
    </script>
</body>
</html>
