<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="{BASE_URL}">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="css\style.css">
    <title>AirBnB</title>
</head>

<body class="h-100">
    <div class="container-fluid">
        <div class="row justify-content-between">
            <div>
                <img class="img-fluid" src="images\header-Airbnb.jpg" alt="header-Airbnb">
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="collapse navbar-collapse justify-content-between">
            <div class="input-group-append">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="showCities">Ciudades</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="showFlats">Departamentos</a>
                    </li>
                </ul>
            </div>
            <div class="input-group-prepend">
                {if $sessionUser eq false}
                    <div class="row">
                        <div class="col">
                            <a href="login"><button type="button" class="btn btn-danger" 
                                    id="btn-color">Login</button></a>
                        </div>
                        <div class="col">
                            <a href="signUp"><button type="button" class="btn btn-danger"
                                    id="btn-color">Registrate</button></a>
                        </div>
                    </div>
                {else}
                    <div class="row">
                        <div class="col">
                            <h6>Usuario: {$sessionUser['USER']}</h6>
                        </div>
                        {if $sessionUser eq true && $sessionUser['ROLE'] eq 0}
                            <div class="col">
                                <a href="admin"><button type="button" class="btn btn-danger"
                                    id="btn-color">Administración</button></a>
                            </div>
                        {/if}
                        <div class="col">
                            <a href="logout"><button type="button" class="btn btn-danger" 
                                id="btn-color">Logout</button></a>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </nav>