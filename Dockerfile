FROM ubuntu:22.04

# Install dependencies
RUN apt update && \
    apt install -y libgles2-mesa-dev libsdl2-dev libxt-dev libxaw7-dev \
    doxygen zziplib-bin git build-essential g++ wget locales

# Setup locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install cmake latest version
RUN wget https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-linux-x86_64.sh -q -O \
    /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /opt/cmake \
    && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake \
    && rm /tmp/cmake-install.sh \
    && ln -s /opt/cmake/bin/* /usr/bin

WORKDIR /home/

ADD setup-ogre.sh setup-bulletphysic.sh ./

# build/install Ogre3d from latest version
ARG OGRE_VERSION_TAG
ENV OGRE_VERSION_TAG=$OGRE_VERSION_TAG
RUN bash setup-ogre.sh

# install bullet physic lib
ARG BULLET_VERSION_TAG
ENV BULLET_VERSION_TAG=$BULLET_VERSION_TAG
RUN bash setup-bulletphysic.sh

CMD ["bash"]
