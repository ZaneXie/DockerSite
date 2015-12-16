from php7
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN mv wp-cli.phar /usr/bin/wp
RUN chmod 755 /usr/bin/wp
RUN echo 'alias wp="/usr/bin/wp --allow-root"' >>  /root/.bashrc
CMD ["bash", "start.sh"]
