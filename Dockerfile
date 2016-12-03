FROM ubuntu:14.04
MAINTAINER Vincent Pietri

RUN apt-get update && apt-get install -y \
    ruby-dev \
    make

RUN gem install compass -v 1.0.3
RUN gem install sass -v 3.4.20

VOLUME /src

WORKDIR /src

ENTRYPOINT [ "compass" ]
