#aosucas499/guadalinex:edu
# basado en ubuntu 14 trusty 
# con repositorios de guadalinex edu 
 
# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:sigala .

# Uso de la imagen y variables


FROM lliurex/i386-ubuntu:14.04
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

RUN echo exit 0 > /usr/sbin/policy-rc.d && mkdir /usr/share/applications -p && mkdir /usr/share/desktop-directories -p 

RUN apt-get update && apt-get install nano wget grep -y 

# Instala repositorios guadalinex edu 2013

RUN rm /etc/apt/sources.list 

ARG REPO1=http://centros.edu.guadalinex.org/Edu/fenix/
ARG REPO2=http://centros.edu.guadalinex.org/Edu/fenixsc/
ARG REPO3=http://centros.edu.guadalinex.org/Edu/fenixscmd/
ARG REPO4=http://centros.edu.guadalinex.org/Edu/fenixscpdi/

RUN echo deb $REPO1 guadalinexedu main > /etc/apt/sources.list && echo deb $REPO2 guadalinexedu main > /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO3 guadalinexedu main >> /etc/apt/sources.list.d/guadalinex.list && echo deb $REPO4 guadalinexedu main >> etc/apt/sources.list.d/guadalinex.list

#RUN wget http://centros.edu.guadalinex.org/Edu/fenix/pool/main/g/guadalinexedu-keyring/guadalinexedu-keyring_0.2-1_all.deb
COPY guadalinexedu-keyring_0.2-1_all.deb /

RUN dpkg -i guadalinexedu-keyring_0.2-1_all.deb && rm *.deb

RUN apt-get update && apt-get install libnotify-bin dbus dbus-x11 libusb-1.0 python screen sudo -y && apt-get clean

RUN mkdir /var/run/dbus && chown messagebus:messagebus /var/run/dbus/

RUN apt-get update && apt-get install -y python-avahi python-qt4 python-qt4-dbus python-netifaces python-sleekxmpp python-webdav x11vnc xtightvncviewer xvnc4viewer vlc rlwrap avahi-daemon setcd python-dnspython curl patch

RUN apt-get update && apt-get install guadalinexedu-artwork python-gobject ejabberd python-sleekxmpp cga-hga -y && rm *.deb -f && apt-get clean -y

COPY sigala-install.patch /

RUN patch /usr/lib/python2.7/dist-packages/hga/controlcompartir/cliente/davclient.py sigala-install.patch && rm *.patch

RUN echo "ALL     ALL=NOPASSWD:/usr/bin/cga-hgr-client" >> /etc/sudoers.d/ejabberd-cgaconfig
RUN echo "ALL     ALL=NOPASSWD:/usr/bin/cga-hgr-server" >> /etc/sudoers.d/ejabberd-cgaconfig

#COPY ejabberdctl /usr/sbin/
#RUN chmod +x /usr/sbin/ejabberdctl
#COPY ejabberd /etc/init.d/
#RUN chmod +x /etc/init.d/ejabberd
#COPY init.sh /
#RUN chmod +x /init.sh
#ENTRYPOINT /init.sh
 
COPY docker-entrypoint*.sh /
RUN chmod +x docker-entrypoint*

ENTRYPOINT [ "/docker-entrypoint.sh" ]






