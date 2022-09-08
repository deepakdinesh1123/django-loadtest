# django-loadtest
This repository conatins a sample Django project that it will used to benchmark different ASGI servers and the gunicorn server.

# How to add a project 

- Create a django project in the examples folder by using the project template in `project_template.zip` with the command

```
django-admin startproject --template=../template/project_template.zip project_name
```
- Modify the existing dockerfiles in the "`examples\project_name\dockerfiles`" directory
- Add other dockerfiles to the same directory
- The name of the dockerfile should be in the format "`server_name.dockerfile`"

# How to run

- Install docker
- Create a python virtual environment and install [locust](https://locust.io/)
- Load test projects using the commands 

```bash
python build.py project_name_1 project_name_2 project_name_3
python loadtest.py project_name_1 project_name_2 project_name_3
```

# Modify Locust configuration

- The locust configuration is stored in the file `locust.conf` modify the file to change the default locust configuration

