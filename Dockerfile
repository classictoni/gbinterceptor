FROM debian:bookworm
WORKDIR /root

RUN apt update && apt install -y build-essential cmake gcc-arm-none-eabi git imagemagick make python3 vim

RUN git clone https://github.com/raspberrypi/pico-sdk.git --recurse-submodules=lib/tinyusb

RUN echo 'mkdir -p firmware/build' >> .bashrc
RUN echo 'cd firmware/build' >> .bashrc
RUN echo 'alias create-build="PICO_SDK_PATH=~/pico-sdk/ cmake .. -DBASE_VIDEO_MODE=1"' >> .bashrc

CMD ["bash"]
