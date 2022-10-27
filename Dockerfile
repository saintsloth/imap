# libonig-dev required for PHP 8.0

FROM php:7.3

RUN runtimeDeps=" \
        curl \
        git \
        zip \
        libc-client-dev \
        libkrb5-dev \
        libonig-dev \
        libxml2-dev \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $runtimeDeps \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install iconv mbstring imap \
    && rm -r /var/lib/apt/lists/*

RUN curl -sS https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/local/bin/wait-for-it.sh \
    && chmod +x /usr/local/bin/wait-for-it.sh
