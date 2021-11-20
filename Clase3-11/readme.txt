REEMPLAZAR STACK DE WEB 2 (php, mysql, phpMyAdmin, etc) POR DOCKER:
    Docker reemplaza:
    - El ambiente de desarrollo.
    - Deployment solo con dockerfiles y docker-composes

DOCKERFILE:
contiene:

    FROM php:7.2-apache
            //creamos una imagen nueva basada en php apache
              (es decir, un servidor apache con un modulo php ya instalado)

    //comandos para dejar a php en condiciones de hostear la app
    RUN apt-get update
            //<apt>: es un sistema de paquetes para instalar aplicaciones dentro del sistema operativo
                     por ej: ubuntu, debian.
            //<update>: actualiza la lista de paquetes del sistema
            
    RUN docker-php-ext-install pdo pdo_mysql
            //<docker-php-ext-install>: comando que viene dentro de la imagen de php apache.
                                        Sirve para hacer instalaciones de extensiones de php
                                        dentro de la imagen.
            //las extensiones a instalar son:
            //<pdo>
            //<pdo_mysql>
            //Son clientes de BD de php, para que por medio de codigo php podamos conectarnos a la BD.
              (manejo de conexiones, etc)
    
    RUN a2enmod rewrite
            //comando para habilitar un modulo de rewrite dentro de php.
              Para que php pueda hacer la magia de redireccionar las rutas:
              Esto es el Router y depende a que ruta se le pegue, selecciona un controlador u otro.
            //<rewrite>: para que apache entienda que quien va a hacer el analisis
                         de las URLs va a ser el Router php y que está definido en el .htaccess.

    WORKDIR /var/www/html
            //directorio de trabajo donde va a estar sirviendo los archivos el apache,
              que es: /var/www/html

    
    
