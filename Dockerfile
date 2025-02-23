FROM debian:bookworm
WORKDIR /root

RUN apt update && apt install -y build-essential cmake gcc-arm-none-eabi git imagemagick make python3 vim

RUN git clone https://github.com/raspberrypi/pico-sdk.git && git clone https://github.com/hathach/tinyusb.git && rmdir pico-sdk/lib/tinyusb && mv tinyusb pico-sdk/lib/tinyusb

RUN echo 'mkdir -p firmware/build' >> .bashrc
RUN echo 'cd firmware/build' >> .bashrc
RUN echo 'alias create-build="PICO_SDK_PATH=~/pico-sdk/ cmake .."' >> .bashrc

CMD ["bash"]
