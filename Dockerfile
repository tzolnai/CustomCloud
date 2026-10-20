ARG NEXTCLOUD_VERSION=34

# Have an own build of fileslibreofficeedit so we can patch it
FROM node:20 AS appbuild
ARG APP_VERSION=v2.0.1
RUN git clone --depth 1 --branch ${APP_VERSION} \
    https://github.com/allotropia/nextcloud_files_libreoffice_edit.git /app/fileslibreofficeedit
WORKDIR /app/fileslibreofficeedit
COPY patches/adapt_to_new_file_action_API.patch /tmp/adapt_to_new_file_action_API.patch
RUN git apply /tmp/adapt_to_new_file_action_API.patch
RUN npm ci && npm run build
RUN rm -rf node_modules .git appinfo/signature.json

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

# Install patched app
COPY --from=appbuild --chown=www-data:www-data /app/fileslibreofficeedit /usr/src/nextcloud/custom_apps/fileslibreofficeedit
