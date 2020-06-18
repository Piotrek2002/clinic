<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
<body class="pt-5">
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="/">Przychodnia</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainmenu"
                aria-controls="mainmenu" aria-expanded="false" aria-label="Przełącznik nawigacji">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/treatments">Start<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/treatments">Zabiegi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="/login" tabindex="-1" aria-disabled="true">Logowanie</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="/registration" tabindex="-1" aria-disabled="true">Rejestracja</a>
                </li>
            </ul>
            <form class="form-inline mt-2 mt-md-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
</header>

<section>
    <div class="container-fluid">
        <div class="row">
            <main role="main" class="col-12 ml-sm-auto px-md-4">
                <form:form method="post" modelAttribute="patient">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3">
                        <h1 class="h2">Rejestracja</h1>
                        <div class="btn-toolbar">
                            <div class="btn-group mr-2">
                                <ul class="nav nav-pills" role="tablist">
                                    <li>
                                        <button type="submit" class="btn form-control btn-outline-secondary">Zarejestruj się
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <table class="table table-sm">
                        <tbody>
                        <tr class="d-flex pb-2">
                            <form:label path="username">
                                <th scope="row" class="col-2">Nazwa</th>
                            </form:label>
                            <td class="col-10">
                                <form:input path="username" class="w-100 p-1"/>
                                <form:errors path="username" cssClass="errorMessage"/>
                            </td>
                        </tr>
                        <tr class="d-flex pb-2">
                            <form:label path="password">
                                <th scope="row" class="col-2">Hasło</th>
                            </form:label>
                            <td class="col-10">
                                <form:input path="password" type="password" class="w-100 p-1"/>
                                <form:errors path="password" cssClass="errorMessage"/>
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
                            <form:label path="insurance">
                                <th scope="row" class="col-2">Ubezpieczenie</th>
                            </form:label>
                            <td class="col-10">
                                <form:select path="insurance">
                                    <form:option value="1" label="Ubezpieczony"/>
                                    <form:option value="0" label="Nie ubezpieczony"/>
                                </form:select>
                                <form:errors path="insurance" cssClass="errorMessage"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>

                </form:form>

            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="dashboard.js"></script>
</body>

</html>
