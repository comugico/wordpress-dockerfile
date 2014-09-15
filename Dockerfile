FROM tutum/wordpress

RUN apt-get install -y curl openssh-sftp-server openssh-server
ADD supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf

RUN rm -rf /app/*
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

ADD start-sshd.wrapper.sh /start-sshd.wrapper.sh
ADD start-sshd.sh /start-sshd.sh
ADD install_wordpress.sh /install_wordpress.sh
ADD run_wp.sh /run_wp.sh
RUN chmod +x /*.sh

#RUN bash /install_wordpress.sh

EXPOSE 80 3306 22
CMD ["/run_wp.sh"]
