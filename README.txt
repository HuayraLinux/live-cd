Huayra GNU/Linux - Instalador
=============================

Para construir las imágenes de los instaladores y/o live-cd
es necesario tener instalado los siguientes paquetes:

live-build
apt-cacher
 

Para armar las imagenes, ingresar al directorio correspondiente y ejecutar

sudo lb build

Para limpiar archivos del build y cache 

sudo lb clean 
sudo lb clean --cache
