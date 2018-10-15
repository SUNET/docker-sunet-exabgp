FROM ubuntu
MAINTAINER leifj@sunet.se
RUN apt-get -q update
RUN apt-get -y upgrade
RUN apt-get -y install python git-core python-setuptools curl wget python-requests inotify-tools

# Install exabgp from source
WORKDIR /usr/src
RUN git clone https://github.com/Exa-Networks/exabgp.git
WORKDIR /usr/src/exabgp
RUN git checkout 3.4
RUN python setup.py install

# Install inotify for Python, to be able to use it in monitor scripts
WORKDIR /usr/src
RUN git clone https://github.com/dsoprea/PyInotify
WORKDIR /usr/src/PyInotify
RUN git checkout 0.2.10
RUN python setup.py install

ENTRYPOINT ["exabgp"]
