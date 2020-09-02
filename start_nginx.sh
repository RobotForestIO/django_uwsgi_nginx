# Run configtest to make sure Nginx configuration is ok
service nginx configtest && \
# Run nginx in the foreground
nginx -g "daemon off;"
