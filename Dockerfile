#aosucas499/guadalinex:edu
# basado en ubuntu 14 trusty
# con repositorios de guadalinex edu 2013
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:edu .

# Uso de la imagen y variables
#FROM i386/ubuntu:precise
#FROM daald/ubuntu32:precise
FROM i386/ubuntu:trusty
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p 

RUN apt-get update && apt-get install nano wget -y 

# Instala repositorios guadalinex edu 2013

RUN rm /etc/apt/sources.list && rm /etc/apt/sources.list.d/*

ARG REPO1=http://centros.edu.guadalinex.org/Edu/catcorner
ARG REPO2=http://centros.edu.guadalinex.org/Edu/catcornerdda
ARG REPO3=http://centros.edu.guadalinex.org/Edu/catcornerdda2
ARG REPO4=http://centros.edu.guadalinex.org/Edu/catcornersc
ARG REPO5=http://centros.edu.guadalinex.org/Edu/precise
ARG REPO6=http://centros.edu.guadalinex.org/Edu/precisedda
ARG REPO7=http://centros.edu.guadalinex.org/Edu/precisedda2

RUN echo deb $REPO1 guadalinexedu main > /etc/apt/sources.list && echo deb $REPO2 guadalinexedu main > /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO3 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO4 guadalinexedu main >> etc/apt/sources.list.d/guadalinex.list && echo deb $REPO5 precise main >> /etc/apt/sources.list && echo deb $REPO6 precise main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO7 precise main >> /etc/apt/sources.list.d/guadalinex.list 

#wget http://centros.edu.guadalinex.org/Edu/catcorner/pool/main/g/guadalinexedu-keyring/guadalinexedu-keyring_0.1-10_all.deb
COPY guadalinexedu-keyring_0.1-10_all.deb /

RUN dpkg -i guadalinexedu-keyring_0.1-10_all.deb && rm *.deb

RUN apt-get update && apt-get install libnotify-bin dbus dbus-x11 libusb-1.0 python screen -y && apt-get clean

#RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/
