<?php
require_once './Model/ImageModel.php';
require_once './View/FlatView.php';
require_once './helpers/AuthHelper.php';
require_once './View/UserView.php';

class ImageController
{
    private $model;
    private $viewFlat;
    private $authHelper;
    private $viewUser;

    public function __construct()
    {
        $this->model = new ImageModel();
        $this->viewFlat = new FlatView();
        $this->authHelper = new AuthHelper();
        $this->viewUser = new UserView();
    }

    //alta
    function insertImages($tmp_images, $id_flat)
    {
        $logged = $this->authHelper->isLoggedIn(); 
        $role = $this->authHelper->checkLoggedSession();
        if ($logged && $role == 0) {
            $types_images = $_FILES['imagesToUpload']['type'];

            if ($this->areType($types_images)) {
                $name_images = $_FILES['imagesToUpload']['name'];
                $paths = $this->uploadImages($tmp_images, $name_images);
                $this->model->insertImages($id_flat, $paths);
                $this->viewFlat->showFlatLocation($id_flat);
            } else {
                $this->viewUser->renderError("Las imágenes deben ser JPG, JPEG o PNG. Intente nuevamente.");
            }
        } else {
            $this->viewUser->RenderError("Debe ser administrador para acceder a esta sección.");
        }
    }

    //ALTA -> Checkea si todas las imagenes para subir son del tipo correspondiente
    private function areType($typeImages)
    {
        foreach ($typeImages as $type) {
            if (!($type == 'image/jpeg' || $type == 'image/jpg' || $type == 'image/png'))
                return false;
        }
        return true;
    }

    //ALTA->genera las rutas para cada imagen
    private function uploadImages($tmp_images, $name_images)
    {
        $paths = [];

        for($i = 0; $i < count($tmp_images); $i++){
            $tmp_image = $tmp_images[$i];
            $name_image = $name_images[$i];
            $final_path = 'images/temp/' . uniqid() . "." 
            . strtolower(pathinfo($name_image, PATHINFO_EXTENSION));
            move_uploaded_file($tmp_image, $final_path);
            $paths[] = $final_path;
        }
        return $paths;
    }

    //baja
    function deleteImage($params = null)
    {
        $logged = $this->authHelper->isLoggedIn();
        $role = $this->authHelper->checkLoggedSession();
        if ($logged && $role == 0) {
            $id = $params[':ID'];
            $image = $this->model->getImage($id);
            if ($image) {
                $this->model->deleteImage($id);
                $this->viewFlat->showFlatEditLocation($image->id_departamento_fk);
            } else
                $this->viewUser->RenderError("No existe esta imagen en la base de datos para ser eliminada.");
        } else
            $this->viewUser->RenderError("Debe ser administrador para acceder a esta sección.");
    }
}
