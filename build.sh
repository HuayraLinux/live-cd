#!/bin/bash

lb clean
build_timestamp=`date +%d.%m.%Y-%H.%M`

if [ -f release_name ]; then
  build_release_name=`cat release_name |tr -d "\n"`
else
  build_release_name="huayra"
fi

lb build 2>&1 |tee build.log

if [ -f binary.hybrid.iso ]; then
  mv binary.hybrid.iso "$build_release_name-$build_timestamp.iso"
  md5sum "$build_release_name-$build_timestamp.iso" > "$build_release_name-$build_timestamp.iso.md5"
else
  echo "##### BUILD ERROR #####" 
fi
mv build.log "$build_release_name-$build_timestamp.iso.log"
