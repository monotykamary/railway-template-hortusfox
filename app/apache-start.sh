#!/bin/bash
set -euo pipefail

sed -i 's/^[[:space:]]*APP_DEBUG=.*/    APP_DEBUG=false/' /var/www/html/.env
cat > /usr/local/etc/php/conf.d/errors.ini <<'EOF'
error_reporting = E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED
display_errors = Off
EOF

exec apache2-foreground
