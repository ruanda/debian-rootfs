#!/bin/sh

set -e

debconf-set-selections << EOF
locales locales/default_environment_locale  select  en_US.UTF-8
EOF

sed -i '/en_US\.UTF-8/ s/^# //' ${TARGET}/etc/locale.gen
dpkg-reconfigure -f noninteractive locales
dpkg-reconfigure -f noninteractive tzdata
