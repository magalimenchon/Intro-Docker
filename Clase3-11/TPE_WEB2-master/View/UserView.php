<?php

require_once "./libs/smarty/Smarty.class.php";

class UserView
{

    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function ShowLogin($message = "")
    {
        $this->smarty->assign('title', "Login");
        $this->smarty->assign('message', $message);

        $this->smarty->display('templates/login.tpl');
    }

    function RenderError($message)
    {
        $this->smarty->assign('title', "Error");
        $this->smarty->assign('message', $message);

        $this->smarty->display('templates/error.tpl');
    }

    function ShowSignUp($message = "")
    {
        $this->smarty->assign('title', "Sign Up");
        $this->smarty->assign('message', $message);

        $this->smarty->display('templates/signUp.tpl');
    }

    function ShowUsers($users, $sessionUser)
    {
        $this->smarty->assign('title', "Administración de usuarios");
        $this->smarty->assign('users', $users);
        $this->smarty->assign('sessionUser', $sessionUser);

        $this->smarty->display('templates/users.tpl');
    }

    function ShowUsersLocation(){
        header("Location: ".BASE_URL."admin");
    }
}
