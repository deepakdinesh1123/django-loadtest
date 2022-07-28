FROM python:3.10-slim-bullseye

COPY ../prod prod
WORKDIR /prod

RUN apt-get -y update && apt -y upgrade
RUN apt-get -y install git
RUN pip install git+https://github.com/django/django.git@refs/pull/14652/head
RUN pip install daphne
# RUN pip install Twisted[tls,http2] - add this for HTTP2 support
RUN python manage.py makemigrations
RUN python manage.py migrate

ENTRYPOINT [ "daphne", "-b" , "0.0.0.0", "-p" , "8000", "prod.asgi:application"]
