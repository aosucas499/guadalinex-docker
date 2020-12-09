#aosucas499/guadalinex:sigala

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:sigala .

# Uso de la imagen y variables
FROM aosucas499/guadalinex:precise
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_X11_NO_MITSHM=1

RUN wget --no-check-certificate https://launchpad.net/ubuntu/+source/glib2.0/2.32.3-0ubuntu1/+build/3553154/+files/libglib2.0-0_2.32.3-0ubuntu1_i386.deb && dpkg -i libglib2.0-0_2.32.3-0ubuntu1_i386.deb

RUN apt-get install sudo libicu48 libglib2.0-bin guadalinexedu-artwork python-gobject cga-hga sudo -y && rm *.deb -f && apt-get clean -y

#COPY ejabberdctl /usr/sbin/
#RUN chmod +x /usr/sbin/ejabberdctl
#COPY ejabberd /etc/init.d/
#RUN chmod +x /etc/init.d/ejabberd
#COPY init.sh /
#RUN chmod +x /init.sh
#ENTRYPOINT /init.sh



