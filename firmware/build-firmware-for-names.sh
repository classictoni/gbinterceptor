#!/bin/bash

fail() {
    printf '\nmake sure you are running this script in the firmware/build directory\n' && exit 1
}

names=(
    "GBI 1"
    "GBI 2"
    "GBI 3"
    "GBI 4"
)
for name in "${names[@]}"; do
    sed -i "s/^#define GBI_NAME.*$/#define GBI_NAME \"$name\"/" ../usb_descriptors.h || fail
    make
    cp gb_interceptor.uf2 "gb_interceptor_$name.uf2"
    echo "done building firmware for $name"
done
