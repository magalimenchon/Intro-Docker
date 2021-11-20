<?php

require_once 'ApiController.php';

// devuelve json
// maneja las respuestas
class ApiView{

    function response($data, $status){
        header("Content-Type: application/json");
        header("HTTP/1.1 " . $status . " " . $this->requestStatus($status));
        echo json_encode($data);
    }

    private function requestStatus($code) {
        $status = array(
          200 => "OK",
          201 => "Created",
          204 => "No Content",
          404 => "Not found",
          400 => "Bad Request",
          500 => "Internal Server Error"
        );
        return (isset($status[$code]))? $status[$code] : $status[500];
    }
}