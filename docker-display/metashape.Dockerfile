FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install libcanberra-gtk-module libcanberra-gtk3-module wget libcurl4 ffmpeg libsm6 libxext6 libglu1 xcb libxcb-xinerama0 
#     libxxf86vm-dev \
#     libglu1 \
#     ffmpeg \
#     libsm6 \
#     libxext6 \
#     libegl1-mesa \
#     libegl1 \
RUN apt-get -y install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev
RUN apt-get clean
# RUN export QT_DEBUG_PLUGINS=1
RUN export ELECTRON_DISABLE_GPU=1
RUN export QT_QPA_PLATFORM=offscreen 
RUN wget https://s3-eu-west-1.amazonaws.com/download.agisoft.com/metashape-pro_2_0_1_amd64.tar.gz
RUN tar -xvf metashape-pro_2_0_1_amd64.tar.gz

CMD ["./metashape-pro/metashape.sh"]

