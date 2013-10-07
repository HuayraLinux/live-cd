# For some reason, the wiki software eats my first script line which is
#!/bin/bash

# -e  Exit immediately if a command exits with a non-zero status
set -e
# -x  Print commands and their arguments as they are executed
set -x

# I tried to put the patch inline as a here-doc, but the wiki software messed
# up the whitespace and so the patch was corrupt. The patch here is from 
# #601670 - debootstrap script install base-files and base-passwd depends on them in Packages file's sequence - Debian Bug report logs
# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=601670
#wget -O debootstrapFunctions.patch http://pastebin.com/download.php?i=JudHSnWE

mkdir -p debootstrapPatch/DEBIAN
dpkg-deb --fsys-tarfile debootstrap*.udeb.orig | tar -C debootstrapPatch -x
dpkg-deb -e debootstrap*.udeb.orig debootstrapPatch/DEBIAN/
cp functions debootstrapPatch/usr/share/debootstrap/functions
# Prints:
# patching file debootstrapPatch/usr/share/debootstrap/functions
dpkg-deb --build debootstrapPatch
# Prints:
# dpkg-deb: building package `debootstrap-udeb' in `debootstrapPatch.deb'.
#mv debootstrapPatch.deb cd/pool/main/d/debootstrap/debootstrap*.udeb

# Clean up
rm -r debootstrapPatch

