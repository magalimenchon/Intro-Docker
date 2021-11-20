<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="{BASE_URL}">
    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <title>{$title}</title>
</head>

<body>
    <div class="container">

       <h1>{$title}</h1>
        
        <div class="alert alert-danger" id="alert" role="alert"> 
            {$message}
        </div>

        <div>
            <h6><a href="showCities" class="text-dark">Volver</a></h6>
        </div>

    </div>

    {include file="footer.tpl"}