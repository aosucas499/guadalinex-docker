#aosucas499/guadalinex:hga

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:hgr .

# Uso de la imagen y variables
FROM aosucas499/guadalinex:next
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM=1

RUN apt-get update && apt-get install curl libgdbm3 software-properties-common python-gobject cga-hga sudo -y && rm *.deb -f && apt-get clean -y

#wget http://centros.edu.guadalinex.org/Edu/fenix/pool/main/r/rlwrap/rlwrap_0.41-1build1_i386.deb && dpkg -i rlwrap_0.41-1build1_i386.deb
#wget http://centros.edu.guadalinex.org/Edu/fenix/pool/main/n/nodejs/nodejs_0.10.37-1_i386.deb && dpkg -i nodejs_0.10.37-1_i386.deb
#wget http://centros.edu.guadalinex.org/Edu/fenix/pool/main/e/etherpad-lite/etherpad-lite_1.5.7-5_all.deb && dpkg -i etherpad-lite_1.5.7-5_all.deb

COPY ejabberdctl /usr/sbin/
RUN chmod +x /usr/sbin/ejabberdctl
COPY ejabberd /etc/init.d/
RUN chmod +x /etc/init.d/ejabberd
#COPY init.sh /
#RUN chmod +x /init.sh
#ENTRYPOINT /init.sh





