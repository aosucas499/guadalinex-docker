#aosucas499/guadalinex:edu
# basado en ubuntu 20.04 Focal
# con repositorios de educaandos
 
# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:eos .

# Uso de la imagen y variables
#FROM ubuntu:focal
FROM ubuntu:focal-20200606
LABEL maintainer="Andrés Osuna <aosucas499gmail.com>"
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM=1

RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p

# Instala repositorios educaandos
ARG REPO1=http://centros.edu.guadalinex.org/Edu/focal
ARG REPO2=http://centros.edu.guadalinex.org/Edu/focalsc
ARG REPO3=http://centros.edu.guadalinex.org/Edu/focalscmd
ARG REPO4=http://centros.edu.guadalinex.org/Edu/focalscpdi

RUN echo deb [trusted=yes] $REPO1 educaandos main > /etc/apt/sources.list && echo deb [trusted=yes] $REPO2 educaandos main > /etc/apt/sources.list.d/guadalinex.list && echo deb [trusted=yes] $REPO3 educaandos main >> /etc/apt/sources.list.d/guadalinex.list && echo deb [trusted=yes] $REPO4 educaandos main >> /etc/apt/sources.list.d/guadalinex.list 

COPY educaandos-keyring_0.3-4_amd64.deb / 

RUN dpkg -i educaandos-keyring_0.3-4_amd64.deb && rm *.deb 

RUN apt update && apt install nano wget grep screen psmisc ca-certificates libusb-1.0-0 dbus dbus-x11 -y && apt-get clean

#RUN apt-get install libnotify-bin python -y && apt-get clean
