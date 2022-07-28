#!/bin/bash
servers=('asgi' 'daphne' 'gunicorn' 'hypercorn' 'uvicorn')
for server in "${servers[@]}";
do
    docker build -t "$server" -f "dockerfiles/$server.dockerfile" .
done
