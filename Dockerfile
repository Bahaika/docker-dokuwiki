FROM alpine:3.6
MAINTAINER Jérémy SEBAN <jeremy@seban.eu>

WORKDIR /srv
RUN apk add --update openssl
RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
RUN tar -xzf dokuwiki-stable.tgz
RUN mv dokuwiki-2* /srv/dokuwiki
RUN apk add --update apache2 php5-apache2 php5-xml
RUN rm -rf /var/cache/apk/*
RUN chown apache:apache -R /srv/dokuwiki
RUN mkdir /run/apache2
RUN chown apache:apache -R /run/apache2
COPY ./httpd.conf /etc/apache2/httpd.conf
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME ["/srv/dokuwiki/conf", "/srv/dokuwiki/data"]

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]

CMD ["httpd", "-DFOREGROUND"]
