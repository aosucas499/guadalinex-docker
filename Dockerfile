#aosucas499/guadalinex:sigala

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:sigala .

# Uso de la imagen y variables
FROM aosucas499/guadalinex:precise
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM=1

# Instala repositorios ubuntu
ARG REPO5=http://centros.edu.guadalinex.org/Edu/precise
RUN echo deb $REPO5 precise main >> /etc/apt/sources.list.d/guadalinex5.list && apt-get update
RUN apt-get install python-gobject cga-hga sudo -y && rm *.deb -f && apt-get clean -y


#SRC_APPS=/usr/share/applications
#DST=/usr/share/sigala/desktop

