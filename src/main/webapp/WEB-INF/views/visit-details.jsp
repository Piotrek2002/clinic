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
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">${visit.patientProfile.name} ${visit.patientProfile.surname}</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group mr-2">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="pl-5"><button class="btn form-control btn-outline-secondary" data-toggle="modal"
                                                         data-target="#myModal${visit.patientProfile.id}">Usuń wizytę
                                </button></li>
                                <li class="pl-5"><a type="button" class="btn form-control btn-outline-secondary" href="/visit/edit/${visit.id}">Edytuj wizytę
                                </a></li>
                                <c:if test="${visit.status==0}">
                                <li class="pl-5"><a type="button" class="btn form-control btn-outline-secondary" href="/visit/completed/${visit.id}">Oznacz jako zrobione
                                </a></li></c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Potwierdzenie -->
                <div class="modal fade" id="myModal${visit.patientProfile.id}" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Weryfikacja usuwania (${visit.patientProfile.name} ${visit.patientProfile.surname})</h4>
                            </div>
                            <div class="modal-body">
                                Czy napewno chcesz usunąć tą wizytę?
                            </div>
                            <div class="modal-footer">
                                <a href="#" type="button" class="btn btn-default"
                                   data-dismiss="modal">wyjdź
                                </a>
                                <a href="/visit/delete/${visit.id}" type="button"
                                   class="btn btn-primary">Usuń</a>
                            </div>
                        </div> <!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <div class="schedules-content">
                    <div class="schedules-content-header">
                        <div class="form-group row mb-2">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Pacjent
                            </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">${visit.patientProfile.name} ${visit.patientProfile.surname}</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Lekarz
                                </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">${user.name} ${user.surname}</p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Data
                            </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">
                                    ${visit.date}
                                </p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                    Cena
                            </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">
                                    ${visit.price}
                                </p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <span class="col-sm-3 col-lg-2 label-size col-form-label">
                                   Opis wizyty
                            </span>
                            <div class="col-sm-9 col-lg-10">
                                <p class="schedules-text">${visit.description}</p>
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