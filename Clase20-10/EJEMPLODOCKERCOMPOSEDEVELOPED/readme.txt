en el Dockerfile:
se especifican una serie de instrucciones
que se van ejecutando para construir
una imagen de docker personalizada.
En este caso:
- basamos la imagen de php con apache
- copiamos el proyecto desde
        el <.> referencia la carpeta local donde se esta
        destino: es una carpeta dentro del contenedor:
                </var/www/html/> (donde apache sirve los archivos que
                                  queremos acceder por request del navegador)

--paso 2:
    ejecutar:
        <docker build .>    //Desde la terminal de vs code o desde la url donde esta el Dockerfile,
                            //para ejecutar las instrucciones que contiene.
        <docker images>
        <docker run -p 80:80 27690786761a<===nombreImagenConstruida>>
        abrimos localhost y cada vez que se hace un request, deberia mostrar el <p> de Hello World

--mas comandos:
    ejecutar:
        <docker exec -it <===idContenedorQueEstaCorriendo> bash>
                            //Ejecuta un comando dentro del contenedor que esta corriendo:
                            //En este caso ejecuta el comando bash, que es abrir la terminal

        Para borrar cosas, (con espacio puedo borrar varias a la vez):
        <docker rm <idContenedor>>
        <docker rmi <idImagen>>

Apuntes:
    <docker build .> Crea una imagen (template) de docker segun las especificaciones del Dockerfile
    //En la de este archivo: se creó luego de ejecutar el comando una imagen que tiene:
            //Un servidor apache con el modulo de php
            //Y tiene una copia de los archivos donde estoy parada adentro de var/www/html
    <docker images> Se puede ver la imagen creada con tag <none> y otra de php
    <docker run -p 80:80 <idDelaImagenNone>> Se crea el contenedor en base a la imagen (template) que tiene:
            //Un servidor apache con el modulo de php
            //Y tiene una copia de los archivos donde estoy parada adentro de var/www/html
    
DOCKER-COMPOSE:
Es un archivo yml que especifica los servicios que se quiere que docker levante (Esto es para
evitar hacer un run por cada servicio, por ejemplo si se quiere usar apache con mysql a la vez, etc)
Todas las especificaciones que se hacen con el build o run se pueden especificar con el docker-compose.

en vez de ejecutar por linea de comandos, se realiza todo mediante el archivo de configuracion:
(ejemplo de docker-compose de carpeta EJEMPLODOCKERCOMPOSEMYSQL)
     * el mapeo de puertos:
                ports: - "3306:3306"
     * la variable de ambiente para la password para iniciar el contenedor correctamente:
                enviroment: - MYSQL_ROOT_PASSWORD=root
     * el nombre que quiera ponerle al servicio:
                services:  mysql:
     * en que imagen se basa ese servicio (contenedor a crear):
                image: mysql
     * para especificarle el nombre del contenedor:
                mysql:  image: mysql  container_name: seminario_mysql

El docker compose cada vez que hago up de un determinado archivo vuelve a levantar los mismos
contenedores, no crea nuevos.
COMANDOS:
    ejecutar en donde esta el archivo docker-compose:
        <docker-compose up>
                    //Lee la especificacion del docker compose y crea los contenedores necesarios

ACLARACION: si falla el archivo cambiarle la version de la especificación del
docker-compose a version:"2.2"

PARA AGREGAR MAS SERVICIOS: (docker-compose de esta carpeta)
en services:
  web:
    build: .
    ports:
      - "80:80"
//Va a levantar un servicio web que lo va a construir con <build .> buscando el Dockerfile en mi
carpeta actual, lo ejecuta, crea una imagen, crea un contenedor con esa imagen que recien se contruyó,
con el mapeo de puertos para crear el contenedor.
Se usa el mismo comando:
    ejecutar:
        <docker-compose up>
                //Cuando se ejecuta:
                1) Detecta lo del dockerfile
                - Carga una definicion del Dockerfile, porque intenta levantar el servicio web Y
                  se aclaro que lo haga por un build, y no una imagen pre-armada.
                - Detecta que el dockerfile es de php:7.2-apache
                - hace el COPY del dockerfile (= procedimiento al dockerfile solo)
                2) Crea los contenedor especificados en el docker-compose
                - Crea un contenedor de apache-web
                - Crea un contenedor de mysql

ACLARACION: esto es funcional para la situación en la que ya tengo la app terminada, pero
            en caso de querer modificarla, es incomodo tener que recontruir la imagen
            cada vez que se hace una modificación.

REEMPLAZAR XAMPP CON EL DOCKER-COMPOSE
QUE LEVANTE UN SERVIDOR APACHE Y UN MYSQL
SIN TENER QUE RECONTRUIR EL CONTENEDOR Y LA IMAGEN
CADA VEZ QUE LE HAGO UNA MODIFICACIÓN EN EL PROYECTO:

(Ejemplo en la carpeta EJEMPLODOCKERCOMPOSECOMPLETO)

Igual a como antes:
    services:
      web:
        build: .  //indico q genera una imagen basada en el dockerfile
        ports:    //mapeo de puertos
          - "80:80"
Concepto de volumes:
    * No es especifico de docker-compose. Se puede pasar tmb al docker run por linea de comandos.
    * Mapea una carpeta local a una carpeta dentro del contenedor o imagen.
    * Indica que cuando se crea esa imagen y se crea un contenedor basado en ésta,
      que mapee la carpeta <.> (donde estoy parada) en la carpeta del contenedor /var/www/html/

      - Los archivos que van a estar dentro de /var/www/html/ o cada vez que el contenedor
        quiera acceder a los archivos dentro de esta carpeta (dentro del contenedor)
        va a estar accediendo en realidad a los archivos que tengo en <.> (como si fuera
        un link o acceso directo)

      - Si se modifica algo dentro de <.>, cuando el servidor apache busca a /var/www/html/
        levanta automáticamente lo que está en <.> sin tener que reconstruir la imagen o
        reinstanciar el contenedor.

Se ejecuta con:
      <docker-compose up>

DATO: Hay imagen de phpMyAdmin en docker.
(ver docker-compose de EJEMPLODOCKERCOMPOSEMYSQL)
buscar en el navegador la url: localhost:8080
para reemplazar lo de web, ver en ese archivo.


      








        




        
        

