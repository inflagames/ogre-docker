FROM ubuntu:21.10

ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y libgles2-mesa-dev libsdl2-dev libxt-dev libxaw7-dev doxygen zziplib-bin cmake-qt-gui cmake git build-essential g++

WORKDIR /home/

ADD setup-ogre.sh ./

ARG OGRE_VERSION_TAG
ENV OGRE_VERSION_TAG=$OGRE_VERSION_TAG
RUN bash setup-ogre.sh

CMD ["bash"]
