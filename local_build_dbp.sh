#!/bin/bash

UPSTREAM_VERSION="1.3.2"
sonic_ver=`pwd | grep -o .$`

# Checkout upstream repo
#git clone https://github.com/RSDKModding/RSDKv4-Decompilation
#cd RSDKv4-Decompilation
#git checkout v${UPSTREAM_VERSION}

## TODO - buster warning - needs newer cmake than on system - install from source; change command to /usr/local/bin/cmake

#cmake -B build -DUSE_SOURCE_DATADIRS=ON -DCMAKE_BUILD_TYPE=Release ..
#make -j2

# Copy new binary to gamedata
#cp CorsixTH/corsix-th ../../gamedata
#cd ../../..

# sed version upstream

#sed -i 's/Version=.*/Version=0\.68\.0/' assets/meta/default.desktop

# TODO - sed version repo with maybe r1 with counter? - manual

mksquashfs gamedata gamedata.sqfs -comp xz
cd assets; zip -r ../data.zip *; cd ..
#cat gamedata.sqfs data.zip > sonic1_1.3.2-maquis196.dbp
cat gamedata.sqfs data.zip > sonic${sonic_ver}.dbp
