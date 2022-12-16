FROM fitprimelabs/docker-php-nginx:latest
COPY . /app
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
RUN chown -R 82:82 /app
RUN docker-php-ext-install xml xmlwriter fileinfo simplexml gd
RUN pecl install redis && docker-php-ext-enable redis
