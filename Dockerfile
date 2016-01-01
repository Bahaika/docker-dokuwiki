FROM alpine:3.3
MAINTAINER Jérémy SEBAN <jeremy@seban.eu>

WORKDIR /srv
RUN wget http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
RUN tar -xzf dokuwiki-stable.tgz
RUN rm dokuwiki-stable.tgz
RUN mv dokuwiki* /srv/dokuwiki
RUN apk add --update apache2 php-apache2
RUN rm -rf /var/cache/apk/*
RUN chown apache:apache -R /srv/dokuwiki
RUN mkdir /run/apache2
RUN chown apache:apache -R /run/apache2
COPY ./httpd.conf /etc/apache2/httpd.conf

CMD ["httpd", "-DFOREGROUND"]
