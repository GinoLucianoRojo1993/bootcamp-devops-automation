# Objetivo

Automatizar CICD

# Problema

La empresa "ZeroTecnology" tiene la necesidad de comenzar a agilizar sus procesos de despliegue , actualmente solo cuentan con un ambiente "producción", como tool de CICD usan Jenkins y el deploy en  el servicio de AWS Elastic Beanstalk, pero como quieren seguir las buenas practicas, se ven en la necesidad de  habilitar un ambiente de desarrollo , porque suman un staff de desarrollo y QA, por lo que necesitan ver los cambios en otro ambiente y probar nuevas funcionalidades, entre tantas pruebas cada vez que suben cambios de develop a master tienen el inconveniente que siempre se pisa la configuracion de JENKINSFILE y se pisa los cambios en el mismo Servicio de AWS  en la misma cuenta, ademas que los recursos no estan tageados, no hay control "CAOS", entre tanta complicación, la empresa toma la iniciativa de contratar un equipo de devops que ayuden a automatizar las tareas de despliegues y normalizar el trabajo diario.

# Arquitectura

- Esquema de branching
![branching](https://raw.githubusercontent.com/roxsross/clase2-automation/master/arquitectura/Diagrama-despliegue-branching.png)
 
- Esquema de despliegue
![Despliegue](https://raw.githubusercontent.com/roxsross/clase2-automation/master/arquitectura/Diagrama-despliegue-propuesta.jpg)

# Solución

Diseñar unos scripts que permita reconocer el ambiente donde se quiere llevar los cambios y que permita que el CICD cumpla las buenas practicas y funcione con la tools Jenkins

# Manos a la obra


## Dockerizando un Node.js 

### Para construir la imagen de Docker

    $ docker build -t app-node .

### Para ver la imagen creada 🔩

    $ docker images

    # Example
    REPOSITORY   TAG             IMAGE ID       CREATED              SIZE
    app-node     latest          788c4df096da   About a minute ago   92.9MB

## Para correr la imagen

    $ docker run -d -p 3000:3000 app-node

## Correr de Forma teporal

    $ docker run -it -p 3000:3000 --rm app-node

## Y para ver el log de la imagen corriendo

    # Get container ID
    $ docker ps

    # Print app output
    $ docker logs <container id>

    # Example
    Running on http://localhost:3000

## Si necesitas ir dentro del contenedor usa:

    # Enter the container
    $ docker exec -it <container id> /bin/bash

## Para hacer Test

    $ docker ps

    # Example
    CONTAINER ID   IMAGE      COMMAND                  CREATED         STATUS         PORTS      NAMES
    8a3a40bb3139   app-node   "docker-entrypoint.s…"   3 minutes ago   Up 2 seconds   3000/tcp   app

## Para pinchar la app funcionando

    $ curl -i localhost:3000

    HTTP/1.1 200 OK
    X-Powered-By: Express
    Content-Type: text/html; charset=utf-8
    Content-Length: 12
    Date: Sun, 17 Feb 2022 03:53:22 GMT
    Connection: keep-alive

## O bien desde el navegador

    $ localhost:3000

## Si estas usando Docker en Mac OS o Windows reemplaza el localhost por la ip que da en un comienzo.


⌨️ con ❤️ por [roxsross](https://github.com/roxsross) 😊

No olvides revisar mi blog [roxsross](https://blog.295devops.com) 😊

y mi linktree [roxsross](https://roxs.295devops.com) 😊

"No se trata de cambiar el mundo, creo que creas un cambio pequeño, pero que te importe estás cambiando las cosas".