# django-loadtest

This repository conatins a sample Django project that it will used to benchmark different ASGI servers and the gunicorn server.
## How to run

- Install docker
- Create a virtual environment and install [locust](https://locust.io/)
- If you are on a linux machine 
    - run the following commands in the root directory
        ```
        bash build.sh
        bash loadtest.sh
        ```
- If you are on a Windows machine
    - Build the images for all the files in the `dockerfiles` directory
    - Load test each server one by one using the command
        ```
        locust --headless --users 100 --spawn-rate 10 -t 60s -H http://localhost:8000 -f loadtest.py
        ```
