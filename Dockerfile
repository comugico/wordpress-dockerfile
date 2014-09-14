FROM tutum/wordpress

RUN apt-get install -y curl

RUN rm -rf /app/*
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

ADD install_wordpress.sh /install_wordpress.sh
ADD run_wp.sh /run_wp.sh
RUN chmod +x /*.sh

#RUN bash /install_wordpress.sh

EXPOSE 80 3306
CMD ["/run_wp.sh"]
