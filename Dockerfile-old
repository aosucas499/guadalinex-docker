#aosucas499/guadalinex:edu
# basado en ubuntu 12 precise 64bist
# con repositorios de guadalinex edu 2013
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:precise .

# Uso de la imagen y variables
#FROM i386/ubuntu:precise
#FROM daald/ubuntu32:precise

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:precise .

FROM i386/ubuntu:precise
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM=1

# Instala repositorios guadalinex edu 2013
ARG REPO1=http://centros.edu.guadalinex.org/Edu/catcorner
ARG REPO2=http://centros.edu.guadalinex.org/Edu/catcornerdda
ARG REPO3=http://centros.edu.guadalinex.org/Edu/catcornerdda2
ARG REPO4=http://centros.edu.guadalinex.org/Edu/catcornersc
#ARG REPO5=http://centros.edu.guadalinex.org/Edu/precise
#ARG REPO6=http://centros.edu.guadalinex.org/Edu/precisedda
#ARG REPO7=http://centros.edu.guadalinex.org/Edu/precisedda2

#RUN dpkg --add-architecture i386 && apt-get update
RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p && echo "APT { Get { AllowUnauthenticated "1"; }; };" > /etc/apt/apt.conf.d/99allow_unauth && apt-get update && apt-get install nano wget grep screen psmisc add-apt-key ca-certificates -y && echo deb $REPO1 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO2 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex2.list && echo deb $REPO3 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex3.list && echo deb $REPO4 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex4.list && apt-get update && apt-get clean 









