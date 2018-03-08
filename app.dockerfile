FROM php:7.0.4-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql \
    && curl -sL https://deb.nodesource.com/setup_9.x | bash \
    && apt-get install -y nodejs
    
COPY package*.json ./
RUN npm install
