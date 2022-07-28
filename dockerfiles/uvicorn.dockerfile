FROM python:3.10-slim-bullseye

COPY ../prod prod
WORKDIR /prod

RUN apt-get -y update && apt -y upgrade
RUN apt-get -y install git
RUN pip install git+https://github.com/django/django.git@refs/pull/14652/head
RUN pip install uvicorn
RUN python manage.py makemigrations
RUN python manage.py migrate

ENTRYPOINT [ "uvicorn", "--host", "0.0.0.0" , "--port", "8000", "--workers", "4", "prod.asgi:application"]
