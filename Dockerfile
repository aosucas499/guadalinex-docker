#aosucas499/smartdre:0.4

# Cambio:
#Basado en Guadalinex Edu next 
#Basado en ubuntu 16 xenial
#Con repositorios de guadalinex edu next

# Comando para crear imagen docker, usar comando en la misma carpeta de este archivo
# sudo docker build -t aosucas499/smartdre:0.4 .

# Uso de la imagen y variables
FROM aosucas499/guadalinex:next
MAINTAINER Andrés Osuna <aosucas499gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV QT_X11_NO_MITSHM=1

#RUN mkdir /var/run/dbus && apt-get update && apt-get install libsasl2-modules-gssapi-heimdal libsasl2-modules-ldap libsasl2-modules-otp libsasl2-modules-sql -y 

#RUN apt-get install libsasl2-modules-gssapi-mit libvisual-0.4-plugins gstreamer1.0-tools librsvg2-common opus-tools pciutils pulseaudio qt5-image-formats-plugins qtwayland5 lm-sensors sgml-base-doc debhelper dbus-user-session dbus-x11 libusb-1.0 gvfs gnutls-bin -y 

#RUN apt-get install gnutls-bin krb5-doc krb5-user -y
#RUN apt-get installgeoip-bin sgml-base-doc debhelper -y

RUN apt-get install dbus-x11 -y

RUN wget http://es.archive.ubuntu.com/ubuntu/pool/main/u/udev/libudev0_175-0ubuntu9_i386.deb && dpkg -i libudev0_175-0ubuntu9_i386.deb && apt-get install smart-common smart-hwr smart-languagesetup smart-product-drivers -y && apt-get clean

# Añade al contenedor el archivo que inicia el software cuando se inicia el contenedor
COPY nwfermi_daemon* /usr/sbin/
RUN chmod 755 /usr/sbin/nwfermi_daemon*
RUN chmod +x /usr/sbin/nwfermi_daemon*
COPY init.sh /
RUN chmod +x /init.sh
ENTRYPOINT /init.sh





#apt-get install binutils-doc whois vacation bzip2-doc cpp-doc gcc-5-locales dh-make debian-keyring g++-multilib g++-5-multilib gcc-5-doc libstdc++6-5-dbg gcc-multilib autoconf automake libtool flex bison gdb gcc-doc gcc-5-multilib libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan2-dbg liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libmpx0-dbg libquadmath0-dbg gettext-doc autopoint groff ppp rdnssd iproute2-doc resolvconf avahi-autoipd isc-dhcp-client-ddns apparmor glibc-doc libstdc++-5-doc make-doc less www-browser ed diffutils-doc perl-doc libterm-readline-gnu-perl -y

# apuntes de usar la imagen docker en local

# guardar imagen en archivo .tar
#docker save aosucas499/smartdre:0.4 > smartdre-0.4.tar

#cargar imagen .tar en otro pc
#docker load --input smartdre-0.4.tar



# En el sistema local hay que ejecutar la app install_dre 
# que instala docker, el driver necesario en el anfitrión: nwdermi y xf86-input-nextwindow,
# y la aplicación smartdre que ejecuta por primera vez el contenedor o lo inicia si fue creado
#no es necesaria ejecutarla siempre, solo si hay fallos de inicio.
