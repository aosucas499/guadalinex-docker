#aosucas499/guadalinex:next
# basado en ubuntu 16 xenial
# con repositorios de guadalinex edu next
 

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:hgr .

# Uso de la imagen y variables


FROM i386/ubuntu:xenial-20160629
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p 

RUN apt-get update && apt-get install nano wget -y 

# Instala repositorios guadalinex edu 2013

RUN rm /etc/apt/sources.list 

ARG REPO1=http://centros.edu.guadalinex.org/Edu/fenix/
ARG REPO2=http://centros.edu.guadalinex.org/Edu/fenixsc/
ARG REPO3=http://centros.edu.guadalinex.org/Edu/fenixscmd/
ARG REPO4=http://centros.edu.guadalinex.org/Edu/fenixscpdi/

RUN echo deb $REPO1 guadalinexedu main > /etc/apt/sources.list && echo deb $REPO2 guadalinexedu main > /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO3 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO4 guadalinexedu main >> etc/apt/sources.list.d/guadalinex.list

#wget http://centros.edu.guadalinex.org/Edu/fenix/pool/main/g/guadalinexedu-keyring/guadalinexedu-keyring_0.2-1_all.deb
COPY guadalinexedu-keyring_0.2-1_all.deb /

RUN dpkg -i guadalinexedu-keyring_0.2-1_all.deb && rm *.deb

RUN apt-get update && apt-get install libnotify-bin dbus dbus-x11 libusb-1.0 python screen sudo -y && apt-get clean

#RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/

RUN apt-get update && apt-get install python-gobject cga-hga -y && rm *.deb -f && apt-get clean -y

COPY ejabberdctl /usr/sbin/
RUN chmod +x /usr/sbin/ejabberdctl
COPY ejabberd /etc/init.d/
RUN chmod +x /etc/init.d/ejabberd
#COPY init.sh /
#RUN chmod +x /init.sh
#ENTRYPOINT /init.sh






