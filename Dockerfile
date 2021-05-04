FROM ubuntu:14.04

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/run/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2

RUN apt-get update && apt-get install -y apache2

RUN mkdir /var/run/apache2

ADD cgi-bin/acme.cgi /usr/lib/cgi-bin/
RUN chmod +x /usr/lib/cgi-bin/acme.cgi

RUN a2enmod cgid

RUN apt-get install -y build-essential wget

RUN wget https://snapshot.debian.org/archive/debian/20140304T040604Z/pool/main/b/bash/bash_4.1-3_amd64.deb
RUN dpkg -i bash_4.1-3_amd64.deb

RUN chmod o+w /var/www/html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2"]

CMD ["-D", "FOREGROUND"]
