FROM nginx

LABEL maintainer="kristoph@robotforest.io"

WORKDIR /etc/nginx

RUN apt-get update && apt-get -y install git

RUN git clone https://github.com/vishnubob/wait-for-it.git

RUN rm conf.d/default.conf

RUN mkdir sites-enabled && mkdir sites-available

COPY myapp.conf sites-available/myapp.conf

COPY start_nginx.sh nginx.conf uwsgi_params ./

COPY my_django_proj/static /var/app/static

RUN ln -s /etc/nginx/sites-available/myapp.conf /etc/nginx/sites-enabled/

# ENTRYPOINT [ "sh", "start_nginx.sh" ]

# CMD service nginx configtest && service nginx start
