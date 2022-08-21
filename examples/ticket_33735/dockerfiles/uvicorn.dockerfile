FROM python:3.10-slim-bullseye

ENV DJANGO_SUPERUSER_USERNAME admin
ENV DJANGO_SUPERUSER_PASSWORD Admin@1234
ENV DJANGO_SUPERUSER_EMAIL admin@mail.com

COPY examples/ticket_33735 ticket_33735/
WORKDIR /ticket_33735/

RUN apt-get -y update && apt -y upgrade
RUN apt-get -y install git
RUN pip install git+https://github.com/django/django.git@refs/pull/14652/head
RUN pip install uvicorn pyyaml
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser --noinput
RUN python manage.py loaddata initial

ENTRYPOINT [ "uvicorn", "--host", "0.0.0.0" , "--port", "8000", "--workers", "4", "ticket_33735.asgi:application"]
