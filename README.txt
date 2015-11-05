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

  sudo lb config --help

  Esta configuraciones están el archivo auto/config

Para mayor información leer el manual de live-build (http://live.debian.net/)

Variables para el build
-----------------------

ARCH (obligatorio): Se debe definir de que arquitectura se genera la iso (amd64 o i386).

  sudo ARCH=amd64 lb config
  sudo ARCH=amd64 lb build

CACHER: Si se usa el apt-cacher se debe cargar la variable con host y port del mismo:

  sudo ARCH=amd64 CACHER=127.0.0.1:3142 lb config
  sudo ARCH=amd64 CACHER=127.0.0.1:3142 lb build

RELEASE_VERSION: Version del build:

  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta lb config
  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta lb build

  (la versión es un texto o número, en caso de no usar la variable, la misma es un timestamp
   ejemplo: huayra-amd64-201312231402.iso)

DEBUG: Valor 1 para habilitar opciones de paquetes de debug:

  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta DEBUG=1 lb config
  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta DEBUG=1 lb build

  (Con la variables de DEBUG por ejemplo se agregan los paquetes guest para virtualbox y vmware)

EFI: Valor 1 para crear una iso con los paquetes grub-efi en vez de grub-pc

  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta EFI=1 lb config
  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta EFI=1 lb build

PROPOSED: Valor 1 para agregar repos proposed (por lo general para pruebas de actualizaciones)

  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta EFI=1 PROPOSED=1 lb config
  sudo ARCH=amd64 CACHER=127.0.0.1:3142 RELEASE_VERSION=2.0beta EFI=1 PROPOSED=1 lb build

Limpieza del build
------------------

* Para limpiar archivos del build y cache:

  sudo lb clean
  sudo lb clean --cache

* Para limpiar completamente el entorno:

  sudo lb clean --purge

Nota: En caso de ser root no hace falta usar sudo.
