#!/bin/sh
set -e

# Applying custom branding using theming app

occ() { php /var/www/html/occ "$@"; }

occ theming:config name "My Custom Cloud"
occ theming:config slogan "Just a custom cloud!!!"
occ theming:config url "https://github.com/tzolnai/CustomCloud"
occ theming:config primary_color "#064E3B"
occ theming:config background_color "#C8E6C9"

occ theming:config logo /branding/logo.png
occ theming:config background /branding/background.png