FROM debian:bullseye

ARG DEBIAN_FRONTEND=noninteractive0

RUN apt update && \
    apt install -y git curl cmake pkg-config python3 \
    build-essential \
    libusb-1.0-0-dev \
    gcc-arm-none-eabi \ 
    libnewlib-arm-none-eabi

# Raspberry Pi Pico SDK
ENV PICO_SDK_PATH=/usr/share/pico_sdk
RUN git clone --depth 1 --branch 1.5.1 https://github.com/raspberrypi/pico-sdk $PICO_SDK_PATH && \
    cd $PICO_SDK_PATH && \
    git submodule update --init

# Pico Extras
ENV PICO_EXTRAS_PATH=/usr/share/pico_extras
RUN git clone --depth 1 --branch sdk-1.5.1 https://github.com/raspberrypi/pico-extras.git $PICO_EXTRAS_PATH && \
    cd $PICO_EXTRAS_PATH && \
    git submodule update --init

# Picotool installation
RUN git clone --depth 1 --branch 1.1.2 https://github.com/raspberrypi/picotool.git /home/picotool && \
    cd /home/picotool && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    cp /home/picotool/build/picotool /bin/picotool && \
    rm -rf /home/picotool
