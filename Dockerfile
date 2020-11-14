#aosucas499/guadalinex:next
# basado en ubuntu 16 xenial
# con repositorios de guadalinex edu next
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:next .

# Uso de la imagen y variables
FROM i386/ubuntu:xenial
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM=1
WORKDIR /root

# Instala repositorios guadalinex edu next
ARG REPO1=http://centros.edu.guadalinex.org/Edu/fenix/
ARG REPO2=http://centros.edu.guadalinex.org/Edu/fenixsc/
ARG REPO3=http://centros.edu.guadalinex.org/Edu/fenixscmd/
ARG REPO4=http://centros.edu.guadalinex.org/Edu/fenixscpdi/

RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p && echo "APT { Get { AllowUnauthenticated "1"; }; };" > /etc/apt/apt.conf.d/99allow_unauth && apt-get update && apt-get install nano wget grep screen psmisc add-apt-key ca-certificates -y && echo deb $REPO1 guadalinexedu main > /etc/apt/sources.list && echo deb $REPO2 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex2.list && echo deb $REPO3 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex3.list && echo deb $REPO4 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex4.list && apt-get update && apt-get clean








