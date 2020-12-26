ll
cat clone-yocto.sh
./clone-yocto.sh ws
ll
cd ws/
ll
./sources/poky/oe-init-build-env
. ./sources/poky/oe-init-build-env
bitbake core-image-minimal
cd ../
rm -rf build/
. ./sources/poky/oe-init-build-env
ll /opt/
ll /opt/yocto/
ll /opt/yocto/cache/
realpath ../../cache/downloads/
realpath ../../cache/sstate/
bitbake core-image-minimal
ll
cd ws/
ll
. ./sources/poky/oe-init-build-env
bitbake core-image-minimal
vim ~/.bashrc
