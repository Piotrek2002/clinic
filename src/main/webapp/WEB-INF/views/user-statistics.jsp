<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 12.05.2020
  Time: 01:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                            <a class="dropdown-item" href="/user/statistics">Statystyki</a>
                            <a class="dropdown-item" href="/user/list">Pracownicy</a>
                            <a class="dropdown-item" href="/treatment/list">Zabiegi</a>
                            >
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
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 mb-3 ">
                    <h1 class="h2">Statystyki</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="pr-5">
                                    <input type="button" class="btn form-control btn-outline-secondary" value="Wstecz" onClick="history.back();" />
                                </li>
                            </ul>

                        </div>

                    </div>
                </div>
                    <div class="schedules-content border-top">
                        <div class="schedules-content-header mt-2">
                            <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Ilość pracowników
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${userCount}</p>
                                </div>
                            </div>
                            <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Ilość pacjentów
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${patientCount}</p>
                                </div>
                            </div>
                            <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                    Suma pensji wszystkich procowników
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${salary}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                   Ilość wszystkich wizyt
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${allVisits}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                   Ilość wizyt do zrealizowania
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${allVisitsToComplete}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                   Ilość wizyt zrealizowanych
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${allVisitsCompleted}</p>
                                </div>
                            </div>
                            <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size1 col-form-label">
                                   Przychód
                            </span>
                                <div class="col-sm-9 col-lg-10">
                                    <p class="schedules-text">${price}</p>
                                </div>
                            </div>
                        </div>
                    </div>
            </main>
        </div>
    </div>
</section>
<%@include file="scripts.jsp" %>
<script src="http://localhost:8080/dashboard.js"></script>
</body>

</html>
