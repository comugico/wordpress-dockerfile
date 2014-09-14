#!/bin/bash
source /run.sh &
#sleep 25s
pushd /app

echo '=> Check WordPress is installed'
if ! $(wp core is-installed --allow-root); then
  echo '=> WordPress is NOT installed'
  while ( [ ! -e /var/run/supervisor.sock ] ) ; do
    echo '=> Wait mysql'
    #ls -l /var/run
    sleep 1s
  done
  sleep 2s
  echo '=> mysql is up'
  #exit
  source /install_wordpress.sh
  chown -R www-data:www-data /app /var/www/html
else
  echo '=> WordPress is installed'
fi

popd
wait %1
