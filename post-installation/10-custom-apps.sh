#!/bin/sh
set -e

# Modifying default apps.

# Disable the welcome slideshow
php /var/www/html/occ app:disable firstrunwizard

php /var/www/html/occ app:enable helloworld
