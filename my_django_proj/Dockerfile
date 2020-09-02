# Use Python 3 image
FROM python:3

LABEL maintainer="kristoph@robotforest.io"

# Copy the Django project over
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Compile all static files
RUN python manage.py collectstatic --noinput

# Run a uwsgi application server via a socket protocol on port 8001 using the
# wsgi.py file provided by Django.
CMD ["uwsgi", "--socket", ":8001", "--wsgi-file", "my_django_proj/wsgi.py"]
