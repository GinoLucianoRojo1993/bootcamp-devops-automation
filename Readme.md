# Objetivo

Automatizar CICD

# Problema

La empresa "ZeroTecnology" tiene la necesidad de comenzar a agilizar sus procesos de despliegue , actualmente solo cuentan con un ambiente "producción", como tool de CICD usan Jenkins y el deploy en  el servicio de AWS Elastic Beanstalk, pero como quieren seguir las buenas practicas, se ven en la necesidad de  habilitar un ambiente de desarrollo , porque suman un staff de desarrollo y QA, por lo que necesitan ver los cambios en otro ambiente y probar nuevas funcionalidades, entre tantas pruebas cada vez que suben cambios de develop a master tienen el inconveniente que siempre se pisa la configuracion de JENKINSFILE y se pisa los cambios en el mismo Servicio de AWS  en la misma cuenta, ademas que los recursos no estan tageados, no hay control "CAOS", entre tanta complicación, la empresa toma la iniciativa de contratar un equipo de devops que ayuden a automatizar las tareas de despliegues y normalizar el trabajo diario.

# Arquitectura

- Esquema de branching

- Esquema de despliegue


# Solución

Diseñar unos scripts que permita reconocer el ambiente donde se quiere llevar los cambios y que permita que el CICD cumpla las buenas practicas y funcione con la tools Jenkins

# Manos a la obra

