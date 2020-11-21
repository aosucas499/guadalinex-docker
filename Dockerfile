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

# Instala repositorios guadalinex edu 2013
ARG REPO1=http://centros.edu.guadalinex.org/Edu/catcorner
ARG REPO2=http://centros.edu.guadalinex.org/Edu/catcornerdda
ARG REPO3=http://centros.edu.guadalinex.org/Edu/catcornerdda2
ARG REPO4=http://centros.edu.guadalinex.org/Edu/catcornersc
ARG REPO5=http://centros.edu.guadalinex.org/Edu/precise
ARG REPO6=http://centros.edu.guadalinex.org/Edu/precisedda
ARG REPO7=http://centros.edu.guadalinex.org/Edu/precisedda2

#RUN dpkg --add-architecture i386 && apt-get update
RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p \
&& echo "APT { Get { AllowUnauthenticated "1"; }; };" > /etc/apt/apt.conf.d/99allow_unauth \
&& echo deb $REPO1 guadalinexedu main > /etc/apt/sources.list && echo deb $REPO2 guadalinexedu main > /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO3 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO4 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO5 precise main >> /etc/apt/sources.list && echo deb $REPO6 precise main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO7 precise main >> /etc/apt/sources.list.d/guadalinex.list \
&& apt-get -o Acquire::AllowInsecureRepositories=yes update -y --allow-unauthenticated \
&& echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections \
&& apt-get -o Acquire::AllowInsecureRepositories=yes install apt-utils -y --allow-unauthenticated
RUN apt-get -o Acquire::AllowInsecureRepositories=yes install -y --allow-unauthenticated nano wget grep dbus dbus-x11 screen psmisc python flashplugin-installer flashplugin-nonfree -y && apt-get clean 
RUN install -d -m755 -o pulse -g pulse /run/pulse
RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/
