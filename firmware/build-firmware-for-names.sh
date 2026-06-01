#!/bin/bash

old_name=`grep 'GBI_NAME' ../usb_descriptors.h | sed "s/\"$//" | sed "s/^#define GBI_NAME.*\"//"`

revert_code_changes() {
    sed -i "s/^#define GBI_NAME.*$/#define GBI_NAME \"$old_name\"/" ../usb_descriptors.h || fail
}

fail() {
    revert_code_changes
    printf '\nmake sure you are running this script in the firmware/build directory\n' && exit 1
}

names=(
    "GBI 0"
    "GBI 1"
    "GBI 2"
    "GBI 3"
    "GBI 4"
    "GBI 5"
    "GBI 6"
    "GBI 7"
    "GBI 8"
    "GBI 9"
)
for name in "${names[@]}"; do
    sed -i "s/^#define GBI_NAME.*$/#define GBI_NAME \"$name\"/" ../usb_descriptors.h || fail
    make || fail
    cp gb_interceptor.uf2 "gb_interceptor_$name.uf2"
    echo "done building firmware for $name"
done
revert_code_changes