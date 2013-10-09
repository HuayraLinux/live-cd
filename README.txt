Huayra GNU/Linux - Instalador en LiveCD
=======================================

* Para construir las imágenes de los instaladores y/o live-cd
  es necesario tener instalado los siguientes paquetes:

  live-build
  md5sum

* Opcionalmente, pero recomendado:

  apt-cacher
  sudo

* Para configurar algún parámetro del build:

  sudo lb config

* Si se usa el cacher se debe cagar la variable con host y port del mismo:

  sudo CACHER=127.0.0.1:3142 lb config

* Para armar las imágenes iso, se debe ejecutar:

  sudo VERSION=xxxxx lb build

  (Donde xxxxxx es un número o nombre de versión, en caso de no usar la variable, la misma es un timestamp)

* Para limpiar archivos del build y cache:

  sudo lb clean
  sudo lb clean --cache

* Para limpiar completamente el entorno:

  sudo lb clean --purge


En caso de ser root no hace falta usar sudo.