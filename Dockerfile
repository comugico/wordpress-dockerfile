FROM tutum/wordpress

RUN apt-get install -y curl openssh-sftp-server openssh-server
ADD supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf
ADD mod_remoteip.conf /etc/apache2/conf-available/mod_remoteip.conf

RUN a2enmod remoteip
RUN a2enconf mod_remoteip.conf

RUN rm -rf /app/*
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

ADD sshd_config /custom_sshd_config
ADD start-sshd.wrapper.sh /start-sshd.wrapper.sh
ADD start-sshd.sh /start-sshd.sh
ADD install_wordpress.sh /install_wordpress.sh
ADD run_wp.sh /run_wp.sh
RUN chmod +x /*.sh

#RUN bash /install_wordpress.sh

EXPOSE 80 3306 22
CMD ["/run_wp.sh"]
