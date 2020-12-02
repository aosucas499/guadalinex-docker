#aosucas499/guadalinex:next
# basado en ubuntu 16 xenial
# con repositorios de guadalinex edu next
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:next .

# Uso de la imagen y variables


FROM i386/ubuntu:xenial
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

# Instala repositorios guadalinex edu next
ARG REPO1=http://centros.edu.guadalinex.org/Edu/fenix/
ARG REPO2=http://centros.edu.guadalinex.org/Edu/fenixsc/
ARG REPO3=http://centros.edu.guadalinex.org/Edu/fenixscmd/
ARG REPO4=http://centros.edu.guadalinex.org/Edu/fenixscpdi/




#RUN dpkg --add-architecture i386 && apt-get update
RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p \
&& echo "APT { Get { AllowUnauthenticated "1"; }; };" > /etc/apt/apt.conf.d/99allow_unauth \
&& echo deb $REPO1 guadalinexedu main > /etc/apt/sources.list && echo deb $REPO2 guadalinexedu main > /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO3 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO4 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list \
&& apt-get -o Acquire::AllowInsecureRepositories=yes update -y --allow-unauthenticated 


RUN apt-get -o Acquire::AllowInsecureRepositories=yes install -y --allow-unauthenticated nano wget grep dbus dbus-x11 screen psmisc python flashplugin-installer flashplugin-nonfree -y && apt-get clean 
#RUN apt-get -o Acquire::AllowInsecureRepositories=yes install -y --allow-unauthenticated alsa-utils pulseaudio -y
#RUN install -d -m755 -o pulse -g pulse /run/pulse
RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/ 








