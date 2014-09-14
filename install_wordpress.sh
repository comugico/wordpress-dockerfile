#!/bin/bash
pushd /app

echo '=> Download WordPress...'
wp core download --allow-root --locale=ja
echo '=> Configure WordPress...'
wp core config  --allow-root --dbname='wordpress' --dbuser='root' --dbhost='localhost' --locale=ja

if [ -e /setup_wordpress.sh ] ; then
  source /setup_wordpress.sh
fi

echo '=> Done!'

popd
