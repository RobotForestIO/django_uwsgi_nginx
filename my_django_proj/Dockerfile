FROM python:3

LABEL maintainer="kristoph@robotforest.io"

COPY . .

RUN pip install -r requirements.txt

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["uwsgi", "--socket", ":8001", "--wsgi-file", "my_django_proj/wsgi.py"]
