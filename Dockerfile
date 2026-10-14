ARG NEXTCLOUD_VERSION=34

FROM nextcloud:${NEXTCLOUD_VERSION}-apache

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      libfontconfig1 \
 && rm -rf /var/lib/apt/lists/*

# Apply system configuration
COPY --chown=www-data:www-data custom-config/custom.config.php /usr/src/nextcloud/config/custom.config.php

# Configure apps
COPY --chmod=755 post-installation/ /docker-entrypoint-hooks.d/post-installation/

# Apply own branding
COPY branding/ /branding/
