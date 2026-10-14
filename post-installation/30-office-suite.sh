#!/bin/sh
set -e

# Pre-installing the selected office suite.

occ() { php /var/www/html/occ "$@"; }

# Connector app
occ app:install richdocuments

# Built-in Collabora server
occ app:install richdocumentscode
