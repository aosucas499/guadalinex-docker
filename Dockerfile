#aosucas499/guadalinex:hga

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/guadalinex:hgr .

# Uso de la imagen y variables
FROM aosucas499/guadalinex:next
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM=1

# Instala repositorios ubuntu
#ARG REPO5=http://centros.edu.guadalinex.org/Edu/precise
#RUN echo deb $REPO5 precise main >> /etc/apt/sources.list.d/guadalinex5.list && apt-get update
#RUN apt-get install python-gobject cga-hga -y

RUN apt-get update && wget http://centros.edu.guadalinex.org/Edu/precise/pool/main/r/rlwrap/rlwrap_0.37-2_i386.deb && dpkg -i rlwrap_0.37-2_i386.deb && wget http://centros.edu.guadalinex.org/Edu/precise/pool/main/n/nodejs/nodejs_0.10.37-1_i386.deb && dpkg -i nodejs_0.10.37-1_i386.deb && apt-get install curl -y && wget http://centros.edu.guadalinex.org/Edu/precise/pool/main/e/etherpad-lite/etherpad-lite_1.5.7-3_all.deb && dpkg -i etherpad-lite_1.5.7-3_all.deb && apt-get install libgdbm3 -y && wget http://security.ubuntu.com/ubuntu/pool/main/p/perl/perl-modules-5.22_5.22.1-9ubuntu0.9_all.deb && wget http://security.ubuntu.com/ubuntu/pool/main/p/perl/libperl5.22_5.22.1-9ubuntu0.9_i386.deb && wget http://security.ubuntu.com/ubuntu/pool/main/p/perl/perl_5.22.1-9ubuntu0.9_i386.deb && wget http://security.ubuntu.com/ubuntu/pool/main/p/perl/perl-base_5.22.1-9ubuntu0.9_i386.deb && wget http://security.ubuntu.com/ubuntu/pool/main/t/tzdata/tzdata_2020a-0ubuntu0.19.10_all.deb && wget http://security.ubuntu.com/ubuntu/pool/main/m/mysql-5.7/mysql-common_5.7.32-0ubuntu0.16.04.1_all.deb && wget http://security.ubuntu.com/ubuntu/pool/main/m/mysql-5.7/libmysqlclient20_5.7.32-0ubuntu0.16.04.1_i386.deb && dpkg -i *.deb && apt-get install python-gobject cga-hga sudo -y && rm *.deb -f && apt-get clean -y


