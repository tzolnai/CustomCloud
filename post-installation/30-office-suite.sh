#!/bin/sh
set -e

# Pre-installing the selected office suite.

occ() { php /var/www/html/occ "$@"; }


php /var/www/html/occ app:enable fileslibreofficeedit
