<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<header>
    <nav class="navbar navbar-dark bg-dark navbar-expand-lg">
        <a class="navbar-brand mr-5" href="/home">Przychodnia</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainmenu">

            <ul class="navbar-nav mr-auto">

                <li class="nav-item">
                    <a class="nav-link" href="/home">Pulpit</a>
                </li>

                <sec:authorize access="hasAnyRole('ADMIN','USER')">
                    <li class="nav-item">
                        <a class="nav-link" href="/patient/list">Pacjenci</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ADMIN','USER')">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu1" aria-haspopup="true"> Zabiegi </a>

                        <div class="dropdown-menu" aria-labelledby="submenu1">
                            <a class="dropdown-item" href="/visit/list">Wszystkie</a>
                            <a class="dropdown-item" href="/visit/listToComplete">Zaplanowane</a>
                            <a class="dropdown-item" href="/visit/listCompleted">Zrealizowane</a>
                        </div>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMIN')">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu2" aria-haspopup="true"> Profil admina </a>

                        <div class="dropdown-menu" aria-labelledby="submenu2">
                            <a class="dropdown-item" href="#">Statystyki</a>
                            <a class="dropdown-item" href="/user/list">Pracownicy</a>
                            <a class="dropdown-item" href="/treatment/list">Zabiegi</a>
                            <a class="dropdown-item" href="#">Sprawozdawczość</a>
                        </div>
                    </li>
                </sec:authorize>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Wyloguj</a>
                </li>
            </ul>

        </div>
    </nav>
</header>
<section>
    <div class="container-fluid">
        <div class="row">
            <main role="main" class="col-12 ml-sm-auto px-md-4">
                <form:form method="post" modelAttribute="user">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">${user.name} ${user.surname}</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="pl-5"><a
                                        class="btn form-control btn-outline-secondary" href="/user/enable/${user.id}" type="button">Wyłącz użytkownika
                                </a></li>
                                <li><button type="submit" class="btn form-control btn-outline-secondary">Edytuj użytkowika
                                </button></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <table class="table table-sm">
                    <tbody>

                    <tr class="d-flex pb-2">

                        <th scope="row" class="col-2 w-100 p-1">Role</th>
                        <td class="col-10">
                            <c:forEach items="${roles}" var="role">
                                ${role.name} <form:checkbox value="${role}" path="roles"/>
                            </c:forEach>

                            <form:errors path="roles" cssClass="errorMessage"/>
                        </td>
                    </tr>
                    <tr class="d-flex pb-2">
                        <form:label path="name">
                            <th scope="row" class="col-2">Imie</th>
                        </form:label>
                        <td class="col-10">
                            <form:input path="name" class="w-100 p-1"/>
                            <form:errors path="name" cssClass="errorMessage"/>
                        </td>
                    </tr>
                    <tr class="d-flex pb-2">
                        <form:label path="surname">
                            <th scope="row" class="col-2">Nazwisko</th>
                        </form:label>
                        <td class="col-10">
                            <form:input path="surname" class="w-100 p-1"/>
                            <form:errors path="surname" cssClass="errorMessage"/>
                        </td>
                    </tr>
                    <tr class="d-flex pb-2">
                        <form:label path="pesel">
                            <th scope="row" class="col-2">Pesel</th>
                        </form:label>
                        <td class="col-10">
                            <form:input path="pesel" class="w-100 p-1"/>
                            <form:errors path="pesel" cssClass="errorMessage"/>
                        </td>
                    </tr>
                    <tr class="d-flex pb-2">
                        <form:label path="salary">
                            <th scope="row" class="col-2">Pensja</th>
                        </form:label>
                        <td class="col-10">
                            <form:input path="salary" class="w-100 p-1"/>
                            <form:errors path="salary" cssClass="errorMessage"/>
                        </td>
                    </tr>
                        <form:label path="username">
                        </form:label>
                            <form:input path="username" type="hidden" class="w-100 p-1"/>
                            <form:errors path="username" cssClass="errorMessage"/>
                        <form:label path="password">
                        </form:label>
                            <form:input path="password" type="hidden" class="w-100 p-1"/>
                            <form:errors path="password" cssClass="errorMessage"/>

                    </tbody>
                </table>
                </form:form>
            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="/dashboard.js"></script>
</body>

</html>