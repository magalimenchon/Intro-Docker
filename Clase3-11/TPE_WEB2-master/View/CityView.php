<?php

require_once "./libs/smarty/Smarty.class.php";

class CityView {

    private $smarty;
    
    function __construct(){
        $this->smarty = new Smarty();
    }

    function ShowHome($cities, $sessionUser){
        $this->smarty->assign('cities', $cities);
        $this->smarty->assign('sessionUser', $sessionUser);
        $this->smarty->display('templates/cities.tpl');
    }
    
    function ShowEditCity($city, $sessionUser){
        $this->smarty->assign('city', $city);
        $this->smarty->assign('sessionUser', $sessionUser);
        
        $this->smarty->display('templates/editCity.tpl');
    }

    function ShowError($errorMessaje, $sessionUser){
        $this->smarty->assign('errorMessaje', $errorMessaje);
        $this->smarty->assign('sessionUser', $sessionUser);
       
        $this->smarty->display('templates/cities.tpl');
    }

    function ShowCitiesLocation(){
        header("Location: ".BASE_URL."showCities");
    }
   
}


