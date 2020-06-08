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
                            <a class="dropdown-item" href="#">Zaplanowane</a>
                            <a class="dropdown-item" href="#">Zrealizowane</a>
                        </div>
                    </li>
                </sec:authorize>
                <sec:authorize access="hasRole('ADMIN')">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu2" aria-haspopup="true"> Profil admina </a>

                        <div class="dropdown-menu" aria-labelledby="submenu2">
                            <a class="dropdown-item" href="#">Statystyki</a>
                            <a class="dropdown-item" href="/user/list">Pracownicy</a>
                            <a class="dropdown-item" href="#">Zabiegi</a>
                            <a class="dropdown-item" href="#">Sprawozdawczość</a>
                        </div>
                    </li>
                </sec:authorize>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu3" aria-haspopup="true"> Użytkownik </a>

                    <div class="dropdown-menu" aria-labelledby="submenu2">
                        <a class="dropdown-item" href="/logout">Wyloguj</a>
                        <a class="dropdown-item" href="#">Aktualizuj dane</a>
                    </div>
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
                    <h1 class="h2">Klienci</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="pr-5"><a type="button" class="btn form-control btn-outline-secondary "
                                                    href="#">Dodaj pacjenta</a></li>
                                <li class="active"><a type="button" class="btn form-control btn-outline-secondary active"
                                                      href="#all" role="tab"
                                                      data-toggle="tab" >Wszyscy</a></li>
                                <li><a type="button" class="btn form-control btn-outline-secondary" href="#approval"
                                       role="tab"
                                       data-toggle="tab">Do zatwierdzenia</a></li>
                                <li><input class="form-control" id="myInput" type="text" placeholder="Search" aria-label="Search"></li>
                            </ul>

                        </div>

                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="all">
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>PESEL</th>
                                    <th>Ubezpieczenie</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody id="myTable">
                                <c:forEach items="${patients}" var="patient">
                                    <tr onclick="window.location='#';">

                                        <td>${patient.name}</td>
                                        <td>${patient.surname}</td>
                                        <td>${patient.pesel}</td>
                                        <c:if test="${patient.insurance==1}">
                                            <td>Ubezpieczony</td>
                                        </c:if>
                                        <c:if test="${patient.insurance==0}">
                                            <td>Nie ubezpieczony</td>
                                        </c:if>
                                        <c:if test="${patient.enabled==1}">
                                            <td>Aktywny</td>
                                        </c:if>
                                        <c:if test="${patient.enabled==0}">
                                            <td>Nie aktywny</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="approval">
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>PESEL</th>
                                    <th>Ubezpieczenie</th>
                                    <th>Status</th>
                                </tr>
                                </thead>

                                <tbody id="Table">
                                <c:forEach items="${approval}" var="patient">
                                    <tr onclick="window.location='#';">
                                        <td>${patient.name}</td>
                                        <td>${patient.surname}</td>
                                        <td>${patient.pesel}</td>
                                        <c:if test="${patient.insurance==1}">
                                            <td>Ubezpieczony</td>
                                        </c:if>
                                        <c:if test="${patient.insurance==0}">
                                            <td>Nie ubezpieczony</td>
                                        </c:if>
                                        <c:if test="${patient.enabled==1}">
                                            <td>Aktywny</td>
                                        </c:if>
                                        <c:if test="${patient.enabled==0}">
                                            <td>Nie aktywny</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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