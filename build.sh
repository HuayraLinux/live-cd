#!/bin/bash

# test real o link
readlink $0
if [ $? == 0 ]; then
    echo "Check OK"
else
    echo "Debe ejecutar este script dentro de un directorio de configuracion (ej: cd installer+live y luego ./build.sh)"
    exit 1
fi

echo "Limpiando..." |tee -a build.log
lb clean
build_timestamp=`date +%d.%m.%Y-%H.%M`

if [ -f release_name ]; then
  build_release_name=`cat release_name |tr -d "\n"`
else
  build_release_name="huayra"
fi

echo "$build_release_name-$build_timestamp" > config/includes.binary/BUILD

lb build 2>&1 |tee -a build.log

if [ -f binary.hybrid.iso ]; then
  mv binary.hybrid.iso "$build_release_name-$build_timestamp.iso"
  md5sum "$build_release_name-$build_timestamp.iso" > "$build_release_name-$build_timestamp.iso.md5"
  mv build.log "$build_release_name-$build_timestamp.iso.log"
  mv binary.contents "$build_release_name-$build_timestamp.binary.contents"
  mv binary.hybrid.iso.zsync.gz "$build_release_name-$build_timestamp.binary.hybrid.iso.zsync.gz"
  mv binary.packages "$build_release_name-$build_timestamp.binary.packages"
  mv chroot.packages.install "$build_release_name-$build_timestamp.chroot.packages.install"
  mv chroot.packages.live "$build_release_name-$build_timestamp.chroot.packages.live"
else
  echo "##### BUILD ERROR #####" | tee -a build.log
  mv build.log "$build_release_name-$build_timestamp.iso.ERROR.log"
 
fi
