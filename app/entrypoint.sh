#!/bin/bash
set -euo pipefail

persist_dir() {
    local name="$1"
    local target="$2"
    mkdir -p "/data/$name"
    if [ ! -e "/data/$name/.railway-seeded" ]; then
        cp -a "$target/." "/data/$name/" 2>/dev/null || true
        touch "/data/$name/.railway-seeded"
    fi
    rm -rf "$target"
    ln -s "/data/$name" "$target"
}

persist_dir images /var/www/html/public/img
persist_dir attachments /var/www/html/public/attachments
persist_dir logs /var/www/html/app/logs
persist_dir backups /var/www/html/public/backup
persist_dir themes /var/www/html/public/themes
persist_dir migrations /var/www/html/app/migrations
chown -R www-data:www-data /data

export APP_DEBUG=true
exec /usr/local/bin/hortusfox-upstream-entrypoint /usr/local/bin/hortusfox-apache-start
