FROM gcc:4.9
MAINTAINER Akira Funahashi "funa@bio.keio.ac.jp"

RUN apt-get -y update && apt-get install -y cmake
RUN rm -rf /usr/src

RUN wget https://sourceforge.net/projects/sbml/files/libsbml/5.13.0/experimental/source/libSBML-5.13.0-Source.tar.gz/download -O /tmp/libsbml.tgz -q && \
      cd /tmp && \
      tar xzf libsbml.tgz && \
      mkdir /tmp/libSBML-5.13.0-Source/build && \
      cd /tmp/libSBML-5.13.0-Source/build && \
      cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DWITH_CPP_NAMESPACE="ON" -DENABLE_ARRAYS="ON" -DENABLE_COMP="ON" -DENABLE_DISTRIB="ON" -DENABLE_DYN="ON" -DENABLE_FBC="ON" -DENABLE_GROUPS="ON" -DENABLE_LAYOUT="ON" -DENABLE_MULTI="ON" -DENABLE_QUAL="ON" -DENABLE_RENDER="ON" -DENABLE_REQUIREDELEMENTS="ON" -DENABLE_SPATIAL="ON" && \
      make install && \
      rm /tmp/libsbml.tgz
