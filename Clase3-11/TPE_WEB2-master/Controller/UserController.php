<?php

require_once './View/UserView.php';
require_once './Model/UserModel.php';
require_once './View/CityView.php';
require_once './helpers/AuthHelper.php';

class UserController
{
    private $view;
    private $viewCity;
    private $model;

    function __construct()
    {
        $this->view = new UserView();
        $this->viewCity = new CityView();
        $this->model = new UserModel();
        $this->authHelper = new AuthHelper();
    }

    //muestra login
    function showLogin()
    {
        $this->view->ShowLogin();
    }

    //verifica si los datos ingresados corresponde a un usuario de la db
    function verifyUser()
    {
        $user = $_POST["input_user"];
        $pass = $_POST["input_pass"];

        if (isset($user)) {
            $userFromDB = $this->model->getUser($user);

            if (isset($userFromDB) && $userFromDB) {

                if (password_verify($pass, $userFromDB->clave)) {
                    $this->authHelper->login($userFromDB);
                    $this->viewCity->ShowCitiesLocation();
                } else
                    $this->view->ShowLogin("Contraseña incorrecta");
            } else
                $this->view->ShowLogin("El usuario no existe");
        }
    }

    //muestra registración
    function showSignUp()
    {
        $this->view->showSignUp();
    }

    //alta
    function insertUser()
    {
        $user = $_POST['input_user'];
        $password = $_POST['input_pass'];
        $role = 1;

        if (isset($user) && !empty($user) && isset($password) && !empty($password)) {
            if ($this->alreadyLoaded($user) === false) {
                $password_hash = password_hash($password, PASSWORD_DEFAULT);
                $this->model->createUser($user, $password_hash, $role);
                $this->verifyUser();
            } else
                $this->view->ShowSignUp("El usuario ya existe");
        } else
            $this->view->ShowSignUp("Complete todos los campos");
    }

    //ALTA -> Checkea si existe el mail en la db
    private function alreadyLoaded($email)
    {
        $users = $this->model->getUsers();
        foreach ($users as $user) {
            if ($user->email === $email) {
                return true;
            }
        }
        return false;
    }

    function showUsers()
    {
        $logged = $this->authHelper->isLoggedIn();
        $roleUser = $this->authHelper->checkLoggedSession();

        if ($logged && $roleUser == 0) {
            $users = $this->model->getUsers();
            $this->view->ShowUsers($users, $logged);
        } else
            $this->view->RenderError("Debe ser usuario administrador para acceder a esta sección.");
    }

    function deleteUser($params = null)
    {
        $logged = $this->authHelper->isLoggedIn(); 
        $roleUser = $this->authHelper->checkLoggedSession();

        if ($logged && $roleUser == 0) {
            $id = $params[':ID'];
            $user = $this->model->getUserById($id);
            if ($user) {
                if ($logged['USER'] !== $user->email) {   //Es un posible usuario a eliminar
                    $this->model->deleteUser($id);
                    $this->view->showUsersLocation();
                } else    //Es el mismo administrador que inició sesión
                    $this->view->RenderError("No puede auto eliminarse.");
            } else
                $this->view->RenderError("No existe usuario en la base de datos para ser eliminado.");
        } else
            $this->view->RenderError("Debe ser usuario administrador para acceder a esta sección.");
    }

    function updateUserRole($params = null)
    {
        $logged = $this->authHelper->isLoggedIn();
        $roleUser = $this->authHelper->checkLoggedSession();

        if ($logged && $roleUser == 0) {
            $id = $params[':ID'];
            $user = $this->model->getUserById($id);
            if ($user) {
                if ($logged['USER'] !== $user->email) {   //Es un posible usuario a modificar
                    if ($user->rol == 1)
                        $user = $this->model->updateUserRole($id, 0);
                    else
                        $user = $this->model->updateUserRole($id, 1);
                    $this->view->showUsersLocation();
                } else    //Es el mismo administrador que inició sesión
                    $this->view->RenderError("No puede auto modificar su rol de administrador.");
            } else
                $this->view->RenderError("No existe usuario en la base de datos para modificar su rol.");
        } else {
            $this->view->RenderError("Debe ser usuario administrador para acceder a esta sección.");
        }
    }
}

