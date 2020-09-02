FROM nginx

LABEL maintainer="kristoph@robotforest.io"

# Change working directory in the container
WORKDIR /etc/nginx

# Install git to be able to clone repo below
RUN apt-get update && apt-get -y install git

# Clone the wait-for-it library (so we can wait for the Django app to run
# before running Nginx)
RUN git clone https://github.com/vishnubob/wait-for-it.git

# Remove the default.conf file for Nginx
RUN rm conf.d/default.conf

# Create directories for the config file below
RUN mkdir sites-enabled && mkdir sites-available

# Create symlink in the OS to the sites-enabled dir
RUN ln -s /etc/nginx/sites-available/myapp.conf /etc/nginx/sites-enabled/

# Copy over custom config
COPY myapp.conf sites-available/myapp.conf

# Copy over key config files
COPY start_nginx.sh nginx.conf uwsgi_params ./

# Copy the contents of the compiled static assets from the Django app
COPY my_django_proj/static /var/app/static
