en el Dockerfile:
se especifican una serie de instrucciones
que se van ejecutando para construir
una imagen de docker personalizada.
En este caso:
- basamos la imagen con apache
- copiamos el proyecto desde
        el <.> referencia la carpeta local donde se esta
        destino: es una carpeta dentro del contenedor:
                </var/www/html/> (donde apache sirve los archivos que
                                  queremos acceder por request del navegador)

--paso 2:
    ejecutar:
        <docker build .>    //Desde la terminal de vs code o desde la url donde esta el Dockerfile.
        <docker images>
        <docker run -p 80:80 27690786761a<===nombreImagenConstruida>>
    habrimos localhost y cada vez que se hace un request, deberia mostrar el p

