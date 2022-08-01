FROM python:3.10-slim-bullseye

ENV DJANGO_SUPERUSER_USERNAME admin
ENV DJANGO_SUPERUSER_PASSWORD Admin@1234
ENV DJANGO_SUPERUSER_EMAIL admin@mail.com

COPY ../prod prod
COPY ../config/gunicorn_conf.py prod
WORKDIR /prod

RUN pip install django
RUN pip install gunicorn
RUN pip install pyyaml
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser --noinput
RUN python manage.py loaddata initial

ENTRYPOINT [ "gunicorn", "-c" , "gunicorn_conf.py", "prod.wsgi:application"]
