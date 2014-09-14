FROM tutum/lamp

RUN rm -rf /app
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

ADD install_wordpress.sh /install_wordpress.sh

RUN source /install_wordpress.sh
RUN chown -R www-data:www-data /app /var/www/html

EXPOSE 80 3306
CMD ["/run.sh"]
