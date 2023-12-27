FROM ubuntu:22.04

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt update && \
    apt install -y libgles2-mesa-dev libsdl2-dev libxt-dev libxaw7-dev \
    doxygen zziplib-bin git build-essential g++ wget

# Install cmake latest version
RUN wget https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-linux-x86_64.sh -q -O \
    /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /opt/cmake \
    && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake \
    && rm /tmp/cmake-install.sh \
    && ln -s /opt/cmake/bin/* /usr/bin

WORKDIR /home/

ADD setup-ogre.sh ./

# build/install Ogre3d from latest version
ARG OGRE_VERSION_TAG
ENV OGRE_VERSION_TAG=$OGRE_VERSION_TAG
RUN bash setup-ogre.sh

CMD ["bash"]
