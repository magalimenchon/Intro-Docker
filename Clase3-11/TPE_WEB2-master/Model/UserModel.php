<?php

class UserModel {

    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_airbnb;charset=utf8', 'root', '');
    }

    //Obtiene todos los usuarios
    function getUsers(){
        $query = $this->db->prepare('SELECT * FROM usuario');
        $query->execute();
        return  $query->fetchAll(PDO::FETCH_OBJ);
    }

    //Obtiene un usuario según un determinado mail
    function getUser($user){
        $query = $this->db->prepare('SELECT * FROM usuario WHERE email=?');
        $query->execute(array($user));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    //Obtiene un usuario por id
    function getUserById($id){
        $query = $this->db->prepare('SELECT * FROM usuario WHERE id_usuario=?');
        $query->execute(array($id));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    //alta
    function createUser($user, $password_hash, $role){
        $query = $this->db->prepare('INSERT INTO usuario(email, clave, rol) VALUES(?,?,?)');
        $query->execute(array($user, $password_hash, $role));
    }

    //baja
    function deleteUser($id_user){
        $query = $this->db->prepare("DELETE FROM usuario WHERE id_usuario=?");
        $query->execute(array($id_user));
    }

    //modificación
    function updateUserRole($id_user, $role){
        $query = $this->db->prepare("UPDATE usuario SET rol=? WHERE id_usuario=?");
        $query->execute(array($role, $id_user));
    }
}