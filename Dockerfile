#Download base image ubuntu 20.04
FROM ubuntu:20.04
# LABEL about the custom image
LABEL maintainer="BryanHafidz"
LABEL version="0x01"
LABEL description="This is custom Kernel Maintainer"
# Add Time Zone
RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN apt update && apt -y upgrade && apt install -y --no-install-recommends tzdata locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive
# Update Ubuntu Software repository
RUN apt update
#Dependencies Install
RUN apt-get -y update && apt-get -y install bc build-essential zip curl libstdc++6 git wget python-is-python3 gcc clang libssl-dev rsync flex bison python3-pip nano && pip3 install telegram-send
# Add Dependencies for Build Android Tools
RUN apt install \
    adb autoconf automake axel bc bison build-essential \
    ccache clang cmake expat fastboot flex g++ \
    g++-multilib gawk gcc gcc-multilib git gnupg gperf \
    htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev \
    libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev \
    libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop \
    maven ncftp ncurses-dev patch patchelf pkg-config pngcrush \
    pngquant python2.7 python-all-dev re2c schedtool squashfs-tools subversion \
    texinfo unzip w3m xsltproc zip zlib1g-dev lzip \
    libxml-simple-perl apt-utils \
    openjdk-8-jdk \
    aria2 \
    "${PACKAGES}" -y
