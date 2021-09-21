FROM yiisoftware/yii2-php:7.1-apache
WORKDIR /app

RUN apt-get update && apt-get install -y libc-client-dev libkrb5-dev wget && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
&& docker-php-ext-install imap

COPY ./ /app
RUN chmod 777 -R /app/runtime &&\
    chmod 777 -R /app/web/assets

# Workaround for write permission on write to MacOS X volumes
# See https://github.com/boot2docker/boot2docker/pull/534
RUN usermod -u 1000 www-data \
# Enable Apache mod_rewrite
&& a2enmod rewrite \
# Enable Apache mod_rewrite
&& a2enmod headers \
# Enable Apache mod_rewrite
&& a2enmod expires

#COPY ./base.ini /usr/local/etc/php/conf.d/base.ini
