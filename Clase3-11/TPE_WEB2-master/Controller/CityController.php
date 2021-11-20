<?php

require_once './View/CityView.php';
require_once './Model/CityModel.php';
require_once './helpers/AuthHelper.php';
require_once './View/UserView.php';

class CityController
{

    private $model;
    private $view;
    private $authHelper;
    private $viewUser;

    public function __construct()
    {
        $this->view = new CityView();
        $this->model = new CityModel();

        $this->authHelper = new AuthHelper();
        $this->viewUser = new UserView();
    }

    //muestra todas las ciudades
    function showCities()
    {
        $logged = $this->authHelper->isLoggedIn();

        $cities = $this->model->getCities();
        $this->view->ShowHome($cities, $logged);
    }

    //alta
    function insertCity()
    {
        $logged = $this->authHelper->isLoggedIn();

        $name = $_POST['input_name'];
        if (isset($name) && !empty($name)) {
            if ($this->alreadyLoaded($name) === false) {
                $this->model->insertCity($name);
                $this->view->showCitiesLocation();
            } else {
                $errorMessaje = "Esta ciudad ya existe en la base de datos.";
                $this->view->ShowError($errorMessaje, $logged);
            }
        } else
            $this->viewUser->RenderError("Debe completar todos los campos del formulario");
    }

    //ALTA -> Checkea si existe la ciudad en la db
    private function alreadyLoaded($name)
    {
        $cities = $this->model->getCities();
        $exist = false;
        foreach ($cities as $city) {
            if ($city->nombre === $name) {
                $exist = true;
            }
        }
        return $exist;
    }

    //baja
    function deleteCity($params = null)
    {
        $logged = $this->authHelper->isLoggedIn();
        $role = $this->authHelper->checkLoggedSession();
        if ($logged && $role == 0) {
            $id = $params[':ID'];
            $result = $this->model->deleteCity($id);
            if ($result > 0)
                $this->view->showCitiesLocation();
            else {
                $errorMessaje = "Debe eliminar los departamentos asociados a esta ciudad primero.";
                $this->view->ShowError($errorMessaje, $logged);
            }
        } else
            $this->viewUser->RenderError("Debe ser administrador para acceder a esta sección.");
    }

    //redireccion -> para modificacion
    function editCity($params = null)
    {
        $logged = $this->authHelper->isLoggedIn();
        $role = $this->authHelper->checkLoggedSession();
        $id_city = $params[':ID'];
        $city = $this->model->getCityById($id_city);

        if ($logged && $role == 0) {
            if ($city) {    //checkea si obtuvo un objeto no vacío de la db
                $this->view->ShowEditCity($city, $logged);
            } else
                $this->viewUser->RenderError("No existe id en la base de datos");
        } else
        $this->viewUser->RenderError("Debe ser administrador para acceder a esta sección.");
    }

    //modificación
    function updateCity()
    {
        $logged = $this->authHelper->isLoggedIn();
        $id = $_POST['input_edit_id'];
        $name = $_POST['input_edit_name'];
        if ((isset($name) && !empty($name))) {
            if ($this->alreadyLoaded($name) === false) {
                $this->model->updateCity($id, $name);
                $this->view->showCitiesLocation();
            } else {
                $errorMessaje = "Esta ciudad ya existe en la base de datos. Intente nuevamente";
                $this->view->ShowError($errorMessaje, $logged);
            }
        } else
            $this->viewUser->RenderError("Debe completar todos los campos del formulario");
    }
}
