#!/bin/sh
pushd /app

wp core download --locale=ja
wp core config --dbname='wordpress' --dbuser='root' --dbpass='' --dbhost='localhost' --locale=ja

popd