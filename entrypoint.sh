#!/bin/sh

if [ ! -f "/srv/dokuwiki/conf/dokuwiki.php" ]; then
  echo "Recreating config files..."
  mkdir -p /tmp/dw
  tar -xzf /srv/dokuwiki-stable.tgz -C /tmp/dw
  mv /tmp/dw/dokuwiki* /tmp/dw/dokuwiki
  cp -R /tmp/dw/dokuwiki/conf/* /srv/dokuwiki/conf/
  cp /tmp/dw/dokuwiki/conf/.htaccess /srv/dokuwiki/conf/.htaccess
  chown -R apache:apache /srv/dokuwiki/conf/
  rm -rf /tmp/dw
fi

if [ ! -d "/srv/dokuwiki/conf/pages" ]; then
  echo "Recreating data files and sub-folders..."
  mkdir -p /tmp/dw
  tar -xzf /srv/dokuwiki-stable.tgz -C /tmp/dw
  mv /tmp/dw/dokuwiki* /tmp/dw/dokuwiki
  cp -R /tmp/dw/dokuwiki/data/* /srv/dokuwiki/data/
  cp /tmp/dw/dokuwiki/data/.htaccess /srv/dokuwiki/data/.htaccess
  chown -R apache:apache /srv/dokuwiki/data/
  rm -rf /tmp/dw
fi

exec "$@"
