<?php

require_once "./libs/smarty/Smarty.class.php";

class FlatView
{
    private $smarty;

    function __construct()
    {
        $this->smarty = new Smarty();
    }

    function ShowFlats($flats, $cities, $sessionUser, $totalPages = null, $city)
    {
        $this->smarty->assign('flats', $flats);
        $this->smarty->assign('cities', $cities);
        $this->smarty->assign('sessionUser', $sessionUser);
        $this->smarty->assign('totalPages', $totalPages);

        $this->smarty->assign('city', $city);
    
        $this->smarty->display('templates/flats.tpl');
    }

    function ShowFlat($flat, $city, $sessionUser, $images = null)
    {
        $this->smarty->assign('flat', $flat);
        $this->smarty->assign('city', $city);
        $this->smarty->assign('sessionUser', $sessionUser);
        $this->smarty->assign('images', $images);
    
        $this->smarty->display('templates/flat.tpl');
    }

    function ShowError($cities, $errorMessaje, $sessionUser, $id_flat = null)
    {
        $this->smarty->assign('errorMessaje', $errorMessaje);
        $this->smarty->assign('cities', $cities);
        $this->smarty->assign('sessionUser', $sessionUser);
        $this->smarty->assign('id_flat', $id_flat);

        $this->smarty->display('templates/flats.tpl');
    }

    //muestra -> modificacion
    function ShowEditFlat($flat, $cities, $images, $sessionUser)
    {
        $this->smarty->assign('flat', $flat);
        $this->smarty->assign('cities', $cities);
        $this->smarty->assign('sessionUser', $sessionUser);
        $this->smarty->assign('images', $images);

        $this->smarty->display('templates/editFlat.tpl');
    }

    function ShowFlatsLocation()
    {
        header("Location: " . BASE_URL . "showFlats");
    }

    function ShowFlatLocation($id)
    {
        header("Location: " . BASE_URL . "flat/". $id);
    }

    function ShowFlatEditLocation($id)
    {
        header("Location: " . BASE_URL . "editFlat/". $id);
    }
}
