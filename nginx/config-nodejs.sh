#!/bin/bash

# THIS CONFIG FOR NODEJS ONLY

read -p "Enter a domain name: " DOMAIN_NAME
read -p "Enter a app port:" APP_PORT

sudo tee /etc/nginx/sites-available/$DOMAIN_NAME > /dev/null <<EOF
server {
    listen 80;
    listen [::]:80;

    server_name $DOMAIN_NAME www.$DOMAIN_NAME;

    location /api {
        proxy_pass http://localhost:$APP_PORT/api;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

# Create a symbolic link to enable the server block
sudo ln -s /etc/nginx/sites-available/$DOMAIN_NAME /etc/nginx/sites-enabled/

# Restart Nginx
sudo systemctl restart nginx
