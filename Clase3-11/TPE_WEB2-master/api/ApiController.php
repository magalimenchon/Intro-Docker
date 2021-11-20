<?php

require_once './model/CommentModel.php';
require_once 'ApiView.php';

class ApiController{
    
    private $model;
    private $view;
    private $data; 

    function __construct(){
        $this->model = new CommentModel();
        $this->view = new ApiView();
        $this->data = file_get_contents("php://input"); 
    }

    function getData(){ 
        return json_decode($this->data); 
    }

    function getComment($params = null){
        $id = $params[':ID'];
        $data = $this->model->getComment($id);

        if ($data)
            $this->view->response($data, 200);
        else
            $this->view->response("Comentario con id: $id no existe", 404);
    }

    function getComments(){
        $data = $this->model->getComments();
        $this->view->response($data, 200);
    }

    function getCommentsByFlatId($params = null){
        $flatId = $params[':ID'];
        $data = $this->model->getCommentByFlatId($flatId);

        if ($data || sizeof($data) == 0)
            $this->view->response($data, 200);
        else 
            $this->view->response($data, 404);
        
    }

    function postComment(){

        $body = $this->getData();

        if(empty($body->texto) || empty($body->puntaje) || empty($body->id_usuario_fk) ||
            empty($body->id_depto_fk)){

            $this->view->response("Complete todos los campos", 400);
        }
        else{
            $comment = $this->model->postComment($body->texto, $body->puntaje,
                $body->id_usuario_fk, $body->id_depto_fk);

            $body->id_comentario = $comment;

            if ($comment)
                $this->view->response($body, 201);
            else
                $this->view->response("El comentario no se pudo crear", 404);
        }     
    }

    function deleteComment($params = null){
        $commentId = $params[':ID'];
        $result = $this->model->deleteComment($commentId);

        if($result > 0)
            $this->view->response($result, 200);
        else
            $this->view->response("Comentario Id: $commentId No Existe!", 404);
    }
}