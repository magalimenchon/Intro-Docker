<?php

class AuthHelper
{

    public function __construct()
    {
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
        }
    }

    //Verifica si hay una sesión activa
    function isLoggedIn()
    {
        if (isset($_SESSION['USER'])) {
            return $_SESSION;
        } else {
            return false;
        }
    }

    //Checkea roles y asigna valores -> admin = 0, user comun = 1, sesion no iniciada = 2.
    function checkLoggedSession()
    {
        if ($this->isLoggedIn()) {
            if ($_SESSION['ROLE'] == 0) {
                return 0;
            } else
                return 1;
        } else
            return 2;
    }

    //Almacena los datos del usuario logueado en la sesión
    function login($user)
    {
        $_SESSION['ID'] = $user->id_usuario;
        $_SESSION['USER'] = $user->email;
        $_SESSION['ROLE'] = $user->rol;
    }

    //Destruye la sesión y redirige a ShowCities
    function logout()
    {
        session_destroy();
        header("Location: " . BASE_URL . "showCities");
    }
}
