<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Clinic</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">

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
    <link href="/carousel.css" rel="stylesheet">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark ">
        <a class="navbar-brand" href="/">Przychodnia</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/">Start<span class="sr-only">(current)</span></a>
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

<main role="main">

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/image/zdj1.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></img>
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Wysoka jakość na europejskim poziomie!</h1>
                        <p>Przychodnia oferuje najnowsze techniki wykonywanych badań, rehabilitacji, diagnostyki i leczenia.</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/image/zdj2.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></img>
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Profesjonalne świadczenia dla Pacjenta</h1>
                        <p>Szczegółowy wywiad, historia zdrowia i choroby.</p>
                        </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/image/zdj3.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></img>
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Etapy realizowanych świadczeń</h1>
                        <p>Badania laboratoryjne, badania fizykalne i diagnoza lekarska.</p>
                        </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <img src="/image/zdj4.jpg" class="bd-placeholder-img rounded-circle" width="140" height="140" ><rect width="100%" height="100%" fill="#777"/></img>
                <h2>Pobieranie materiału do badań</h2>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="/image/zdj5.jpg" class="bd-placeholder-img rounded-circle" width="140" height="140" ><rect width="100%" height="100%" fill="#777"/></img>
                <h2>Badanie osłuchowe stetoskopem Pacjenta.</h2>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="/image/zdj6.jpg" class="bd-placeholder-img rounded-circle" width="140" height="140" ><rect width="100%" height="100%" fill="#777"/></img>
                <h2>Postawiona diagnoza Pacjenta - schorzenie obrazujące jego rodzaj i zakres.</h2>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading"> Leczenie w danej jednostce chorobowej</h2>
                <p class="lead">
                    - Zalecenia lekarza względem farmakologii i etapów leczenia;</p>
                <p class="lead">
                    - Zastosowanie odpowiedniego leczenia: farmakologia, inne środki lecznicze, wlewy dożylne, inhalacje;</p>
                <p class="lead">
                    - Kolejna wizyta lekarska, celem weryfikacji stanu zdrowia Pacjenta;</p>
                <p class="lead">
                    - Leczenie uzupełniające;</p>
                <p class="lead">
                    - Rehabilitacja;</p>
                <p class="lead">
                    - Kontrolne badania;</p>
            </div>
            <div class="col-md-5">
                <img src="/image/zdj7.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><rect width="100%" height="100%" fill="#eee"/></img>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">Promocja zdrowia</h2>
                <p class="lead">Definicja zdrowia wg Światowej Organizacji Zdrowia (WHO) ukazuje zdrowie w pozytywnym świetle: „zdrowie jest stanem pełnego/całkowitego dobrego samopoczucia/dobrostanu (ang. wellbeing) fizycznego, psychicznego i społecznego, a nie tylko jej brakiem – obiektywnie istniejącej – choroby.
                </p>
            </div>
            <div class="col-md-5">
                <img src="/image/zdj8.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><rect width="100%" height="100%" fill="#eee"/></img>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Profilaktyka zdrowia</h2>
                <p class="lead">Profilaktyka zdrowotna – działania mające na celu zapobieganie chorobom, poprzez ich wczesne wykrycie i leczenie. Wyróżniamy następujące fazy: profilaktyka wczesna – utrwalanie prawidłowych wzorców zdrowego stylu życia. profilaktyka pierwotna (I fazy) – zapobieganie chorobom poprzez kontrolowanie czynników ryzyka.</p>
            </div>
            <div class="col-md-5">
                <img src="/image/zdj9.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><rect width="100%" height="100%" fill="#eee"/></img>
            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

    </div><!-- /.container -->


    <!-- FOOTER -->
    <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy; 2017-2020 Company, Inc. &middot;</p>
    </footer>
</main>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>