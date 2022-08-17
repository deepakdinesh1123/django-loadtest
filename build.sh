#!/bin/bash
servers=('asgi' 'daphne' 'hypercorn' 'uvicorn')
for server in "${servers[@]}";
do
    docker build -t "$server" -f "dockerfiles/$server.dockerfile" .
done
