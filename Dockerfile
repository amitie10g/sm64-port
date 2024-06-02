ARG GCC_VERS=13
FROM gcc:$GCC_VERS as build

RUN apt-get update && \
    apt-get install -y \
        binutils-mips-linux-gnu \
        bsdmainutils \
        build-essential \
        libaudiofile-dev \
        libsdl2-dev \
        libusb-1.0 \
        libx11-dev \
        libcapstone-dev \
        pkgconf \
        python3

COPY / /sm64
ENV PATH="/sm64/tools:${PATH}"

CMD echo 'usage: docker run --rm -v $(pwd)/build:/sm64/build make VERSION=us -j4\n' \
         'see https://github.com/n64decomp/sm64/blob/master/README.md for advanced usage'
