# GB Interceptor Firmware

This folder contains the source code for the firmware of the GB Interceptor. It requires the Raspberry Pi Pico SDK as well as TinyUSB (which is usually a submodule of the Pico SDK repository). If you want to build the firmware yourself, remember to set `PICO_SDK_PATH` correctly.

The subfolder screens contains the info screens shown when no game is running. The `sh` script in the same folder can be used to convert new images to header files.

# License

This code is licensed under GNU General Public License v3.

# How To Build The Firmware With Docker
This will create a directory in `firmware/build/` in your local repository
* create the image
```bash
docker build -t gbinterceptor .
```
* start a shell inside the container
```bash
docker run --rm -it --name gbinterceptor -v $(pwd)/firmware:/root/firmware gbinterceptor
```
* if you run it for the first time, create the build files
```bash
# this will run cmake
create-build
```
* build the `.uf2` file
```bash
make
# now you should have the built firmware also outside of the docker container in firmware/build/gb_interceptor.uf2
```
