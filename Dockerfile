FROM wordpress:php8.2-apache

# Install Git

RUN apt update -y && apt install -y git

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash -
RUN apt-get -y install nodejs

# Install WP-CLI
RUN curl -s -o /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

# Install dependencies

RUN npm i -g npm@latest
RUN npm i -g concurrently

# Download Kadence Theme from GitHub

# WORKDIR "/var/www/html/wp-content/themes"

# RUN git clone https://laloptk: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@github.com/stellarwp/kadence.git

# Download Kadence Blocks plugin from GitHub

# WORKDIR "/var/www/html/wp-content/plugins"

# RUN git clone https://github.com/stellarwp/kadence-blocks.git

# RUN composer install and npm install

# WORKDIR "/var/www/html/wp-content/plugins/kadence-blocks"

# RUN composer install
# RUN npm i @wordpress/scripts --save-dev

# Had to use the flag because there is a conflict between React versions
# RUN npm install --legacy-peer-deps

# WORKDIR "/var/www/html"
