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
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
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
                    <a class="nav-link" href="#">Pacjenci</a>
                </li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('ADMIN','USER')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="submenu1" aria-haspopup="true"> Zabiegi </a>

                    <div class="dropdown-menu" aria-labelledby="submenu1">
                        <a class="dropdown-item" href="#">Wszystkie</a>
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
                            <a class="dropdown-item" href="#">Pracownicy</a>
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
                    <h1 class="h2">Zabiegi</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="active"><a type="button" class="btn form-control btn-outline-secondary active"
                                                      href="#complete" role="tab"
                                                      data-toggle="tab">Zaplanowne</a></li>
                                <li><a type="button" class="btn form-control btn-outline-secondary" href="#tocomplete"
                                       role="tab"
                                       data-toggle="tab">Zrealizowne</a></li>
                                <li><input class="form-control" id="myInput" type="text" placeholder="Search" aria-label="Search"></li>
                            </ul>

                        </div>

                    </div>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="complete">
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th>Numer</th>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Cena</th>
                                    <th>Data</th>
                                </tr>
                                </thead>

                                <tbody id="myTable">
                                <c:forEach items="${ordersToComplete}" var="order">
                                    <tr onclick="window.location='/order/details/${order.id}';">
                                        <td>${order.id}</td>
                                        <td>${order.customer.name}</td>
                                        <td>${order.customer.surname}</td>
                                        <td>${order.price}</td>
                                        <td>${order.created.dayOfMonth}-${order.created.month}-${order.created.year}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane" id="tocomplete">
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th>Numer</th>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Cena</th>
                                    <th>Data</th>
                                </tr>
                                </thead>

                                <tbody id="Table">
                                <c:forEach items="${ordersToPay}" var="order">
                                    <tr onclick="window.location='/order/details/${order.id}';">
                                        <td>${order.id}</td>
                                        <td>${order.customer.name}</td>
                                        <td>${order.customer.surname}</td>
                                        <td>${order.price}</td>
                                        <td>${order.created.dayOfMonth}-${order.created.month}-${order.created.year}</td>
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
<%@include file="scripts.jsp"%>
<script src="dashboard.js">

</script>
</body>

</html>