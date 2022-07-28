#!/bin/bash
servers=('asgi' 'daphne' 'gunicorn' 'hypercorn' 'uvicorn')
for server in "${servers[@]}";
do
    docker run --name "$server-server" -d -p 8000:8000 --rm "$server"
    locust --headless --users 100 --spawn-rate 10 -t 60s -H http://localhost:8000 -f loadtest.py
    docker stop "$server-server"
done

