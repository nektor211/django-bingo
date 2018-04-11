server {
        listen 80;
        server_name X;
        location / {
                rewrite /(.*) https://X/$1 permanent;
        }
        access_log /dev/null;
        error_log /var/log/nginx/bingo_error.log;
}

server {
        listen 443 ssl http2;
        server_name X;

        include snippets/self-signed.conf;
        include snippets/ssl-params.conf;

        charset     utf-8;
        client_max_body_size 500M;

        location / {
            include /etc/nginx/uwsgi_params;
            uwsgi_pass unix:///Y/wsgi.sock;
        }

        location /static/ {
                alias Y/_static/;
        }
        location /media {
                alias T/_media/;
        }

        access_log /var/log/nginx/bingo_access.log;
        error_log /var/log/nginx/bingo_error.log;
}
