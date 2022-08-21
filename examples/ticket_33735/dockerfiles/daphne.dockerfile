FROM python:3.10-slim-bullseye

ENV DJANGO_SUPERUSER_USERNAME admin
ENV DJANGO_SUPERUSER_PASSWORD Admin@1234
ENV DJANGO_SUPERUSER_EMAIL admin@mail.com

COPY examples/ticket_33735 ticket_33735/
WORKDIR /ticket_33735/

RUN apt-get -y update && apt -y upgrade
RUN apt-get -y install git
RUN pip install git+https://github.com/django/django.git@refs/pull/14652/head
RUN pip install daphne pyyaml
# RUN pip install Twisted[tls,http2] - add this for HTTP2 support
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser --noinput
RUN python manage.py loaddata initial

ENTRYPOINT [ "daphne", "-b" , "0.0.0.0", "-p" , "8000", "ticket_33735.asgi:application"]
