FROM python:3.10-slim-bullseye

COPY ../prod prod
COPY ../config/hypercorn_conf.py prod
WORKDIR /prod

RUN apt-get -y update && apt -y upgrade
RUN apt-get -y install git
RUN pip install git+https://github.com/django/django.git@refs/pull/14652/head
RUN pip install hypercorn
RUN python manage.py makemigrations
RUN python manage.py migrate

ENTRYPOINT [ "hypercorn", "--config", "file:hypercorn_conf.py" , "prod.asgi:application"]
