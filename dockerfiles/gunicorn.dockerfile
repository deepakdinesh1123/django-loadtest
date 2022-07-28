FROM python:3.10-slim-bullseye

COPY ../prod prod
COPY ../config/gunicorn_conf.py prod
WORKDIR /prod

RUN pip install django
RUN pip install gunicorn
RUN python manage.py makemigrations
RUN python manage.py migrate

ENTRYPOINT [ "gunicorn", "-c" , "gunicorn_conf.py", "prod.wsgi:application"]
