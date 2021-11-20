<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="{BASE_URL}">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css\style.css">
    <title>{$title}</title>
</head>
<body class="h-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col"></div>
            <div class="col align-self-center bg-light" id="login-div">
                <img class="img-fluid" src="images\header-Airbnb.jpg" alt="header-Airbnb">
                <form action="insertUser" method="POST" class="login">
                    <div>
                        <h1>{$title}</h1>
                    </div>
                    <hr>
                    <div class="form-group">
                        <input class="form-control" id="user" name="input_user" aria-describedby="emailHelp"
                            placeholder="Email">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pass" name="input_pass"
                            placeholder="Contraseña">
                    </div>
                    <button type="submit" class="btn btn-danger col-md-4 offset-md-4" 
                            id="btn-color" >Registrarte</button>
                </form>
                {if $message neq false}
                    <div class="alert alert-danger" id="alert" role="alert">
                        {$message}
                    </div>
                {/if}
                <div>
                    <h6><a href="showCities" class="text-dark">Volver</a></h6>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>

{include file="footer.tpl"}