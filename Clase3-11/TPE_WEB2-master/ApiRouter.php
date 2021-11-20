<?php

    require_once 'RouterClass.php';
    require_once './api/ApiController.php';

    $r = new Router();


    // ******************* API RUTAS ***************************


    $r->addRoute('comments', 'GET', 'ApiController', 'getComments');
    $r->addRoute('comments/:ID', 'GET', 'ApiController', 'getComment');
    
    $r->addRoute('flatComments/:ID', 'GET', 'ApiController', 'getCommentsByFlatId');
    $r->addRoute('comments', 'POST', 'ApiController', 'postComment');
    $r->addRoute('comments/:ID', 'DELETE', 'ApiController', 'deleteComment'); 


    //******************* API RUN ***************************
    $r->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);