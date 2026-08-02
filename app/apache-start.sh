#!/bin/bash
set -euo pipefail

sed -i 's/^[[:space:]]*APP_DEBUG=.*/    APP_DEBUG=false/' /var/www/html/.env
rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf
a2enmod mpm_prefork >/dev/null

cat > /usr/local/etc/php/conf.d/errors.ini <<'EOF'
error_reporting = E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED
display_errors = Off
EOF

exec apache2-foreground
