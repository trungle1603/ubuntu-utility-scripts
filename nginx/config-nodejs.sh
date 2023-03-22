#!/bin/bash

# THIS CONFIG FOR NODEJS ONLY

read -p "Enter a domain name: " DOMAIN_NAME
read -p "Enter a app name: " APP_NAME
read -p "Enter a app port:" APP_PORT

sudo tee /etc/nginx/sites-available/$DOMAIN_NAME > /dev/null <<EOF
server {
  listen 80;
  listen [::]:80;
  server_name $DOMAIN_NAME www.$DOMAIN_NAME;
  return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;
    server_name $DOMAIN_NAME www.$DOMAIN_NAME;

    ssl_certificate /etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem;

    location / {
        proxy_pass http://localhost:$APP_PORT;
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
