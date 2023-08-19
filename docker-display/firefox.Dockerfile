FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install \
    firefox \
    libcanberra-gtk-module \
    libcanberra-gtk3-module
RUN apt-get clean

CMD ["firefox"]

