<?php

class CityModel {

    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_airbnb;charset=utf8', 'root', '');
    }

    //Listado de categorías: Se debe poder visualizar todas las categorías
    function getCities() {
        $query = $this->db->prepare('SELECT * FROM ciudad');
        $query->execute();
        return  $query->fetchAll(PDO::FETCH_OBJ);
    }
    //Obtiene los datos de una ciudad en particular
    function getCityById($id_city){
        $query = $this->db->prepare('SELECT * FROM ciudad WHERE id_ciudad=?');
        $query->execute(array($id_city));
        return  $query->fetch(PDO::FETCH_OBJ);
    }

    //alta
    function insertCity($name) {
        $query = $this->db->prepare('INSERT INTO ciudad(nombre) VALUES(?)');
        $query->execute(array($name));
    }
    //baja
    function deleteCity($id) {
        $query = $this->db->prepare('DELETE FROM ciudad WHERE id_ciudad=?');
        $query->execute(array($id));
        return $query->rowCount();
    }
    //modificación
    function updateCity($id, $name) {
        $query = $this->db->prepare('UPDATE ciudad SET nombre=? WHERE id_ciudad=?');
        $query->execute(array($name, $id));
    }
}