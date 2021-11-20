<?php
    require_once './RouterClass.php';
    require_once './Controller/FlatController.php';
    require_once './Controller/CityController.php';
    require_once './Controller/UserController.php';
    require_once './Controller/ImageController.php';
    
    // CONSTANTES PARA RUTEO
    define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');
    define("LOGIN", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/login');
    define("LOGOUT", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/logout');

    $r = new Router();

    // ******************* RUTAS ***************************

    //default
    $r->setDefaultRoute("CityController", "showCities");
   
    $r->addRoute("showCities", "GET", "CityController", "showCities");
    $r->addRoute("showFlats/:PAGE", "GET", "FlatController", "showFlats");
    $r->addRoute("showFlats", "GET", "FlatController", "showFlats");

    $r->addRoute("deleteCity/:ID", "GET", "CityController", "deleteCity");
    $r->addRoute("deleteFlat/:ID", "GET", "FlatController", "deleteFlat");

    $r->addRoute("editCity", "POST", "CityController", "updateCity");
    $r->addRoute("editFlat", "POST", "FlatController", "updateFlat");

    $r->addRoute("editCity/:ID", "GET", "CityController", "editCity");
    $r->addRoute("editFlat/:ID", "GET", "FlatController", "editFlat");

    $r->addRoute("insertCity", "POST", "CityController", "insertCity");
    $r->addRoute("insertFlat", "POST", "FlatController", "insertFlat");

    $r->addRoute("city/:NAME", "GET", "FlatController", "filterFlatsByCity");
    $r->addRoute("city/:NAME/:PAGE", "GET", "FlatController", "filterFlatsByCity");

    $r->addRoute("flat/:ID", "GET", "FlatController", "showFlat");

    $r->addRoute("login", "GET", "UserController", "showLogin");
    $r->addRoute("verifyUser", "POST", "UserController", "verifyUser");
    $r->addRoute("logout", "GET", "AuthHelper", "logout");
    $r->addRoute("signUp", "GET", "UserController", "showSignUp");

    $r->addRoute("admin", "GET", "UserController", "showUsers");
    $r->addRoute("insertUser", "POST", "UserController", "insertUser");
    $r->addRoute("deleteUser/:ID", "GET", "UserController", "deleteUser");
    $r->addRoute("updateUserRole/:ID", "GET", "UserController", "updateUserRole");

    $r->addRoute("deleteImage/:ID", "GET", "ImageController", "deleteImage");


    //******************* RUN ***************************
    $r->route($_GET['action'], $_SERVER['REQUEST_METHOD']); 
?>
