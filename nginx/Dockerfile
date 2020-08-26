FROM nginx

LABEL maintainer="kristoph@robotforest.io"

WORKDIR /etc/nginx

RUN rm conf.d/default.conf

RUN mkdir sites-enabled && mkdir sites-available

COPY myapp.conf sites-available/myapp.conf

COPY my_django_proj/static /var/app/static

RUN ln -s /etc/nginx/sites-available/myapp.conf /etc/nginx/sites-enabled/

COPY nginx.conf nginx.conf

RUN service nginx configtest && service nginx restart
